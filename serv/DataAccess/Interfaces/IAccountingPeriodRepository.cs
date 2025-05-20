
using DataAccess.Models;

namespace DataAccess.Interfaces;

public interface IAccountingPeriodRepository
{
    AccountingPeriodSettings GetPeriod();
    void SetPeriod(AccountingPeriodSettings settings);
}
