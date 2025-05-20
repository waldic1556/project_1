using LogicLayer.Interfaces;

namespace Lab5Database.Middleware
{
    public class LogMiddleware
    {
        private readonly RequestDelegate _next;

        public LogMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            var logger = context.RequestServices.GetRequiredService<ILogService>();

            var userId = context.User?.Identity?.Name ?? "Anonymous";
            var method = context.Request.Method;
            var path = context.Request.Path;

            context.Request.EnableBuffering();
            string body = "";
            using (var reader = new StreamReader(context.Request.Body, leaveOpen: true))
            {
                body = await reader.ReadToEndAsync();
                context.Request.Body.Position = 0;
            }
            try
            {
                await logger.LogAsync(userId, method, path, body);
            } catch (Exception ex)
            { 
                Console.WriteLine($"[LogMiddleware] Logging failed: {ex.Message}");
            }
            await _next(context);
        }
    }
}
