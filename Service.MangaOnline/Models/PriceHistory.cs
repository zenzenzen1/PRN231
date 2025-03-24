using System;
using System.Collections.Generic;

namespace Service.MangaOnline.Models
{
    public partial class PriceHistory
    {
        public PriceHistory()
        {
            Payments = new HashSet<Payment>();
        }

        public Guid Id { get; set; }
        public decimal Price { get; set; }
        public DateTime ChangedTime { get; set; }

        public virtual ICollection<Payment> Payments { get; set; }
    }
}
