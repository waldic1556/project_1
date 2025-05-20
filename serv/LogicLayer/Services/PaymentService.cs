using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;
using DataAccess.Repositories;

namespace Services
{
    public class PaymentService : IPaymentService
    {
        private readonly IPaymentRepository _paymentRepository;
        private readonly IPaymentScheduleRepository _paymentScheduleRepository;
        private readonly ILoanRepository _loanRepository;

        public PaymentService(IPaymentRepository paymentRepository, ILoanRepository loanRepository, IPaymentScheduleRepository paymentScheduleRepository)
        {
            _paymentRepository = paymentRepository;
            _loanRepository = loanRepository;
            _paymentScheduleRepository = paymentScheduleRepository;

        }

        public async Task<IEnumerable<PaymentDto>> GetAllAsync()
        {
            var entities = _paymentRepository.Get();
            return entities.Select(e => new PaymentDto
            {
                Id = e.Id,
                Paymentdate = e.Paymentdate,
                Amount = e.Amount,
                LoanId = (int)e.Loanid,
                PaymentTypeId = (int)e.Paymenttypeid
            });
        }

        public async Task<PaymentDto> GetByIdAsync(int id)
        {
            var entity = _paymentRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null)
                return null;

            return new PaymentDto
            {
                Id = entity.Id,
                Paymentdate = entity.Paymentdate,
                Amount = entity.Amount,
                LoanId = (int)entity.Loanid,
                PaymentTypeId = (int)entity.Paymenttypeid
            };
        }

        public async Task CreateAsync(PaymentDto dto)
        {
            var entity = new Payment
            {
                Paymentdate = dto.Paymentdate,
                Amount = dto.Amount,
                Loanid = dto.LoanId,
                Paymenttypeid = dto.PaymentTypeId
            };
            _paymentRepository.Insert(entity);
            await UpdatePaymentSchedules((int)entity.Loanid, entity.Paymentdate, dto.Amount);
        }

        public async Task UpdateAsync(PaymentDto dto)
        {
            var old = _paymentRepository.FindById((int)dto.Id);
            var amount = old.Amount;
            old.Paymentdate = dto.Paymentdate;
            old.Amount = dto.Amount;
            old.Loanid = dto.LoanId;
            old.Paymenttypeid = dto.PaymentTypeId;


            _paymentRepository.Update(old);
            await UpdatePaymentSchedules((int)old.Loanid, old.Paymentdate, dto.Amount - amount);
        }

        public async Task DeleteAsync(int id)
        {
            var elem = _paymentRepository.FindById(id);
            _paymentRepository.Delete(id);
            await UpdatePaymentSchedules((int)elem.Loanid, elem.Paymentdate, -elem.Amount);
        }

        public async Task<IEnumerable<PaymentDto>> GetByCustomerIdAsync(int id)
        {
            List<PaymentDto> list = new List<PaymentDto>();
            var loans = _loanRepository.Get(item => item.Customerid == id);
            foreach (var loan in loans)
            {

                var entities = _paymentRepository.Get((item) => item.Loanid == loan.Id);

                foreach (var payment in entities)
                {
                    list.Add(new PaymentDto
                    {
                        Id = payment.Id,
                        Paymentdate = payment.Paymentdate,
                        Amount = payment.Amount,
                        LoanId = (int)payment.Loanid,
                        PaymentTypeId = (int)payment.Paymenttypeid
                    });
                }


            }

            return list.AsEnumerable();
        }


        public async Task UpdatePaymentSchedules(int loanId, DateOnly paymentDate, decimal paymentDelta)
        {
            var schedules = _paymentScheduleRepository
                .Get(s => s.Loanid == loanId)
                .OrderBy(s => s.Duedate)
                .ToList();

            decimal remainingDelta = paymentDelta;

            foreach (var schedule in schedules)
            {
                if (remainingDelta == 0)
                    break;

                if (remainingDelta > 0 && schedule.Statusid == 1)
                {
                    if (remainingDelta >= schedule.Amount)
                    {
                        schedule.Statusid = 2; 
                        remainingDelta -= schedule.Amount;
                        _paymentScheduleRepository.Update(schedule);
                    }
                } else if (remainingDelta < 0 && schedule.Statusid == 2)
                {
                    schedule.Statusid = 1; 
                    remainingDelta += schedule.Amount;
                    _paymentScheduleRepository.Update(schedule);
                }
            }
        }



    }
}
