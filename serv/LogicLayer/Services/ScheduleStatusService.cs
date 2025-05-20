using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;

namespace Services
{
    public class ScheduleStatusService : IScheduleStatusService
    {
        private readonly IScheduleStatusRepository _scheduleStatusRepository;

        public ScheduleStatusService(IScheduleStatusRepository scheduleStatusRepository)
        {
            _scheduleStatusRepository = scheduleStatusRepository;
        }

        public async Task<IEnumerable<ScheduleStatusDto>> GetAllAsync()
        {
            var entities =   _scheduleStatusRepository.Get();
            return entities.Select(e => new ScheduleStatusDto
            {
                Id = e.Id,
                Statusname = e.Statusname,

            });
        }

        public async Task<ScheduleStatusDto> GetByIdAsync(int id)
        {
            var entity =   _scheduleStatusRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null) return null;

            return new ScheduleStatusDto
            {
                Id = entity.Id,
                Statusname = entity.Statusname,

            };
        }

        public async Task CreateAsync(ScheduleStatusDto dto)
        {
            var entity = new ScheduleStatus
            {
                Id = dto.Id,
                Statusname = dto.Statusname,

            };
              _scheduleStatusRepository.Insert(entity);
        }

        public async Task UpdateAsync(ScheduleStatusDto dto)
        {
            var entity = new ScheduleStatus
            {
                Id = dto.Id,
                Statusname = dto.Statusname,

            };
              _scheduleStatusRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
              _scheduleStatusRepository.Delete(id);
        }
    }
}
