using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Models;

public partial class CursContext : DbContext
{
    public CursContext()
    {
    }

    public CursContext(DbContextOptions<CursContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Contract> Contracts { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<CustomerType> CustomerTypes { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Loan> Loans { get; set; }

    public virtual DbSet<LoanStatus> LoanStatuses { get; set; }

    public virtual DbSet<LoanType> LoanTypes { get; set; }
    public virtual DbSet<UserLog> UserLogs{ get; set; }
    public virtual DbSet<AccountingPeriodSettings> AccountingPeriods { get; set; }
    public virtual DbSet<Payment> Payments { get; set; }

    public virtual DbSet<PaymentSchedule> PaymentSchedules { get; set; }

    public virtual DbSet<PaymentType> PaymentTypes { get; set; }

    public virtual DbSet<Position> Positions { get; set; }

    public virtual DbSet<ScheduleStatus> ScheduleStatuses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=curs;Username=postgres;Password=Password1-");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Contract>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("contracts_pkey");

            entity.ToTable("contracts");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Contractdate).HasColumnName("contractdate");
            entity.Property(e => e.Loanid).HasColumnName("loanid");

            entity.HasOne(d => d.Loan).WithMany(p => p.Contracts)
                .HasForeignKey(d => d.Loanid)
                .HasConstraintName("contracts_loanid_fkey").OnDelete(DeleteBehavior.Cascade);
            
        });
        modelBuilder.Entity<AccountingPeriodSettings>(entity =>
        {
            entity.ToTable("accounting_period");

            entity.HasKey(e => e.Id).HasName("accounting_period_pkey");

            entity.Property(e => e.Id)
                .HasColumnName("id");

            entity.Property(e => e.StartDate)
                .HasColumnName("start_date");

            entity.Property(e => e.EndDate)
                .HasColumnName("end_date");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("customers_pkey");

            entity.ToTable("customers");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Customertypeid).HasColumnName("customertypeid");
            entity.Property(e => e.Dateofbirth).HasColumnName("dateofbirth");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Phone).HasColumnName("phone");

            entity.HasOne(d => d.Customertype).WithMany(p => p.Customers)
                .HasForeignKey(d => d.Customertypeid)
                .HasConstraintName("customers_customertypeid_fkey");
        });

        modelBuilder.Entity<CustomerType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("customer_types_pkey");

            entity.ToTable("customer_types");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Typename).HasColumnName("typename");
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("employees_pkey");

            entity.ToTable("employees");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Login).HasColumnName("login");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Password).HasColumnName("password");
            entity.Property(e => e.Positionid).HasColumnName("positionid");

            entity.HasOne(d => d.Position).WithMany(p => p.Employees)
                .HasForeignKey(d => d.Positionid)
                .HasConstraintName("employees_positionid_fkey");
        });

        modelBuilder.Entity<Loan>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("loans_pkey");

            entity.ToTable("loans");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Creationtime).HasColumnName("creationtime");
            entity.Property(e => e.Amount)
                .HasPrecision(18, 2)
                .HasColumnName("amount");
            entity.Property(e => e.Customerid).HasColumnName("customerid");
            entity.Property(e => e.Interestrate)
                .HasPrecision(5, 2)
                .HasColumnName("interestrate");
            entity.Property(e => e.Loantypeid).HasColumnName("loantypeid");
            entity.Property(e => e.Statusid).HasColumnName("statusid");
            entity.Property(e => e.Termmonths).HasColumnName("termmonths");

            entity.HasOne(d => d.Customer).WithMany(p => p.Loans)
                .HasForeignKey(d => d.Customerid)
                .HasConstraintName("loans_customerid_fkey").OnDelete(DeleteBehavior.Cascade);
            

            entity.HasOne(d => d.Loantype).WithMany(p => p.Loans)
                .HasForeignKey(d => d.Loantypeid)
                .HasConstraintName("loans_loantypeid_fkey");

            entity.HasOne(d => d.Status).WithMany(p => p.Loans)
                .HasForeignKey(d => d.Statusid)
                .HasConstraintName("loans_statusid_fkey");

        });

        modelBuilder.Entity<LoanStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("loan_statuses_pkey");

            entity.ToTable("loan_statuses");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Statusname).HasColumnName("statusname");
        });

        modelBuilder.Entity<LoanType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("loan_types_pkey");

            entity.ToTable("loan_types");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Typename).HasColumnName("typename");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("payments_pkey");

            entity.ToTable("payments");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Amount)
                .HasPrecision(18, 2)
                .HasColumnName("amount");
            entity.Property(e => e.Loanid).HasColumnName("loanid");
            entity.Property(e => e.Paymentdate).HasColumnName("paymentdate");
            entity.Property(e => e.Paymenttypeid).HasColumnName("paymenttypeid");

            entity.HasOne(d => d.Loan).WithMany(p => p.Payments)
                .HasForeignKey(d => d.Loanid)
                .HasConstraintName("payments_loanid_fkey").OnDelete(DeleteBehavior.Cascade);
            

            entity.HasOne(d => d.Paymenttype).WithMany(p => p.Payments)
                .HasForeignKey(d => d.Paymenttypeid)
                .HasConstraintName("payments_paymenttypeid_fkey");
        });

        modelBuilder.Entity<PaymentSchedule>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("payment_schedules_pkey");

            entity.ToTable("payment_schedules");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Amount)
                .HasPrecision(18, 2)
                .HasColumnName("amount");
            entity.Property(e => e.Duedate).HasColumnName("duedate");
            entity.Property(e => e.Loanid).HasColumnName("loanid");
            entity.Property(e => e.Statusid).HasColumnName("statusid");

            entity.HasOne(d => d.Loan).WithMany(p => p.PaymentSchedules)
                .HasForeignKey(d => d.Loanid)
                .HasConstraintName("payment_schedules_loanid_fkey").OnDelete(DeleteBehavior.Cascade);
            

            entity.HasOne(d => d.Status).WithMany(p => p.PaymentSchedules)
                .HasForeignKey(d => d.Statusid)
                .HasConstraintName("payment_schedules_statusid_fkey");
        });

        modelBuilder.Entity<PaymentType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("payment_types_pkey");

            entity.ToTable("payment_types");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Typename).HasColumnName("typename");
        });

        modelBuilder.Entity<Position>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("positions_pkey");

            entity.ToTable("positions");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Positionname).HasColumnName("positionname");
        });
        modelBuilder.Entity<UserLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("user_logs_pkey");

            entity.ToTable("user_logs");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.Action).HasColumnName("action");
            entity.Property(e => e.TableName).HasColumnName("table_name");
            entity.Property(e => e.Details).HasColumnName("details");
            entity.Property(e => e.Timestamp).HasColumnName("timestamp");
        });

        modelBuilder.Entity<ScheduleStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("schedule_statuses_pkey");

            entity.ToTable("schedule_statuses");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Statusname).HasColumnName("statusname");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
