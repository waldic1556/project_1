using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class Position
{
    public int Id { get; set; }

    public string Positionname { get; set; } = null!;

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();
}
