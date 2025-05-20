using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;
using DataAccess.DTOs;
using Lab5Database.Attributes;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly ICustomerService _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        [AuthorizeRole(1, 2, 3)]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CustomerResponseDTO>>> GetAll()
        {
            var result = await _customerService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult<CustomerDto>> GetById(int id)
        {
            var result = await _customerService.GetByIdAsync(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

        [HttpPost]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult> Create([FromBody] CustomerResponseDTO dto)
        {
            try
            {
                int id = await _customerService.CreateAsync(dto);
                return Ok(new { id });
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [HttpPut]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult> Update([FromBody] CustomerResponseDTO dto)
        {
            try
            {
                await _customerService.UpdateAsync(dto);
                return Ok();
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [HttpDelete("{id}")]
        [AuthorizeRole(1, 2)]
        public async Task<ActionResult> Delete(int id)
        {
            try
            {
                await _customerService.DeleteAsync(id);
                return Ok();
            } catch
            {
                return NotFound();
            }
        }
    }
}
