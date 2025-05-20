
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LogicLayer.Interfaces;

public interface IUserLogService
{
    Task<IEnumerable<UserLog>> GetAllAsync();
    Task<IEnumerable<UserLog>> FilterAsync(string? userId, string? action, DateTime? from, DateTime? to);
    Task AddAsync(UserLog log);
}
