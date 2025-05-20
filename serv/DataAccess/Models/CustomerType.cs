using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class CustomerType
{
    public int Id { get; set; }

    public string Typename { get; set; } = null!;

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();
}
