using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class Payment
{
    public int Id { get; set; }

    public int? Loanid { get; set; }

    public DateOnly Paymentdate { get; set; }

    public decimal Amount { get; set; }

    public int? Paymenttypeid { get; set; }

    public virtual Loan? Loan { get; set; }

    public virtual PaymentType? Paymenttype { get; set; }
}
