using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccess;

namespace AgriTedWeb.Data
{
    public class AgriTedWebContext : DbContext
    {
        public AgriTedWebContext (DbContextOptions<AgriTedWebContext> options)
            : base(options)
        {
        }

        public DbSet<DataAccess.CROP> CROP { get; set; } = default!;
        public DbSet<DataAccess.EQUIPMENT> EQUIPMENT { get; set; } = default!;
        public DbSet<DataAccess.FARMER> FARMER { get; set; } = default!;
        public DbSet<DataAccess.FERTILIZER> FERTILIZER { get; set; } = default!;
        public DbSet<DataAccess.FIELD> FIELD { get; set; } = default!;
        public DbSet<DataAccess.QUALITY> QUALITY { get; set; } = default!;
        public DbSet<DataAccess.RESERVATION> RESERVATION { get; set; } = default!;
        public DbSet<DataAccess.SUPPLIER> SUPPLIER { get; set; } = default!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Cascade delete for FARMER and RESERVATION relationship
             modelBuilder.Entity<RESERVATION>()
             .HasOne(r => r.FARMER)
             .WithMany(f => f.RESERVATION)
             .HasForeignKey(r => r.FarmerId)
             .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
