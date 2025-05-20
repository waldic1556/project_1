using Lab5Database.Attributes;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using NpgsqlTypes;
using System.Diagnostics;
using System.Text;

namespace Lab5Database.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BackupController : ControllerBase
    {
        private readonly string _backupFolder;
        private readonly string _connectionString;
        private readonly IConfiguration _configuration;

        private readonly string _databaseName;
        private readonly string _databaseUser;
        private readonly string _databasePassword;
        private readonly string _databaseHost;

        public BackupController(IConfiguration configuration)
        {
            _configuration = configuration;
            _backupFolder = Path.Combine(Directory.GetCurrentDirectory(), "App_Data", "Backups");

            if (!Directory.Exists(_backupFolder))
            {
                Directory.CreateDirectory(_backupFolder);
            }

            _connectionString = _configuration.GetConnectionString("Local");

            var builder = new NpgsqlConnectionStringBuilder(_connectionString);
            _databaseName = builder.Database;
            _databaseUser = builder.Username;
            _databasePassword = builder.Password;
            _databaseHost = builder.Host;
        }

        [AuthorizeRole(1, 2)]
        [HttpPost("create")]
        public IActionResult CreateBackup()
        {
            var timestamp = DateTime.Now.ToString("yyyyMMdd_HHmmss");
            var backupFile = Path.Combine(_backupFolder, $"backup_{timestamp}.sql");

            var pgDumpPath = @"C:\Program Files\PostgreSQL\16\bin\pg_dump.exe";
            var command = $"pg_dump --clean -h {_databaseHost} -U {_databaseUser} -d {_databaseName} -F p -f \"{backupFile}\"";

            var processInfo = CreateProcess(command);

            var process = Process.Start(processInfo);
            process.WaitForExit();

            if (process.ExitCode == 0)
            {
                return Ok($"Backup created successfully: {Path.GetFileName(backupFile)}");
            } else
            {
                var error = process.StandardError.ReadToEnd();
                return StatusCode(500, $"Backup failed: {error}");
            }
        }
        [AuthorizeRole(1, 2)]
        [HttpGet("list")]
        public IActionResult ListBackups()
        {
            var files = Directory.GetFiles(_backupFolder, "*.sql")
                .Select(f => new
                {
                    FileName = Path.GetFileName(f),
                    CreatedAt = System.IO.File.GetCreationTime(f)
                })
                .OrderByDescending(f => f.CreatedAt)
                .ToList();

            return Ok(files);
        }

        [AuthorizeRole(1, 2)]
        [HttpDelete("delete/{fileName}")]
        public IActionResult DeleteBackup(string fileName)
        {
            var filePath = Path.Combine(_backupFolder, fileName);

            if (!System.IO.File.Exists(filePath))
            {
                return NotFound("Backup file not found");
            }

            System.IO.File.Delete(filePath);

            return Ok($"Backup {fileName} deleted successfully");
        }
        [AuthorizeRole(1, 2)]
        [HttpPost("restore/{fileName}")]
        public IActionResult RestoreBackup(string fileName)
        {
            var filePath = Path.Combine(_backupFolder, fileName);

            if (!System.IO.File.Exists(filePath))
                return NotFound("Backup file not found");

            if (new FileInfo(filePath).Length == 0)
                return BadRequest("Backup file is empty");
             
            var command = $"psql.exe -h {_databaseHost} -U {_databaseUser} -d {_databaseName} -f \"{filePath}\"";

            var processInfo = CreateProcess(command);

            using (var process = new Process { StartInfo = processInfo })
            {
                var outputBuilder = new StringBuilder();
                var errorBuilder = new StringBuilder();

                process.OutputDataReceived += (s, e) => { if (e.Data != null) outputBuilder.AppendLine(e.Data); };
                process.ErrorDataReceived += (s, e) => { if (e.Data != null) errorBuilder.AppendLine(e.Data); };

                process.Start();
                process.BeginOutputReadLine();
                process.BeginErrorReadLine();
                process.WaitForExit();

                var output = outputBuilder.ToString();
                var error = errorBuilder.ToString();

                if (process.ExitCode == 0)
                    return Ok($"Backup {fileName} restored successfully:\n{output}");
                else
                    return StatusCode(500, $"Restore failed:\n{error}");
            }
        }

        [AuthorizeRole(1, 2)]
        [HttpGet("{fileName}")]
        public IActionResult DownloadBackup(string fileName)
        {
            var filePath = Path.Combine(_backupFolder, fileName);

            if (!System.IO.File.Exists(filePath))
            {
                return NotFound("Файл не знайдено.");
            }

            var fileBytes = System.IO.File.ReadAllBytes(filePath);
            var contentType = "application/octet-stream";
            return File(fileBytes, contentType, fileName);
        }
        private ProcessStartInfo CreateProcess(string command)
        {
            var processInfo = new ProcessStartInfo
            {
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                UseShellExecute = false,
                CreateNoWindow = true,
                Environment = { ["PGPASSWORD"] = _databasePassword }
            };

            if (Environment.OSVersion.Platform == PlatformID.Win32NT)
            {
                processInfo.FileName = "cmd.exe";
                processInfo.Arguments = $"/c {command}";
            } else
            {
                processInfo.FileName = "/bin/bash";
                processInfo.Arguments = $"-c \"{command}\"";
            }

            return processInfo;
        }
    }
}

