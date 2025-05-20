using Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTOs
{
    public class LoanResponseDTO:LoanDto
    {
        public int? Loantypeid { get; set; }

        public int? Statusid { get; set; }
        public int? Customerid { get; set; }
        public DateOnly CreationTime { get; set; }

    }
}
