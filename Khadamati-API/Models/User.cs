namespace Khadamati_API.Models
{
    public class User
    {
        public Guid Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string NationalIdNumber { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
        public string RefreshToken { get; set; } = string.Empty;
        public DateTime RefreshTokenExpiryTime { get; set; }

        public ICollection<Complaint> ?Complaints { get; set; }

        public ICollection<Suggestion>? Suggestions { get; set; }
        public ICollection<ServiceRequest>? ServiceRequests { get; set; }

        public ICollection<CitizenService>? CitizenServices { get; set; }
    }
}
