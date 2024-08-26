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
    public class SuggestionsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public SuggestionsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost("create")]
        [Authorize] // تأكد من أن المستخدم مسجل الدخول
        public async Task<IActionResult> CreateSuggestion([FromBody] SuggestionDto SuggestionDto)
        {
            if (SuggestionDto == null)
                return BadRequest();

            // Retrieve the authenticated user's ID
            var userId = User.FindFirstValue("id");

            if (userId == null)
                return Unauthorized();
            var suggestion = new Suggestion
            {
                Id = Guid.NewGuid(),
                UserId = Guid.Parse(userId),
                SuggestionText = SuggestionDto.SuggestionText,
                Subject = SuggestionDto.Subject,
                MobilePhoneNumber = SuggestionDto.MobilePhoneNumber,
               
            };
            try
            {
                await _context.Suggestions.AddAsync(suggestion);
                await _context.SaveChangesAsync();

                return Ok(new { Message = "suggestion submitted successfully!" });
            }
            catch (Exception ex)
            {
                // التعامل مع الاستثناءات
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }

        }
       
    }
}
