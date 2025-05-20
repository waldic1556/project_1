using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;

namespace Services
{
    public class PaymentTypeService : IPaymentTypeService
    {
        private readonly IPaymentTypeRepository _paymentTypeRepository;

        public PaymentTypeService(IPaymentTypeRepository paymentTypeRepository)
        {
            _paymentTypeRepository = paymentTypeRepository;
        }

        public async Task<IEnumerable<PaymentTypeDto>> GetAllAsync()
        {
            var entities =   _paymentTypeRepository.Get();
            return entities.Select(e => new PaymentTypeDto
            {
                Id = e.Id,
                Typename = e.Typename,

            });
        }

        public async Task<PaymentTypeDto> GetByIdAsync(int id)
        {
            var entity =   _paymentTypeRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null) return null;

            return new PaymentTypeDto
            {
                Id = entity.Id,
                Typename = entity.Typename,

            };
        }

        public async Task CreateAsync(PaymentTypeDto dto)
        {
            var entity = new PaymentType
            {
                Id = dto.Id,
                Typename = dto.Typename,

            };
              _paymentTypeRepository.Insert(entity);
        }

        public async Task UpdateAsync(PaymentTypeDto dto)
        {
            var entity = new PaymentType
            {
                Id = dto.Id,
                Typename = dto.Typename,

            };
              _paymentTypeRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
              _paymentTypeRepository.Delete(id);
        }
    }
}
