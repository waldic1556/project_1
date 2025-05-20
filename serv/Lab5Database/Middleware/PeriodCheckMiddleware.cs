using LogicLayer.Interfaces;

public class PeriodCheckMiddleware
{
    private readonly RequestDelegate _next;

    public PeriodCheckMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        var service = context.RequestServices.GetRequiredService<IAccountingPeriodService>();

        var now = DateTime.UtcNow;

        var allowedPath = context.Request.Path.StartsWithSegments("/api/settings/period");

        if (!allowedPath && !service.IsInPeriod(now))
        {
            context.Response.StatusCode = 403;
            await context.Response.WriteAsync("Доступ за межами облікового періоду заборонено.");
            return;
        }

        await _next(context);
    }
}
