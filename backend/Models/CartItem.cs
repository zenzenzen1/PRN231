using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    public class CartItem
    {
        public string UserId { get; set; } = string.Empty;
        public User? User { get; set; } = null!;
        public int ProductId { get; set; }
        public Product? Product { get; set; } = null!;
        public int Quantity { get; set; }
        
    }
}