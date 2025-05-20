
using DataAccess.Models;

namespace LogicLayer.Interfaces;

public interface IAccountingPeriodService
{
    AccountingPeriodSettings GetPeriod();
    void SetPeriod(AccountingPeriodSettings settings);
    bool IsInPeriod(DateTime current);
}
