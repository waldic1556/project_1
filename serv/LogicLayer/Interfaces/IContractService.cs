using Dtos;

namespace Services.Interfaces
{
    public interface IContractService
    {
        Task<IEnumerable<ContractDto>> GetAllAsync();
        Task<ContractDto> GetByIdAsync(int id);
        Task CreateAsync(ContractDto dto);
        Task UpdateAsync(ContractDto dto);
        Task DeleteAsync(int id);
    }
}
