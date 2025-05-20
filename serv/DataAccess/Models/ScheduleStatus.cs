using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class ScheduleStatus
{
    public int Id { get; set; }

    public string Statusname { get; set; } = null!;

    public virtual ICollection<PaymentSchedule> PaymentSchedules { get; set; } = new List<PaymentSchedule>();
}
