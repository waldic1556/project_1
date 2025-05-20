using DataAccess.DTOs;
using Dtos;

namespace Services.Interfaces
{
    public interface IEmployeeService
    {
        Task<IEnumerable<EmployeeResponseDTO>> GetAllAsync();
        Task<EmployeeResponseDTO> GetByIdAsync(int id);
        Task CreateAsync(EmployeeResponseDTO dto);
        Task UpdateAsync(EmployeeResponseDTO dto);
        Task DeleteAsync(int id);
    }
}
