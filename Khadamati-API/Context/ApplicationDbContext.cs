using Khadamati_API.Models;
using Microsoft.EntityFrameworkCore;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<ServiceRequest> ServiceRequests { get; set; }
    public DbSet<Complaint> Complaints { get; set; }
    public DbSet<Suggestion> Suggestions { get; set; }
    public DbSet<CitizenService> CitizenServices { get; set; }
    public DbSet<User> Users { get; set; }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        builder.Entity<User>().ToTable("Users");

        // Define the relationship between Complaint and User
        builder.Entity<Complaint>()
           .HasOne(c => c.User)
           .WithMany(u => u.Complaints)
           .HasForeignKey(c => c.UserId);

        builder.Entity<Suggestion>()
   .HasOne(c => c.User)
   .WithMany(u => u.Suggestions)
   .HasForeignKey(c => c.UserId);

        builder.Entity<CitizenService>()  // استبدال ServiceRequest بـ CitizenService
          .HasOne(cs => cs.User)  // Ensure CitizenService has a navigation property to User
          .WithMany(u => u.CitizenServices)  // تحديث الاسم داخل User
          .HasForeignKey(cs => cs.UserId);

        // Define the relationship between ServiceRequest and User
        builder.Entity<ServiceRequest>()
           .HasOne(sr => sr.User)  // Ensure ServiceRequest has a navigation property to User
           .WithMany(u => u.ServiceRequests)  // Ensure User has a collection of ServiceRequests
           .HasForeignKey(sr => sr.UserId);

        base.OnModelCreating(builder);
    }
}
