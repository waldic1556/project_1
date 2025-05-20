using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoanStatusController : ControllerBase
    {
        private readonly ILoanStatusService _loanStatusService;

        public LoanStatusController(ILoanStatusService loanStatusService)
        {
            _loanStatusService = loanStatusService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<LoanStatusDto>>> GetAll()
        {
            var result = await _loanStatusService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<LoanStatusDto>> GetById(int id)
        {
            var result = await _loanStatusService.GetByIdAsync(id);
            if (result == null) return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] LoanStatusDto dto)
        {
            await _loanStatusService.CreateAsync(dto);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] LoanStatusDto dto)
        {
            await _loanStatusService.UpdateAsync(dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _loanStatusService.DeleteAsync(id);
            return Ok();
        }
    }
}
