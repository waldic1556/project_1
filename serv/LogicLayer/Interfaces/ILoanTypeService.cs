using Dtos;

namespace Services.Interfaces
{
    public interface ILoanTypeService
    {
        Task<IEnumerable<LoanTypeDto>> GetAllAsync();
        Task<LoanTypeDto> GetByIdAsync(int id);
        Task CreateAsync(LoanTypeDto dto);
        Task UpdateAsync(LoanTypeDto dto);
        Task DeleteAsync(int id);
    }
}
