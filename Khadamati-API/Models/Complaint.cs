using Khadamati_API.Models.ALLEnum;

namespace Khadamati_API.Models
{
    public class Complaint
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; } // Foreign Key linking to User
        public User User { get; set; } // Navigation property linking to User
        public string ComplaintDetails { get; set; } = string.Empty;
        public string ComplaintLocation { get; set; } = string.Empty;
        public string MobileNumber { get; set; } = string.Empty;
        public string TypeOfComplaint { get; set; } = string.Empty;
        public Status Status { get; set; }
        public string? Nots { get; set; }
        public DateTime DateOfProcess { get; set; }
    }
}
