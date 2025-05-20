using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicLayer.Interfaces
{
    public interface ILogService
    {
        Task LogAsync(string userId, string action, string table, string? details = null);
    }
}
