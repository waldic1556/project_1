using DataAccess.Interfaces;
using DataAccess.Models;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Repositories;

public class AccountingPeriodRepository : IAccountingPeriodRepository
{
    private readonly CursContext _context;

    public AccountingPeriodRepository(CursContext context)
    {
        _context = context;
    }

    public AccountingPeriodSettings GetPeriod()
    {
        var period = _context.AccountingPeriods.FirstOrDefault(p => p.Id == 1);
        if (period == null)
        {
            period = new AccountingPeriodSettings
            {
                Id = 1,
                StartDate = DateTime.MinValue,
                EndDate = DateTime.MaxValue
            };
            _context.AccountingPeriods.Add(period);
            _context.SaveChanges();
        }
        return period;
    }

    public void SetPeriod(AccountingPeriodSettings settings)
    {
        var existing = _context.AccountingPeriods.FirstOrDefault(p => p.Id == 1);
        if (existing != null)
        {
            existing.StartDate = settings.StartDate.ToUniversalTime();
            existing.EndDate = settings.EndDate.ToUniversalTime();
        } else
        {
            _context.AccountingPeriods.Add(settings);
        }

        _context.SaveChanges();
    }
}