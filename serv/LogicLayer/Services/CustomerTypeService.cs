using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;

namespace Services
{
    public class CustomerTypeService : ICustomerTypeService
    {
        private readonly ICustomerTypeRepository _customerTypeRepository;

        public CustomerTypeService(ICustomerTypeRepository customerTypeRepository)
        {
            _customerTypeRepository = customerTypeRepository;
        }

        public async Task<IEnumerable<CustomerTypeDto>> GetAllAsync()
        {
            var entities =   _customerTypeRepository.Get();
            return entities.Select(e => new CustomerTypeDto
            {
                Id = e.Id,
                Typename = e.Typename,

            });
        }

        public async Task<CustomerTypeDto> GetByIdAsync(int id)
        {
            var entity =   _customerTypeRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null) return null;

            return new CustomerTypeDto
            {
                Id = entity.Id,
                Typename = entity.Typename,

            };
        }

        public async Task CreateAsync(CustomerTypeDto dto)
        {
            var entity = new CustomerType
            {
                Id = dto.Id,
                Typename = dto.Typename,

            };
              _customerTypeRepository.Insert(entity);
        }

        public async Task UpdateAsync(CustomerTypeDto dto)
        {
            var entity = new CustomerType
            {
                Id = dto.Id,
                Typename = dto.Typename,

            };
              _customerTypeRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
              _customerTypeRepository.Delete(id);
        }
    }
}
