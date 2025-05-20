using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentService _paymentService;

        public PaymentController(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<PaymentDto>>> GetAll()
        {
            var result = await _paymentService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<PaymentDto>> GetById(int id)
        {
            var result = await _paymentService.GetByIdAsync(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

        [HttpGet("customer/{id}")]
        public async Task<ActionResult<IEnumerable<PaymentDto>>> GetByCustomerId(int id)
        {
            var result = await _paymentService.GetByCustomerIdAsync(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] PaymentDto dto)
        {
            try
            {
                await _paymentService.CreateAsync(dto);
                return Ok();
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] PaymentDto dto)
        {
            try
            {
                await _paymentService.UpdateAsync(dto);
                return Ok();
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _paymentService.DeleteAsync(id);
            return Ok();
        }
    }
}
