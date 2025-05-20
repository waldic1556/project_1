using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class LoanType
{
    public int Id { get; set; }

    public string Typename { get; set; } = null!;

    public virtual ICollection<Loan> Loans { get; set; } = new List<Loan>();
}
