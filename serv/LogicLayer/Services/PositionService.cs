using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;

namespace Services
{
    public class PositionService : IPositionService
    {
        private readonly IPositionRepository _positionRepository;

        public PositionService(IPositionRepository positionRepository)
        {
            _positionRepository = positionRepository;
        }

        public async Task<IEnumerable<PositionDto>> GetAllAsync()
        {
            var entities =   _positionRepository.Get();
            return entities.Select(e => new PositionDto
            {
                Id = e.Id,
                Positionname = e.Positionname,

            });
        }

        public async Task<PositionDto> GetByIdAsync(int id)
        {
            var entity =   _positionRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null) return null;

            return new PositionDto
            {
                Id = entity.Id,
                Positionname = entity.Positionname,

            };
        }

        public async Task CreateAsync(PositionDto dto)
        {
            var entity = new Position
            {
                Id = dto.Id,
                Positionname = dto.Positionname,

            };
              _positionRepository.Insert(entity);
        }

        public async Task UpdateAsync(PositionDto dto)
        {
            var entity = new Position
            {
                Id = dto.Id,
                Positionname = dto.Positionname,

            };
              _positionRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
              _positionRepository.Delete(id);
        }
    }
}
