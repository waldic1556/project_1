using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;
using LogicLayer.Interfaces;
using DataAccess.DTOs;
using DataAccess.Repositories;

namespace Services
{
    public class LoanService : ILoanService
    {
        private readonly ILoanRepository _loanRepository;
        private readonly IPaymentScheduleRepository _paymentScheduleRepository;
        private readonly IPaymentRepository _paymentRepository;
        private readonly IPaymentService _paymentService;

        public LoanService(ILoanRepository loanRepository, IPaymentScheduleRepository paymentScheduleRepository, IPaymentRepository paymentRepository, IPaymentService paymentService)
        {
            _loanRepository = loanRepository;
            _paymentScheduleRepository = paymentScheduleRepository;
            _paymentRepository = paymentRepository;
            _paymentService = paymentService;
        }

        public async Task<IEnumerable<LoanResponseDTO>> GetAllAsync()
        {
            var entities = _loanRepository.Get();
            return entities.Select(e => new LoanResponseDTO
            {
                Id = e.Id,
                Amount = e.Amount,
                Interestrate = e.Interestrate,
                Termmonths = e.Termmonths,
                Loantypeid = e.Loantypeid,
                Customerid = e.Customerid,
                Statusid = e.Statusid,
                CreationTime = e.Creationtime
            });
        }

        public async Task<LoanResponseDTO> GetByIdAsync(int id)
        {
            var entity = _loanRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null)
                return null;

            return new LoanResponseDTO
            {
                Id = entity.Id,
                Amount = entity.Amount,
                Interestrate = entity.Interestrate,
                Termmonths = entity.Termmonths,
                Loantypeid = entity.Loantypeid,
                Statusid = entity.Statusid,
                Customerid = entity.Customerid,
                CreationTime = entity.Creationtime
            };
        }

        public async Task CreateAsync(LoanResponseDTO dto)
        {
            var entity = new Loan
            {
                Id = dto.Id,
                Amount = dto.Amount,
                Interestrate = dto.Interestrate,
                Termmonths = dto.Termmonths,
                Statusid = dto.Statusid,
                Loantypeid = dto.Loantypeid,
                Customerid = dto.Customerid,
                Creationtime = DateOnly.FromDateTime(DateTime.Now)

            };
            _loanRepository.Insert(entity);

            var monthlyPaymentAmount = Math.Round(entity.Amount / entity.Termmonths, 2);

            for (int i = 1; i <= entity.Termmonths; i++)
            {
                var schedule = new PaymentSchedule
                {
                    Loanid = entity.Id,
                    Duedate = entity.Creationtime.AddMonths(i),
                    Amount = monthlyPaymentAmount,
                    Statusid = 1
                };
                _paymentScheduleRepository.Insert(schedule);
            }
        }

        public async Task UpdateAsync(LoanResponseDTO dto)
        {
            Loan loan = _loanRepository.FindById(dto.Id);

            loan.Amount = dto.Amount;
            loan.Interestrate = dto.Interestrate;
            loan.Termmonths = dto.Termmonths;
            loan.Statusid = dto.Statusid;
            loan.Loantypeid = dto.Loantypeid;
            loan.Creationtime = DateOnly.FromDateTime(DateTime.Now);

            _loanRepository.Update(loan);

            var oldSchedules = _paymentScheduleRepository.Get(s => s.Loanid == dto.Id);
            foreach (var schedule in oldSchedules)
            {
                _paymentScheduleRepository.Delete(schedule.Id);
            }

            var monthlyPaymentAmount = Math.Round(dto.Amount / dto.Termmonths, 2);

            for (int i = 1; i <= dto.Termmonths; i++)
            {
                var schedule = new PaymentSchedule
                {
                    Loanid = dto.Id,
                    Duedate = dto.CreationTime.AddMonths(i),
                    Amount = monthlyPaymentAmount,
                    Statusid = 1
                };
                _paymentScheduleRepository.Insert(schedule);
            }
            var payments = _paymentRepository.Get(s => s.Loanid == dto.Id);
            foreach(var payment in payments)
            {
             await _paymentService.UpdatePaymentSchedules(dto.Id, payment.Paymentdate,payment.Amount);

            }
        }

        public async Task DeleteAsync(int id)
        {
            try
            {

                _loanRepository.Delete(id);
            } catch (Exception ex)
            {
            }
        }

        public async Task<IEnumerable<LoanResponseDTO>> GetByCustomerIdAsync(int id)
        {
            var entities = _loanRepository.Get(item => item.Customerid == id);
            return entities.Select(e => new LoanResponseDTO
            {
                Id = e.Id,
                Amount = e.Amount,
                Interestrate = e.Interestrate,
                Termmonths = e.Termmonths,
                Loantypeid = e.Loantypeid,
                Statusid = e.Statusid,
                CreationTime = e.Creationtime
            });
        }
        public IEnumerable<object> GetCustomerLoansDetailed() => _loanRepository.GetCustomerLoansDetailed();

        public IEnumerable<object> GetLoansWithStatus() => _loanRepository.GetLoansWithStatus();

        public IEnumerable<object> GetPaymentSchedulesWithCustomers() => _loanRepository.GetPaymentSchedulesWithCustomers();

        public IEnumerable<object> GetPaymentsWithTypes() => _loanRepository.GetPaymentsWithTypes();

        public IEnumerable<object> GetContractsWithCustomerInfo() => _loanRepository.GetContractsWithCustomerInfo();

        public IEnumerable<object> GetLoanPaymentSums() => _loanRepository.GetLoanPaymentSums();

        public IEnumerable<object> GetEmployeesWithPositions() => _loanRepository.GetEmployeesWithPositions();

        public IEnumerable<object> GetLoanDatesAndTypes() => _loanRepository.GetLoanDatesAndTypes();

        public IEnumerable<object> GetCustomersWithTypes() => _loanRepository.GetCustomersWithTypes();

        public IEnumerable<object> GetLoanTypeStatistics() => _loanRepository.GetLoanTypeStatistics();
    }
}
