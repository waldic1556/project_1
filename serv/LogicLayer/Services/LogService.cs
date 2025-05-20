using DataAccess.Models;
using LogicLayer.Interfaces;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicLayer.Services
{
    public class LogService : ILogService
    {
        private readonly CursContext _cursContext;

        public LogService(CursContext context)
        {
            _cursContext = context;
        }

        public async Task LogAsync(string userId, string action, string table, string? details = null)
        {

                var log = new UserLog
                {
                    UserId = userId,
                    Action = action,
                    TableName = table,
                    Details = details,
                    Timestamp = DateTime.UtcNow
                };

                _cursContext.UserLogs.Add(log);
                await _cursContext.SaveChangesAsync();
            
        }
    }
}
