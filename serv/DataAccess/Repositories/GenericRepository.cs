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
    public class GenericRepository<T> : IGenericRepoitory<T> where T : class
    {
        protected CursContext Context { get; private set; }
        protected DbSet<T> Set { get; private set; }

        public GenericRepository(CursContext context)
        {
            this.Context = context;
            this.Set = this.Context.Set<T>();
        }

        public virtual void Delete(int id)
        {
            this.Set.Remove(this.FindById(id));
            this.Context.SaveChanges();
        }

        public virtual IEnumerable<T> Get()
        {
            return this.Set.ToList();
        }

        public virtual T FindById(int id)
        {
            return this.Set.Find(id);
        }

        public virtual int Insert(T entity)
        {
            this.Set.Add(entity);
            this.Context.SaveChanges();
            return (int)entity.GetType().GetProperty("Id")!.GetValue(entity)!;
        }

        public virtual void Update(T entity)
        {
            this.Context.Set<T>().Update(entity);
            this.Context.SaveChanges();
        }

        public virtual IEnumerable<T> Get(Func<T, bool> predicate)
        {
            return this.Set.Where(predicate).ToList();
        }
    }
}
