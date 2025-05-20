using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;
using Dtos;
using Lab5Database.Attributes;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PositionController : ControllerBase
    {
        private readonly IPositionService _positionService;

        public PositionController(IPositionService positionService)
        {
            _positionService = positionService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<PositionDto>>> GetAll()
        {
            var result = await _positionService.GetAllAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<PositionDto>> GetById(int id)
        {
            var result = await _positionService.GetByIdAsync(id);
            if (result == null) return NotFound();
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] PositionDto dto)
        {
            await _positionService.CreateAsync(dto);
            return Ok();
        }

        [HttpPut]
        public async Task<ActionResult> Update([FromBody] PositionDto dto)
        {
            await _positionService.UpdateAsync(dto);
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _positionService.DeleteAsync(id);
            return Ok();
        }
    }
}
