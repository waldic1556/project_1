
using LogicLayer.Services;
using Microsoft.AspNetCore.Mvc;
using DataAccess.Models;
using System;
using System.Threading.Tasks;
using LogicLayer.Interfaces;
using Lab5Database.Attributes;

namespace Lab5Database.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UserLogController : ControllerBase
{
    private readonly IUserLogService _logService;

    public UserLogController(IUserLogService logService)
    {
        _logService = logService;
    }

    [HttpGet]
    [AuthorizeRole(1,2)]
    public async Task<IActionResult> GetAll()
    {
        var logs = await _logService.GetAllAsync();
        return Ok(logs);
    }

    [AuthorizeRole(1,2)]
    [HttpGet("filter")]
    public async Task<IActionResult> Filter([FromQuery] string? userId, [FromQuery] string? action, [FromQuery] DateTime? from, [FromQuery] DateTime? to)
    {
        var logs = await _logService.FilterAsync(userId, action, from, to);
        return Ok(logs);
    }
}
