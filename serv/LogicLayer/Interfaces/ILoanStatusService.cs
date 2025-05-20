using Dtos;

namespace Services.Interfaces
{
    public interface ILoanStatusService
    {
        Task<IEnumerable<LoanStatusDto>> GetAllAsync();
        Task<LoanStatusDto> GetByIdAsync(int id);
        Task CreateAsync(LoanStatusDto dto);
        Task UpdateAsync(LoanStatusDto dto);
        Task DeleteAsync(int id);
    }
}
