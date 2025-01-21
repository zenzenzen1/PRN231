using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class Error
    {
        public Error()
        {
            RepairBillDetails = new HashSet<RepairBillDetail>();
        }

        public int ErrorId { get; set; }
        public string? ErrorName { get; set; }

        public virtual ICollection<RepairBillDetail> RepairBillDetails { get; set; }
    }
}
