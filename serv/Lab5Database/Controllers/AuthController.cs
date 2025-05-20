using DataAccess.DTOs;
using Lab5Database.Attributes;
using LogicLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;


namespace Lab5Database.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {

        private IUserService _userService;
        private readonly ILogger<AuthController> _logger;

        public AuthController(IUserService userService, ILogger<AuthController> logger)
        {
            this._userService = userService;
            this._logger = logger;
        }

        [HttpPost]
        [Route("/register")]
        public async Task<IActionResult> Register([FromBody] RegisterDTO value)
        {

            try
            {
                var result = await _userService.RegisterUserAsync(value);
                _logger.LogInformation($"User '{value.Login}' registered successfully.");
                return Ok(result);
            } catch (Exception ex)
            {
                _logger.LogError($"Error occurred during registration for user '{value.Login}': {ex.Message}");
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("/login")]
        public async Task<IActionResult> Login([FromBody] LoginDTO value)
        {
            try
            {
                var token = await _userService.AuthenticateUserAsync(value);
                _logger.LogInformation($"User '{value.Username}' logged in successfully.");
                return Ok(new { Token = token });
            } catch (UnauthorizedAccessException ex)
            {
                _logger.LogWarning($"Unauthorized access attempt for user '{value.Username}': {ex.Message}");
                return Unauthorized(ex.Message);
            } catch (Exception ex)
            {
                _logger.LogError($"Error occurred during login for user '{value.Username}': {ex.Message}");
                return BadRequest(ex.Message);
            }
        }
        [AuthorizeRole(1,2)]
        [HttpGet("isAdmin")]
        public async Task<IActionResult> IsAdmin([FromQuery] string username)
        {
            return Ok(  "Admin");
        }

        [AuthorizeRole(1,2,3)]
        [HttpGet("isManager")]
        public async Task<IActionResult> IsManager([FromQuery] string username)
        {
            return Ok(  "Manager");
        }

        [AuthorizeRole(1)]
        [HttpGet("isSuperAdmin")]
        public async Task<IActionResult> IsSuperAdmin([FromQuery] string username)
        {
            return Ok( "User");
        }



    }
}
