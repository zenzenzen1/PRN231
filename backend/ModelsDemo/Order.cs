using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int OrderId { get; set; }
        public int? UserId { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? ShipDate { get; set; }
        public decimal? TotalPrice { get; set; }
        public string? Status { get; set; }
        public string? PaymentType { get; set; }
        public string? ShipAddress { get; set; }

        public virtual User? User { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
