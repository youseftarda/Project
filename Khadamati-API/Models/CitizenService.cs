namespace Khadamati_API.Models
{
    public class CitizenService
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; } // Foreign Key linking to User
        public User User { get; set; } // Navigation property linking to User
        public int ServiceNumber { get; set; }
        public string ServiceType { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; } = DateTime.Now; // حفظ وقت إنشاء الخدمة
    }
}
