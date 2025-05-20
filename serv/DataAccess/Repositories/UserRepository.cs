using DataAccess.Interfaces;
using DataAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    public class UserRepository : GenericRepository<Employee>, IUserRepository
    {
        public UserRepository(CursContext context) : base(context)
        {
        }

        //public async Task<int?> GetUserIdByUsernameAsync(string username)
        //{
        // //   var user = await Context.Clients.FirstOrDefaultAsync(u => u.Email== username);

        //    if (user == null)
        //    {
        //        return null;
        //    }

        //    return user.Id;
        //}
    }
}
