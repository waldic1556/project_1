﻿using DataAccess.Interfaces;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    public class LoanTypeRepository : GenericRepository<LoanType>, ILoanTypeRepository
    {
        public LoanTypeRepository(CursContext context) : base(context)
        {
        }
    }
}
