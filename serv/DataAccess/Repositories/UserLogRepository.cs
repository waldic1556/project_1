
using DataAccess.Interfaces;
using DataAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.Repositories;

public class UserLogRepository : IUserLogRepository
{
    private readonly CursContext _context;

    public UserLogRepository(CursContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<UserLog>> GetAllAsync()
    {
        return await _context.UserLogs.OrderByDescending(l => l.Timestamp).ToListAsync();
    }

    public async Task<IEnumerable<UserLog>> FilterAsync(string? userId, string? action, DateTime? from, DateTime? to)
    {
        var query = _context.UserLogs.AsQueryable();

        if (!string.IsNullOrEmpty(userId))
            query = query.Where(l => l.UserId == userId);

        if (!string.IsNullOrEmpty(action))
            query = query.Where(l => l.Action == action);

        if (from.HasValue)
            query = query.Where(l => l.Timestamp >= from.Value);

        if (to.HasValue)
            query = query.Where(l => l.Timestamp <= to.Value);

        return await query.OrderByDescending(l => l.Timestamp).ToListAsync();
    }

    public async Task AddAsync(UserLog log)
    {
        await _context.UserLogs.AddAsync(log);
        await _context.SaveChangesAsync();
    }
}
