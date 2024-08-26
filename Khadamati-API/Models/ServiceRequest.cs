

using Khadamati_API.Models.ALLEnum;

namespace Khadamati_API.Models
{
    public class ServiceRequest
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; } // Navigation property to User
        public string RequestType { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string BuildingPermit { get; set; } = string.Empty;
        public Status Status { get; set; }
        public string? Nots { get; set; }
        public DateTime DateOfProcess { get; set; }

    }
}
