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
    public class ComplaintController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ComplaintController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost("create")]
        [Authorize] // تأكد من أن المستخدم مسجل الدخول
        public async Task<IActionResult> CreateComplaint([FromBody] ComplaintDto complaintDto)
        {
            if (complaintDto == null)
                return BadRequest();

            // Retrieve the authenticated user's ID
            var userId = User.FindFirstValue("id");

            if (userId == null)
                return Unauthorized();

            var complaint = new Complaint
            {
                Id = Guid.NewGuid(),
                UserId = Guid.Parse(userId),
                ComplaintDetails = complaintDto.ComplaintDetails,
                ComplaintLocation = complaintDto.ComplaintLocation,
                MobileNumber = complaintDto.MobileNumber,
                TypeOfComplaint = complaintDto.TypeOfComplaint,
                Status = Models.ALLEnum.Status.WaitToApprovl
            };

            try
            {
                await _context.Complaints.AddAsync(complaint);
                await _context.SaveChangesAsync();

                // بعد حفظ الشكوى بنجاح، حفظ بيانات الخدمة
                var citizenService = new CitizenService
                {
                    Id = Guid.NewGuid(),
                    UserId = Guid.Parse(userId),
                    ServiceNumber = _context.CitizenServices.Count() + 1, // حساب رقم الخدمة
                    ServiceType = "تقديم شكوى"
                };

                await _context.CitizenServices.AddAsync(citizenService);
                await _context.SaveChangesAsync();

                return Ok(new { Message = "Complaint submitted successfully!" });
            }
            catch (Exception ex)
            {
                // التعامل مع الاستثناءات
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        private Guid? GetUserIdFromClaims()
        {
            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Role);
            if (userIdClaim == null)
            {
                return null;
            }

            if (Guid.TryParse(userIdClaim.Value, out var userId))
            {
                return userId;
            }

            return null;
        }

        private async Task<IActionResult> HandleRequest<T>(Func<Guid, Task<List<T>>> query)
        {
            var userId = GetUserIdFromClaims();
            if (userId == null)
            {
                return Unauthorized(new { Message = "Invalid or missing UserId claim." });
            }

            var result = await query(userId.Value);
            return Ok(result);
        }
        [HttpGet("GetUserComplaint")]
        [Authorize] // تأكد من أن المستخدم مسجل الدخول
        public async Task<IActionResult> GetUserServices()
        {
            // Retrieve the authenticated user's ID
            var userId = User.FindFirstValue("id");

            if (userId == null)
                return Unauthorized();

            // جلب الخدمات الخاصة بالمستخدم المسجل فقط
            var services = await _context.Complaints
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
