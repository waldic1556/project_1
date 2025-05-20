using DataAccess.Interfaces;
using DataAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    public class PaymentRepository : GenericRepository<Payment>, IPaymentRepository
    {
        public PaymentRepository(CursContext context) : base(context)
        {
        }

        public IEnumerable<Payment> GetNotracked(Func<Payment, bool> predicate)
        {
            return this.Set.AsNoTracking().Where(predicate).ToList();
        }
    
    }
}
