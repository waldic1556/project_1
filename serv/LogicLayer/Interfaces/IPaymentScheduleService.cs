using Dtos;

namespace Services.Interfaces
{
    public interface IPaymentScheduleService
    {
        Task<IEnumerable<PaymentScheduleDto>> GetAllAsync();
        Task<PaymentScheduleDto> GetByIdAsync(int id);
        Task<IEnumerable<PaymentScheduleDto>> GetByLoanId(int id);
        Task CreateAsync(PaymentScheduleDto dto);
        Task UpdateAsync(PaymentScheduleDto dto);
        Task DeleteAsync(int id);
    }
}
