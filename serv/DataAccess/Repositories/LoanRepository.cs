using DataAccess.Interfaces;
using DataAccess.Models;
using Microsoft.EntityFrameworkCore;


namespace DataAccess.Repositories
{
    public class LoanRepository : GenericRepository<Loan>, ILoanRepository
    {
        public LoanRepository(CursContext context) : base(context){ }
        public IEnumerable<object> GetCustomerLoansDetailed()
        {
            return Context.Loans
                .Include(l => l.Customer)
                .Include(l => l.Loantype)
                .Select(l => new
                {
                    CustomerName = l.Customer.Name,
                    LoanAmount = l.Amount,
                    InterestRate = l.Interestrate,
                    LoanType = l.Loantype.Typename
                }).ToList();
        }

        public IEnumerable<object> GetLoansWithStatus()
        {
            return Context.Loans
                .Include(l => l.Status)
                .Select(l => new
                {
                    LoanId = l.Id,
                    Amount = l.Amount,
                    Status = l.Status.Statusname
                }).ToList();
        }

        public IEnumerable<object> GetPaymentSchedulesWithCustomers()
        {
            return Context.PaymentSchedules
                .Include(ps => ps.Loan)
                    .ThenInclude(l => l.Customer)
                .Select(ps => new
                {
                    DueDate = ps.Duedate,
                    Amount = ps.Amount,
                    CustomerName = ps.Loan.Customer.Name
                }).ToList();
        }

        public IEnumerable<object> GetPaymentsWithTypes()
        {
            return Context.Payments
                .Include(p => p.Loan)
                .Include(p => p.Paymenttype)
                .Select(p => new
                {
                    PaymentDate = p.Paymentdate,
                    Amount = p.Amount,
                    PaymentType = p.Paymenttype.Typename,
                    LoanId = p.Loan.Id
                }).ToList();
        }

        public IEnumerable<object> GetContractsWithCustomerInfo()
        {
            return Context.Contracts
                .Include(c => c.Loan)
                    .ThenInclude(l => l.Customer)
                .Select(c => new
                {
                    ContractId = c.Id,
                    ContractDate = c.Contractdate,
                    CustomerName = c.Loan.Customer.Name
                }).ToList();
        }

        public IEnumerable<object> GetLoanPaymentSums()
        {
            return Context.Loans
                .Include(l => l.Payments)
                .Include(l => l.Customer)
                .Select(l => new
                {
                    LoanId = l.Id,
                    Customer = l.Customer.Name,
                    TotalPaid = l.Payments.Sum(p => p.Amount)
                }).ToList();
        }

        public IEnumerable<object> GetEmployeesWithPositions()
        {
            return Context.Employees
                .Include(e => e.Position)
                .Select(e => new
                {
                    EmployeeName = e.Name,
                    Position = e.Position.Positionname
                }).ToList();
        }

        public IEnumerable<object> GetLoanDatesAndTypes()
        {
            return Context.Loans
                .Include(l => l.Loantype)
                .Select(l => new
                {
                    LoanId = l.Id,
                    CreationDate = l.Creationtime,
                    Type = l.Loantype.Typename
                }).ToList();
        }

        public IEnumerable<object> GetCustomersWithTypes()
        {
            return Context.Customers
                .Include(c => c.Customertype)
                .Select(c => new
                {
                    Name = c.Name,
                    Type = c.Customertype.Typename
                }).ToList();
        }

        public IEnumerable<object> GetLoanTypeStatistics()
        {
            return Context.Loans
                .Include(l => l.Loantype)
                .GroupBy(l => l.Loantype.Typename)
                .Select(g => new
                {
                    LoanType = g.Key,
                    LoanCount = g.Count(),
                    TotalAmount = g.Sum(l => l.Amount)
                })
                .ToList();
        }


    }
}
