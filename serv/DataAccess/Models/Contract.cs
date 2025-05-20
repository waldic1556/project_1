using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class Contract
{
    public int Id { get; set; }

    public int? Loanid { get; set; }

    public DateOnly Contractdate { get; set; }

    public virtual Loan? Loan { get; set; }
}
