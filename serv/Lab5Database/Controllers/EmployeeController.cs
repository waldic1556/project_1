using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;
using DataAccess.DTOs;
using System.Text.RegularExpressions;
using Lab5Database.Attributes;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeService _employeeService;

        public EmployeeController(IEmployeeService employeeService)
        {
            _employeeService = employeeService;
        }


        [AuthorizeRole(1)]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EmployeeResponseDTO>>> GetAll()
        {
            var result = await _employeeService.GetAllAsync();
            return Ok(result);
        }


        [AuthorizeRole(1)]
        [HttpGet("{id}")]
        public async Task<ActionResult<EmployeeResponseDTO>> GetById(int id)
        {
            var result = await _employeeService.GetByIdAsync(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

        [AuthorizeRole(1)]
        [HttpPost]
        public async Task<ActionResult> Create([FromBody] EmployeeResponseDTO dto)
        {
            try
            {

                bool isValid = Regex.IsMatch(dto.Password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$");
                if (!isValid && !string.IsNullOrEmpty(dto.Password))
                {
                    return BadRequest("Invalid password");
                }
                await _employeeService.CreateAsync(dto);
                return Ok();
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [AuthorizeRole(1)]
        [HttpPut]
        public async Task<ActionResult> Update([FromBody] EmployeeResponseDTO dto)
        {
            try
            {
                bool isValid = Regex.IsMatch(dto.Password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$");
                if (!isValid && !string.IsNullOrEmpty(dto.Password))
                {
                    return BadRequest("Invalid password");
                }
                await _employeeService.UpdateAsync(dto);
                return Ok();
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [AuthorizeRole(1)]
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _employeeService.DeleteAsync(id);
            return Ok();
        }
    }
}
