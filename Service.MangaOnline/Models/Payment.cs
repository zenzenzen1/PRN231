using System;
using System.Collections.Generic;

namespace Service.MangaOnline.Models
{
    public partial class Payment
    {
        public Guid PaymentId { get; set; }
        public Guid UserId { get; set; }
        public DateTime PaymentTime { get; set; }
        public Guid PriceHistoryId { get; set; }

        public virtual PriceHistory? PriceHistory { get; set; } = null!;
        public virtual User? User { get; set; } = null!;
    }
}
