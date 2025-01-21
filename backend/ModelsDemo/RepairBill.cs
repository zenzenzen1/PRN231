using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class RepairBill
    {
        public RepairBill()
        {
            RepairBillDetails = new HashSet<RepairBillDetail>();
        }

        public int BillId { get; set; }
        public int? UserId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public decimal? TotalPrice { get; set; }
        public string? Address { get; set; }

        public virtual User? User { get; set; }
        public virtual ICollection<RepairBillDetail> RepairBillDetails { get; set; }
    }
}
