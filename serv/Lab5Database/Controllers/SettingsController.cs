
using DataAccess.Models;
using Lab5Database.Attributes;
using LogicLayer.Interfaces;
using LogicLayer.Services;
using Microsoft.AspNetCore.Mvc;

namespace Lab5Database.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SettingsController : ControllerBase
{
    private readonly IAccountingPeriodService _service;

    public SettingsController(IAccountingPeriodService service)
    {
        _service = service;
    }

    [AuthorizeRole(1)]
    [HttpGet("period")]
    public IActionResult GetPeriod()
    {
        return Ok(_service.GetPeriod());
    }

    [AuthorizeRole(1)]
    [HttpPost("period")]
    public IActionResult SetPeriod([FromBody] AccountingPeriodSettings settings)
    {
        _service.SetPeriod(settings);
        return Ok();
    }
}
