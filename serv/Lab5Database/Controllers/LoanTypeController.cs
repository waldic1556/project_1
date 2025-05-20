using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoanTypeController : ControllerBase
    {
        private readonly ILoanTypeService _loanTypeService;

        public LoanTypeController(ILoanTypeService loanTypeService)
        {
            _loanTypeService = loanTypeService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<LoanTypeDto>>> GetAll()
        {
            var result = await _loanTypeService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<LoanTypeDto>> GetById(int id)
        {
            var result = await _loanTypeService.GetByIdAsync(id);
            if (result == null) return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] LoanTypeDto dto)
        {
            await _loanTypeService.CreateAsync(dto);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] LoanTypeDto dto)
        {
            await _loanTypeService.UpdateAsync(dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _loanTypeService.DeleteAsync(id);
            return Ok();
        }
    }
}
