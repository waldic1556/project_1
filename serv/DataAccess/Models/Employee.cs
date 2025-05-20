using System;
using System.Collections.Generic;

namespace DataAccess.Models;

public partial class Employee
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? Positionid { get; set; }

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public virtual Position? Position { get; set; }
}
