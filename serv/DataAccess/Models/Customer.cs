using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class Customer
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public DateOnly Dateofbirth { get; set; }

    public string Phone { get; set; } = null!;

    public int? Customertypeid { get; set; }

    public virtual CustomerType? Customertype { get; set; }

    public virtual ICollection<Loan> Loans { get; set; } = new List<Loan>();
}
