using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;

namespace Services
{
    public class LoanStatusService : ILoanStatusService
    {
        private readonly ILoanStatusRepository _loanStatusRepository;

        public LoanStatusService(ILoanStatusRepository loanStatusRepository)
        {
            _loanStatusRepository = loanStatusRepository;
        }

        public async Task<IEnumerable<LoanStatusDto>> GetAllAsync()
        {
            var entities = _loanStatusRepository.Get();
            return entities.Select(e => new LoanStatusDto
            {
                Id = e.Id,
                Statusname = e.Statusname,

            });
        }

        public async Task<LoanStatusDto> GetByIdAsync(int id)
        {
            var entity = _loanStatusRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null)
                return null;

            return new LoanStatusDto
            {
                Id = entity.Id,
                Statusname = entity.Statusname,

            };
        }

        public async Task CreateAsync(LoanStatusDto dto)
        {
            var entity = new LoanStatus
            {
                Id = dto.Id,
                Statusname = dto.Statusname,

            };
            _loanStatusRepository.Insert(entity);
        }

        public async Task UpdateAsync(LoanStatusDto dto)
        {
            var entity = new LoanStatus
            {
                Id = dto.Id,
                Statusname = dto.Statusname,

            };
            _loanStatusRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {

            _loanStatusRepository.Delete(id);
        }
    }
}
