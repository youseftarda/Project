namespace Khadamati_API.Models
{
    public class Suggestion
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; } 
        public string MobilePhoneNumber { get; set; } = string.Empty;
        public string Subject { get; set; } = string.Empty;
        public string SuggestionText { get; set; } = string.Empty;

    }
}