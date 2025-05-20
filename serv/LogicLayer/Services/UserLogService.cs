
using DataAccess.Interfaces;
using DataAccess.Models;
using LogicLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LogicLayer.Services;

public class UserLogService :IUserLogService
{
    private readonly IUserLogRepository _repository;

    public UserLogService(IUserLogRepository repository)
    {
        _repository = repository;
    }

    public Task<IEnumerable<UserLog>> GetAllAsync()
    {
        return _repository.GetAllAsync();
    }

    public Task<IEnumerable<UserLog>> FilterAsync(string? userId, string? action, DateTime? from, DateTime? to)
    {
        return _repository.FilterAsync(userId, action, from, to);
    }

    public Task AddAsync(UserLog log)
    {
        return _repository.AddAsync(log);
    }
}
