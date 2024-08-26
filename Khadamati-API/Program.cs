using Khadamati_API.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Text;

namespace Khadamati_API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // ≈⁄œ«œ ﬁ«⁄œ… «·»Ì«‰« 
            builder.Services.AddDbContext<ApplicationDbContext>(option =>
            {
                option.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
            });

            // ≈⁄œ«œ «·„’«œﬁ… »«” Œœ«„ JWT
            builder.Services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("a_secure_key_that_is_long_enough_123456")),
                    ValidateAudience = false,
                    ValidateIssuer = false,
                    ClockSkew = TimeSpan.Zero
                };
            });

            // ≈÷«›… «·Œœ„«  «·√Œ—Ï
            builder.Services.AddControllers();
            builder.Services.AddAuthorization();
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            //  ﬂÊÌ‰ ŒÿÊÿ «·√‰«»Ì» ·»Ì∆… «· ÿÊÌ—
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
                builder.WebHost.UseUrls("https://0.0.0.0:7071");
            }

            // «” Œœ«„ HTTPS
            app.UseHttpsRedirection();

            // «” Œœ«„ «·„’«œﬁ… Ê«· ›ÊÌ÷
            app.UseAuthentication();
            app.UseAuthorization();

            //  ⁄ÌÌ‰ «·„”«—«  ··„ Õﬂ„« 
            app.MapControllers();

            //  ‘€Ì· «· ÿ»Ìﬁ
            app.Run();
        }
    }
}
