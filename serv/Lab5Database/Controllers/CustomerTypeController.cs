using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerTypeController : ControllerBase
    {
        private readonly ICustomerTypeService _customerTypeService;

        public CustomerTypeController(ICustomerTypeService customerTypeService)
        {
            _customerTypeService = customerTypeService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<CustomerTypeDto>>> GetAll()
        {
            var result = await _customerTypeService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<CustomerTypeDto>> GetById(int id)
        {
            var result = await _customerTypeService.GetByIdAsync(id);
            if (result == null) return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] CustomerTypeDto dto)
        {
            await _customerTypeService.CreateAsync(dto);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] CustomerTypeDto dto)
        {
            await _customerTypeService.UpdateAsync(dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _customerTypeService.DeleteAsync(id);
            return Ok();
        }
    }
}
