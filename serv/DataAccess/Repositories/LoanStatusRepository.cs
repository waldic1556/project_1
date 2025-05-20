using DataAccess.Interfaces;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    public class LoanStatusRepository : GenericRepository<LoanStatus>, ILoanStatusRepository
    {
        public LoanStatusRepository(CursContext context) : base(context)
        {
        }
    }
}
