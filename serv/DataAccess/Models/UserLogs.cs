using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class UserLog
    {
        public int Id { get; set; }

        public string? UserId { get; set; }  

        public string Action { get; set; } = null!;  

        public string TableName { get; set; } = null!; 

        public string? Details { get; set; }  

        public DateTime Timestamp { get; set; } = DateTime.UtcNow;
    }
}
