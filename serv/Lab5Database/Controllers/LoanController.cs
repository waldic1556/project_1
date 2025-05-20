using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;
using LogicLayer.Interfaces;
using DataAccess.DTOs;
using Lab5Database.Attributes;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoanController : ControllerBase
    {
        private readonly ILoanService _loanService;

        public LoanController(ILoanService loanService)
        {
            _loanService = loanService;
        }

        [HttpGet]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult<IEnumerable<LoanResponseDTO>>> GetAll()
        {
            var result = await _loanService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("customer/{id}")]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult<LoanResponseDTO>> GetByCustomerId(int id)
        {
            var result = await _loanService.GetByCustomerIdAsync(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }
        [HttpGet("{id}")]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult<LoanResponseDTO>> GetById(int id)
        {
            var result = await _loanService.GetByIdAsync(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

        [HttpPost]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult> Create([FromBody] LoanResponseDTO dto)
        {
            try
            {
                await _loanService.CreateAsync(dto);
                return Ok();
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [HttpPut]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult> Update([FromBody] LoanResponseDTO dto)
        {
            try
            {
                await _loanService.UpdateAsync(dto);
                return Ok();
            } catch (Exception e)
            {
                return BadRequest("Invalid");
            }
        }

        [HttpDelete("{id}")]
        [AuthorizeRole(1, 2, 3)]
        public async Task<ActionResult> Delete(int id)
        {
            await _loanService.DeleteAsync(id);
            return Ok();
        }

        [HttpGet("customer-loans")]
        public IActionResult GetCustomerLoansDetailed() => Ok(_loanService.GetCustomerLoansDetailed());

        [HttpGet("loans-with-status")]
        public IActionResult GetLoansWithStatus() => Ok(_loanService.GetLoansWithStatus());

        [HttpGet("schedules-with-customers")]
        public IActionResult GetPaymentSchedulesWithCustomers() => Ok(_loanService.GetPaymentSchedulesWithCustomers());

        [HttpGet("payments-with-types")]
        public IActionResult GetPaymentsWithTypes() => Ok(_loanService.GetPaymentsWithTypes());

        [HttpGet("contracts-with-customers")]
        public IActionResult GetContractsWithCustomerInfo() => Ok(_loanService.GetContractsWithCustomerInfo());

        [HttpGet("loan-payment-sums")]
        public IActionResult GetLoanPaymentSums() => Ok(_loanService.GetLoanPaymentSums());

        [HttpGet("employees-with-positions")]
        public IActionResult GetEmployeesWithPositions() => Ok(_loanService.GetEmployeesWithPositions());

        [HttpGet("loan-dates-types")]
        public IActionResult GetLoanDatesAndTypes() => Ok(_loanService.GetLoanDatesAndTypes());

        [HttpGet("customers-with-types")]
        public IActionResult GetCustomersWithTypes() => Ok(_loanService.GetCustomersWithTypes());

        [HttpGet("schedules-with-status")]
        public IActionResult GetLoanTypeStatistics() => Ok(_loanService.GetLoanTypeStatistics());
    }
}
