using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class OrderDetail
    {
        public int ProductId { get; set; }
        public int OrderId { get; set; }
        public int? Quantity { get; set; }
        public decimal? Price { get; set; }
        public int? Discount { get; set; }

        public virtual Order Order { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
