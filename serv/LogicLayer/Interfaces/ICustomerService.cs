using DataAccess.DTOs;
using Dtos;

namespace Services.Interfaces
{
    public interface ICustomerService
    {
        Task<IEnumerable<CustomerResponseDTO>> GetAllAsync();
        Task<CustomerResponseDTO> GetByIdAsync(int id);
        Task<int> CreateAsync(CustomerResponseDTO dto);
        Task UpdateAsync(CustomerResponseDTO dto);
        Task DeleteAsync(int id);
    }
}
