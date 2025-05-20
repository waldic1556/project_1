using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class Loan
{
    public int Id { get; set; }

    public int? Customerid { get; set; }

    public decimal Amount { get; set; }

    public decimal Interestrate { get; set; }
    public DateOnly Creationtime { get; set; }

    public int Termmonths { get; set; }

    public int? Loantypeid { get; set; }

    public int? Statusid { get; set; }

    public virtual ICollection<Contract> Contracts { get; set; } = new List<Contract>();

    public virtual Customer? Customer { get; set; }

    public virtual LoanType? Loantype { get; set; }

    public virtual ICollection<PaymentSchedule> PaymentSchedules { get; set; } = new List<PaymentSchedule>();

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual LoanStatus? Status { get; set; }
}
