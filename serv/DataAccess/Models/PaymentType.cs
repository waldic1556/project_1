using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class PaymentType
{
    public int Id { get; set; }

    public string Typename { get; set; } = null!;

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();
}
