using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class PaymentSchedule
{
    public int Id { get; set; }

    public int? Loanid { get; set; }

    public DateOnly Duedate { get; set; }

    public decimal Amount { get; set; }

    public int? Statusid { get; set; }

    public virtual Loan? Loan { get; set; }

    public virtual ScheduleStatus? Status { get; set; }
}
