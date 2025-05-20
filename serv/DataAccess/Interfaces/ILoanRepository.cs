using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface ILoanRepository : IGenericRepoitory<Loan>
    {
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
