using Dtos;

namespace Services.Interfaces
{
    public interface IPaymentService
    {
        Task<IEnumerable<PaymentDto>> GetAllAsync();
        Task<PaymentDto> GetByIdAsync(int id);
        Task<IEnumerable<PaymentDto>> GetByCustomerIdAsync(int id);
        Task CreateAsync(PaymentDto dto);
        Task UpdateAsync(PaymentDto dto);
        Task UpdatePaymentSchedules(int loanId, DateOnly paymentDate, decimal paymentAmount);
        Task DeleteAsync(int id);
    }
}
