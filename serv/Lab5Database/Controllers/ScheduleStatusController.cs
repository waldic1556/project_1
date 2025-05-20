using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleStatusController : ControllerBase
    {
        private readonly IScheduleStatusService _scheduleStatusService;

        public ScheduleStatusController(IScheduleStatusService scheduleStatusService)
        {
            _scheduleStatusService = scheduleStatusService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ScheduleStatusDto>>> GetAll()
        {
            var result = await _scheduleStatusService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ScheduleStatusDto>> GetById(int id)
        {
            var result = await _scheduleStatusService.GetByIdAsync(id);
            if (result == null) return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] ScheduleStatusDto dto)
        {
            await _scheduleStatusService.CreateAsync(dto);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] ScheduleStatusDto dto)
        {
            await _scheduleStatusService.UpdateAsync(dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _scheduleStatusService.DeleteAsync(id);
            return Ok();
        }
    }
}
