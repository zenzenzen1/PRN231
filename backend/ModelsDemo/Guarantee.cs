using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class Guarantee
    {
        public Guarantee()
        {
            InverseOldGuarantee = new HashSet<Guarantee>();
        }

        public int GuaranteeId { get; set; }
        public int? ProductId { get; set; }
        public int? UserId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int? OldGuaranteeId { get; set; }
        public string? Status { get; set; }
        public string? Img { get; set; }
        public string? DesError { get; set; }

        public virtual Guarantee? OldGuarantee { get; set; }
        public virtual Product? Product { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<Guarantee> InverseOldGuarantee { get; set; }
    }
}
