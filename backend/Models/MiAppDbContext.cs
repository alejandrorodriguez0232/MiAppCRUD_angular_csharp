using Microsoft.EntityFrameworkCore;

namespace MiAppCRUD.Models
{
    public class MiAppDbContext : DbContext
    {
        public MiAppDbContext(DbContextOptions<MiAppDbContext> options) : base(options)
        {
        }

        public DbSet<Producto> Productos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Producto>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Nombre).IsRequired().HasMaxLength(100);
                entity.Property(e => e.Descripcion).HasMaxLength(500);
                entity.Property(e => e.Precio).HasColumnType("decimal(18,2)");
            });
        }
    }
}
