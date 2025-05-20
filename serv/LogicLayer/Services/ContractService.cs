using Services.Interfaces;

using Dtos;
using DataAccess.Models;
using DataAccess.Interfaces;

namespace Services
{
    public class ContractService : IContractService
    {
        private readonly IContractRepository _contractRepository;

        public ContractService(IContractRepository contractRepository)
        {
            _contractRepository = contractRepository;
        }

        public async Task<IEnumerable<ContractDto>> GetAllAsync()
        {
            var entities = _contractRepository.Get();
            return entities.Select(e => new ContractDto
            {
                Id = e.Id,
                Contractdate = e.Contractdate,

            });
        }

        public async Task<ContractDto> GetByIdAsync(int id)
        {
            var entity = _contractRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null)
                return null;

            return new ContractDto
            {
                Id = entity.Id,
                Contractdate = entity.Contractdate,

            };
        }

        public async Task CreateAsync(ContractDto dto)
        {
            var entity = new Contract
            {
                Id = dto.Id,
                Contractdate = dto.Contractdate,

            };
            _contractRepository.Insert(entity);
        }

        public async Task UpdateAsync(ContractDto dto)
        {
            var entity = new Contract
            {
                Id = dto.Id,
                Contractdate = dto.Contractdate,

            };
            _contractRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
            _contractRepository.Delete(id);
        }
    }
}
