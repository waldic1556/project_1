using Dtos;

namespace Services.Interfaces
{
    public interface ICustomerTypeService
    {
        Task<IEnumerable<CustomerTypeDto>> GetAllAsync();
        Task<CustomerTypeDto> GetByIdAsync(int id);
        Task CreateAsync(CustomerTypeDto dto);
        Task UpdateAsync(CustomerTypeDto dto);
        Task DeleteAsync(int id);
    }
}
