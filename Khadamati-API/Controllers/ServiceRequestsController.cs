using Khadamati_API.Models;
using Khadamati_API.Models.Dto;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Khadamati_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ServiceRequestsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ServiceRequestsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost("create")]
        public async Task<IActionResult> CreateServiceRequest([FromBody] ServiceRequestDto requestDto)
        {
            if (requestDto == null)
                return BadRequest("Invalid service request data.");

            // Retrieve the authenticated user's ID
            var userId = User.FindFirstValue("id");

            if (userId == null)
                return Unauthorized();

            var request = new ServiceRequest
            {
                Id = Guid.NewGuid(),
                UserId = Guid.Parse(userId),
                RequestType = requestDto.RequestType,
                PhoneNumber = requestDto.PhoneNumber,
                BuildingPermit = requestDto.BuildingPermit,
                Status=Models.ALLEnum.Status.WaitToApprovl
                
            };

            try
            {
                await _context.ServiceRequests.AddAsync(request);
                await _context.SaveChangesAsync();
                return Ok(new { Message = "Service request submitted successfully." });
            }
            catch (Exception ex)
            {
                // التعامل مع الاستثناءات
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        [HttpGet("GetUserRequest")]
        [Authorize] // تأكد من أن المستخدم مسجل الدخول
        public async Task<IActionResult> GetUserServices()
        {
            // Retrieve the authenticated user's ID
            var userId = User.FindFirstValue("id");

            if (userId == null)
                return Unauthorized();

            // جلب الخدمات الخاصة بالمستخدم المسجل فقط
            var services = await _context.ServiceRequests
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
