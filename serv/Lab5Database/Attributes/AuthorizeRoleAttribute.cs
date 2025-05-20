using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;

namespace Lab5Database.Attributes
{
    public class AuthorizeRoleAttribute : AuthorizeAttribute, IAuthorizationFilter
    {
        private readonly int[] _allowedPositions;

        public AuthorizeRoleAttribute(params int[] allowedPositions)
        {
            _allowedPositions = allowedPositions;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var user = context.HttpContext.User;

            if (!user.Identity.IsAuthenticated)
            {
                context.Result = new UnauthorizedResult();
                return;
            }

            var positionIdClaim = user.Claims.FirstOrDefault(c => c.Type == "position_id");

            if (positionIdClaim == null || !int.TryParse(positionIdClaim.Value, out int positionId))
            {
                context.Result = new ForbidResult();
                return;
            }

            if (!_allowedPositions.Contains(positionId))
            {
                context.Result = new ForbidResult();
            }
        }
    }
}
