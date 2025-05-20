using Dtos;

namespace Services.Interfaces
{
    public interface IPaymentTypeService
    {
        Task<IEnumerable<PaymentTypeDto>> GetAllAsync();
        Task<PaymentTypeDto> GetByIdAsync(int id);
        Task CreateAsync(PaymentTypeDto dto);
        Task UpdateAsync(PaymentTypeDto dto);
        Task DeleteAsync(int id);
    }
}
