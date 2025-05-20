using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContractController : ControllerBase
    {
        private readonly IContractService _contractService;

        public ContractController(IContractService contractService)
        {
            _contractService = contractService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ContractDto>>> GetAll()
        {
            var result = await _contractService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ContractDto>> GetById(int id)
        {
            var result = await _contractService.GetByIdAsync(id);
            if (result == null) return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] ContractDto dto)
        {
            await _contractService.CreateAsync(dto);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] ContractDto dto)
        {
            await _contractService.UpdateAsync(dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _contractService.DeleteAsync(id);
            return Ok();
        }
    }
}
