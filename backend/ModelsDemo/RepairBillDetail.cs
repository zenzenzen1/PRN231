using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class RepairBillDetail
    {
        public int BillId { get; set; }
        public int ProductId { get; set; }
        public int ErrorId { get; set; }
        public int? Quantity { get; set; }
        public decimal? Price { get; set; }

        public virtual RepairBill Bill { get; set; } = null!;
        public virtual Error Error { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
