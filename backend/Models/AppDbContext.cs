using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace backend.Models
{
    public class AppDbContext : IdentityDbContext<User>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }
        
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                var tableName = entityType.GetTableName();
                if(tableName != null && tableName.StartsWith("AspNet")){
                    entityType.SetTableName(tableName.Replace("AspNet", ""));
                }
            }
            var orderDetailModelBuilder = modelBuilder.Entity<OrderDetails>();
            orderDetailModelBuilder
                .HasKey(od => new { od.OrderId, od.ProductId });
            // orderDetailModelBuilder
            //     .HasOne(od => od.Order)
            //     .WithMany(o => o.OrderDetails)
            //     .HasForeignKey(od => od.OrderId)
            //     .OnDelete(DeleteBehavior.NoAction);
            // orderDetailModelBuilder
            //     .HasOne(od => od.Product)
            //     .WithMany(f => f.OrderDetails)
            //     .HasForeignKey(od => od.ProductId)
            //     .OnDelete(DeleteBehavior.NoAction);

            
        }
        public override DbSet<User> Users { get; set; } = null!;
        public DbSet<Setting> Settings { get; set; } = null!;
        public DbSet<Product> Products { get; set; } = null!;
        public DbSet<Order> Orders { get; set; } = null!;
        public DbSet<OrderDetails> OrderDetails { get; set; } = null!;
        public DbSet<CartItem> CartItems { get; set; } = null!;
        
        
        
    }
}