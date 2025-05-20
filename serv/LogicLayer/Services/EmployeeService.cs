using Services.Interfaces;
using DataAccess.Models;
using DataAccess.Interfaces;
using Dtos;
using DataAccess.DTOs;

namespace Services
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IUserRepository _employeeRepository;
        private readonly IPositionRepository _positionRepository;

        public EmployeeService(IUserRepository employeeRepository, IPositionRepository positionRepository)
        {
            _employeeRepository = employeeRepository;
            _positionRepository = positionRepository;
        }

        public async Task<IEnumerable<EmployeeResponseDTO>> GetAllAsync()
        {
            var entities = _employeeRepository.Get();
            return entities.Select(e => new EmployeeResponseDTO
            {
                Id = e.Id,
                Name = e.Name,
                Login = e.Login,
                Position = _positionRepository.FindById((int)e.Positionid).Positionname

            });
        }

        public async Task<EmployeeResponseDTO> GetByIdAsync(int id)
        {
            var entity = _employeeRepository.Get((item) => item.Id == id).FirstOrDefault();
            if (entity == null)
                return null;

            return new EmployeeResponseDTO
            {
                Id = entity.Id,
                Name = entity.Name,
                Login = entity.Login,
                Position = _positionRepository.FindById((int)entity.Positionid).Positionname
            };
        }

        public async Task CreateAsync(EmployeeResponseDTO dto)
        {
            var entity = new Employee
            {
                Id = dto.Id,
                Name = dto.Name,
                Login = dto.Login,
                Password = BCrypt.Net.BCrypt.HashPassword(dto.Password),
                Positionid = this._positionRepository.FindById(int.Parse(dto.Position)).Id
            };
            _employeeRepository.Insert(entity);
        }

        public async Task UpdateAsync(EmployeeResponseDTO dto)
        {

            if (dto.Password.Equals(""))
            {
                var empl = this._employeeRepository.FindById(dto.Id);
                
                empl.Login = dto.Login;
                empl.Name = dto.Name;
                empl.Positionid = this._positionRepository.FindById(int.Parse(dto.Position)).Id;
               
                _employeeRepository.Update(empl);
            } else
            {

                var entity = new Employee
                {
                    Id = dto.Id,
                    Name = dto.Name,
                    Login = dto.Login,
                    Password = BCrypt.Net.BCrypt.HashPassword(dto.Password),
                    Positionid = this._positionRepository.FindById(int.Parse(dto.Position)).Id
                };
                _employeeRepository.Update(entity);
            }
        }

        public async Task DeleteAsync(int id)
        {
            _employeeRepository.Delete(id);
        }
    }
}
