using DataAccess.Interfaces;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    public class PaymentScheduleRepository : GenericRepository<PaymentSchedule> , IPaymentScheduleRepository
    {
        public PaymentScheduleRepository(CursContext context) : base(context)
        {
        }
    }
}
