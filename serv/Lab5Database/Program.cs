
using DataAccess.Interfaces;
using DataAccess.Models;
using DataAccess.Repositories;
using Lab5Database.Middleware;
using LogicLayer.Interfaces;
using LogicLayer.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Services;
using Services.Interfaces;
using System.Text;

namespace Lab5Database
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
            builder.Services.AddOpenApi();
            builder.Services.AddSwaggerGen();



            builder.Services.AddDbContext<CursContext>(options => options.UseNpgsql(
              builder.Configuration.GetConnectionString("Local"),
              b => b.MigrationsAssembly(typeof(CursContext).Assembly.FullName)));

            builder.Services.AddScoped<IContractRepository, ContractRepository>();
            builder.Services.AddScoped<ICustomerRepository, CustomerRepository>();
            builder.Services.AddScoped<ICustomerTypeRepository, CustomerTypeRepository>();
            builder.Services.AddScoped<ILoanStatusRepository, LoanStatusRepository>();
            builder.Services.AddScoped<ILoanTypeRepository, LoanTypeRepository>();
            builder.Services.AddScoped<ILoanRepository, LoanRepository>();
            builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
            builder.Services.AddScoped<IPaymentScheduleRepository, PaymentScheduleRepository>();
            builder.Services.AddScoped<IPaymentTypeRepository, PaymentTypeRepository>();
            builder.Services.AddScoped<IPositionRepository, PositionRepository>();
            builder.Services.AddScoped<IScheduleStatusRepository, ScheduleStatusRepository>();
            builder.Services.AddScoped<IUserRepository, UserRepository>();
            builder.Services.AddScoped<IUserLogRepository, UserLogRepository>();
          

            builder.Services.AddScoped<IJWTService, JwtService>();
            builder.Services.AddScoped<IUserService, UserService>();
            builder.Services.AddScoped<IContractService, ContractService>();
            builder.Services.AddScoped<ICustomerService, CustomerService>();
            builder.Services.AddScoped<ICustomerTypeService, CustomerTypeService>();
            builder.Services.AddScoped<ILoanStatusService, LoanStatusService>();
            builder.Services.AddScoped<ILoanTypeService, LoanTypeService>();
            builder.Services.AddScoped<ILoanService, LoanService>();
            builder.Services.AddScoped<IPaymentService, PaymentService>();
            builder.Services.AddScoped<IPaymentScheduleService, PaymentScheduleService>();
            builder.Services.AddScoped<IPaymentTypeService, PaymentTypeService>();
            builder.Services.AddScoped<IPositionService, PositionService>();
            builder.Services.AddScoped<IScheduleStatusService, ScheduleStatusService>();
            builder.Services.AddScoped<IEmployeeService, EmployeeService>();
            builder.Services.AddScoped<ILogService, LogService>();
            builder.Services.AddScoped<IUserLogService, UserLogService>();
            builder.Services.AddScoped<IAccountingPeriodRepository, AccountingPeriodRepository>();
            builder.Services.AddScoped<IAccountingPeriodService, AccountingPeriodService>();





            builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = builder.Configuration["Jwt:Issuer"],
                    ValidAudience = builder.Configuration["Jwt:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
                };
            });
            builder.Services.AddCors(options =>
            {
                options.AddPolicy("AllowAll", policy =>
                {
                    policy
                        .AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader();
                });
            });


            builder.Services.AddAuthorization();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.MapOpenApi();
                app.UseSwagger();
                app.UseSwaggerUI();
            }
            app.UseCors("AllowAll");
            app.UseHttpsRedirection();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseMiddleware<LogMiddleware>();
            app.UseMiddleware<PeriodCheckMiddleware>();


            app.MapControllers();

            app.Run();
        }
    }
}
