using DataAccess.DTOs;
using DataAccess.Interfaces;
using DataAccess.Models;
using LogicLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicLayer.Services
{
    public class UserService : IUserService
    {
        private readonly IJWTService _jwtTokenService;
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository repository, IJWTService jwtTokenService)
        {
            _userRepository = repository;
            _jwtTokenService = jwtTokenService;
        }
        public async Task<string> RegisterUserAsync(RegisterDTO registerDto)
        {

            if (_userRepository.Get().ToList().Any(u => u.Login == registerDto.Login))
            {
                throw new Exception("Username or Email already exists.");
            }

            var user = new Employee()
            {
                Name = registerDto.Name,
                Login = registerDto.Login,
                Password = BCrypt.Net.BCrypt.HashPassword(registerDto.Password),
                Positionid = registerDto.PositionId,
            };

            _userRepository.Insert(user);


            return "User registered successfully.";
        }

        public async Task<string> AuthenticateUserAsync(LoginDTO loginDto)
        {
            var user = _userRepository.Get().ToList().FirstOrDefault(u => u.Login == loginDto.Username);

            if (user == null || !BCrypt.Net.BCrypt.Verify(loginDto.Password, user.Password))
            {
                throw new UnauthorizedAccessException("Invalid username or password.");
            }

            return _jwtTokenService.GenerateToken(user);
        }

       
    }
}
