using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;

namespace Services
{
    public class LoanTypeService : ILoanTypeService
    {
        private readonly ILoanTypeRepository _loanTypeRepository;

        public LoanTypeService(ILoanTypeRepository loanTypeRepository)
        {
            _loanTypeRepository = loanTypeRepository;
        }

        public async Task<IEnumerable<LoanTypeDto>> GetAllAsync()
        {
            var entities =   _loanTypeRepository.Get();
            return entities.Select(e => new LoanTypeDto
            {
                Id = e.Id,
                Typename = e.Typename,

            });
        }

        public async Task<LoanTypeDto> GetByIdAsync(int id)
        {
            var entity =   _loanTypeRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null) return null;

            return new LoanTypeDto
            {
                Id = entity.Id,
                Typename = entity.Typename,

            };
        }

        public async Task CreateAsync(LoanTypeDto dto)
        {
            var entity = new LoanType
            {
                Id = dto.Id,
                Typename = dto.Typename,

            };
              _loanTypeRepository.Insert(entity);
        }

        public async Task UpdateAsync(LoanTypeDto dto)
        {
            var entity = new LoanType
            {
                Id = dto.Id,
                Typename = dto.Typename,

            };
              _loanTypeRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
              _loanTypeRepository.Delete(id);
        }
    }
}
