using Khadamati_API.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Khadamati_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitizenServiceController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CitizenServiceController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("GetUserServices")]
        [Authorize] // تأكد من أن المستخدم مسجل الدخول
        public async Task<IActionResult> GetUserServices()
        {
            // Retrieve the authenticated user's ID
            var userId = User.FindFirstValue("id");

            if (userId == null)
                return Unauthorized();

            // جلب الخدمات الخاصة بالمستخدم المسجل فقط
            var services = await _context.CitizenServices
                .Where(cs => cs.UserId == Guid.Parse(userId))
                .ToListAsync();

            if (services == null || services.Count == 0)
            {
                return NotFound(new { Message = "لا توجد خدمات لهذا المستخدم" });
            }

            return Ok(services);
        }
    }
}
