using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DTOs
{
    public class RegisterDTO
    {
        [Required(ErrorMessage = "Name is required.")]
        [MinLength(3, ErrorMessage = "Name must be at least 3 characters long.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "PositionId is required.")]
        public int PositionId { get; set; }

        [Required(ErrorMessage = "Login is required.")]
        [MinLength(3, ErrorMessage = "Login must be at least 3 characters long.")]
        public string Login { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        [MinLength(6, ErrorMessage = "Password must be at least 6 characters long.")]
        [MaxLength(20, ErrorMessage = "Password must be maximum 20 characters long.")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$", ErrorMessage = "Password must contain at least one lowercase letter, one uppercase letter, and one number.")]
        public string Password { get; set; }
    }
}
