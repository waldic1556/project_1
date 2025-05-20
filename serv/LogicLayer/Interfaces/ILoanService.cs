using DataAccess.DTOs;
using DataAccess.Models;
using Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicLayer.Interfaces
{
    public interface ILoanService
    {
        Task<IEnumerable<LoanResponseDTO>> GetAllAsync();
        Task<IEnumerable<LoanResponseDTO>> GetByCustomerIdAsync(int id);
        Task<LoanResponseDTO> GetByIdAsync(int id);
        Task CreateAsync(LoanResponseDTO dto);
        Task UpdateAsync(LoanResponseDTO dto);
        Task DeleteAsync(int id);
        IEnumerable<object> GetCustomerLoansDetailed();
        IEnumerable<object> GetLoansWithStatus();
        IEnumerable<object> GetPaymentSchedulesWithCustomers();
        IEnumerable<object> GetPaymentsWithTypes();
        IEnumerable<object> GetContractsWithCustomerInfo();
        IEnumerable<object> GetLoanPaymentSums();
        IEnumerable<object> GetEmployeesWithPositions();
        IEnumerable<object> GetLoanDatesAndTypes();
        IEnumerable<object> GetCustomersWithTypes();
        IEnumerable<object> GetLoanTypeStatistics();
    }
}
