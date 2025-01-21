using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class Comment
    {
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public string? Content { get; set; }
        public DateTime? CreateDate { get; set; }

        public virtual Product Product { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
