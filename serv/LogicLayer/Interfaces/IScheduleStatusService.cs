using Dtos;

namespace Services.Interfaces
{
    public interface IScheduleStatusService
    {
        Task<IEnumerable<ScheduleStatusDto>> GetAllAsync();
        Task<ScheduleStatusDto> GetByIdAsync(int id);
        Task CreateAsync(ScheduleStatusDto dto);
        Task UpdateAsync(ScheduleStatusDto dto);
        Task DeleteAsync(int id);
    }
}
