
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess.Interfaces;

public interface IUserLogRepository
{
    Task<IEnumerable<UserLog>> GetAllAsync();
    Task<IEnumerable<UserLog>> FilterAsync(string? userId, string? action, DateTime? from, DateTime? to);
    Task AddAsync(UserLog log);
}
