
using DataAccess.Interfaces;
using DataAccess.Models;
using LogicLayer.Interfaces;

namespace LogicLayer.Services;

public class AccountingPeriodService : IAccountingPeriodService
{
    private readonly IAccountingPeriodRepository _repository;

    public AccountingPeriodService(IAccountingPeriodRepository repository)
    {
        _repository = repository;
    }

    public AccountingPeriodSettings GetPeriod() => _repository.GetPeriod();

    public void SetPeriod(AccountingPeriodSettings settings) => _repository.SetPeriod(settings);

    public bool IsInPeriod(DateTime current)
    {
        var period = GetPeriod();
        return current >= period.StartDate && current <= period.EndDate;
    }
}
