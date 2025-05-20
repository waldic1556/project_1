using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;

namespace Services
{
    public class PaymentScheduleService : IPaymentScheduleService
    {
        private readonly IPaymentScheduleRepository _paymentScheduleRepository;

        public PaymentScheduleService(IPaymentScheduleRepository paymentScheduleRepository)
        {
            _paymentScheduleRepository = paymentScheduleRepository;
        }

        public async Task<IEnumerable<PaymentScheduleDto>> GetAllAsync()
        {
            var entities =   _paymentScheduleRepository.Get();
            return entities.Select(e => new PaymentScheduleDto
            {
                Id = e.Id,
                Duedate = e.Duedate,
                Amount = e.Amount,

            });
        }

        public async Task<PaymentScheduleDto> GetByIdAsync(int id)
        {
            var entity =   _paymentScheduleRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null) return null;

            return new PaymentScheduleDto
            {
                Id = entity.Id,
                Duedate = entity.Duedate,
                Amount = entity.Amount,

            };
        }

        public async Task CreateAsync(PaymentScheduleDto dto)
        {
            var entity = new PaymentSchedule
            {
                Id = dto.Id,
                Duedate = dto.Duedate,
                Amount = dto.Amount,

            };
              _paymentScheduleRepository.Insert(entity);
        }

        public async Task UpdateAsync(PaymentScheduleDto dto)
        {
            var entity = new PaymentSchedule
            {
                Id = dto.Id,
                Duedate = dto.Duedate,
                Amount = dto.Amount,

            };
              _paymentScheduleRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
              _paymentScheduleRepository.Delete(id);
        }

        public async Task<IEnumerable<PaymentScheduleDto>> GetByLoanId(int id)
        {
            var entities = _paymentScheduleRepository.Get((item) => item.Loanid == id);
           
            return entities.Select(e => new PaymentScheduleDto
            {
                Id = e.Id,
                Duedate = e.Duedate,
                Amount = e.Amount,
                Loanid= e.Loanid,
                Statusid=e.Statusid
            });
        }
    }
}
