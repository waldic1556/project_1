using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;
using DataAccess.DTOs;

namespace Services
{
    public class CustomerService : ICustomerService
    {
        private readonly ICustomerRepository _customerRepository;
        private readonly ICustomerTypeRepository _customerTypeRepository;

        public CustomerService(ICustomerRepository customerRepository, ICustomerTypeRepository customerTypeRepository)
        {
            _customerRepository = customerRepository;
            _customerTypeRepository = customerTypeRepository;
        }

        public async Task<IEnumerable<CustomerResponseDTO>> GetAllAsync()
        {
            var entities = _customerRepository.Get();

            return entities.Select(e => new CustomerResponseDTO
            {
                Id = e.Id,
                Name = e.Name,
                Dateofbirth = e.Dateofbirth,
                Phone = e.Phone,
                Type = _customerTypeRepository.FindById((int)e.Customertypeid).Typename

            });
        }

        public async Task<CustomerResponseDTO> GetByIdAsync(int id)
        {
            var entity = _customerRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null)
                return null;

            return new CustomerResponseDTO
            {
                Id = entity.Id,
                Name = entity.Name,
                Dateofbirth = entity.Dateofbirth,
                Phone = entity.Phone,
                Type = _customerTypeRepository.FindById((int)entity.Customertypeid).Typename
            };
        }

        public async Task<int> CreateAsync(CustomerResponseDTO dto)
        {
            var entity = new Customer
            {
                Id = dto.Id,
                Name = dto.Name,
                Dateofbirth = dto.Dateofbirth,
                Phone = dto.Phone,
                Customertypeid = int.Parse(dto.Type)
            };
            int id = _customerRepository.Insert(entity);
            return id;


        }

        public async Task UpdateAsync(CustomerResponseDTO dto)
        {
            var entity = new Customer
            {
                Id = dto.Id,
                Name = dto.Name,
                Dateofbirth = dto.Dateofbirth,
                Phone = dto.Phone,
                Customertypeid = int.Parse(dto.Type)
            };
            _customerRepository.Update(entity);
        }

        public async Task DeleteAsync(int id)
        {
            _customerRepository.Delete(id);
        }
    }
}
