using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentScheduleController : ControllerBase
    {
        private readonly IPaymentScheduleService _paymentScheduleService;

        public PaymentScheduleController(IPaymentScheduleService paymentScheduleService)
        {
            _paymentScheduleService = paymentScheduleService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<PaymentScheduleDto>>> GetAll()
        {
            var result = await _paymentScheduleService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<PaymentScheduleDto>> GetById(int id)
        {
            var result = await _paymentScheduleService.GetByIdAsync(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        [HttpGet("loan/{id}")]
        public async Task<ActionResult<IEnumerable<PaymentScheduleDto>>> GetByLoanId(int id)
        {
            var result = await _paymentScheduleService.GetByLoanId(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] PaymentScheduleDto dto)
        {
            await _paymentScheduleService.CreateAsync(dto);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] PaymentScheduleDto dto)
        {
            await _paymentScheduleService.UpdateAsync(dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _paymentScheduleService.DeleteAsync(id);
            return Ok();
        }
    }
}
