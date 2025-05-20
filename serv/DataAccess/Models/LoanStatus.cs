using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class LoanStatus
{
    public int Id { get; set; }

    public string Statusname { get; set; } = null!;

    public virtual ICollection<Loan> Loans { get; set; } = new List<Loan>();
}
