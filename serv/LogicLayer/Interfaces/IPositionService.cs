using Dtos;

namespace Services.Interfaces
{
    public interface IPositionService
    {
        Task<IEnumerable<PositionDto>> GetAllAsync();
        Task<PositionDto> GetByIdAsync(int id);
        Task CreateAsync(PositionDto dto);
        Task UpdateAsync(PositionDto dto);
        Task DeleteAsync(int id);
    }
}
