using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class News
    {
        public int NewsId { get; set; }
        public string? Title { get; set; }
        public string? Content { get; set; }
        public int? NewsType { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string? Image { get; set; }
        public string? Video { get; set; }

        public virtual Admin? CreatedByNavigation { get; set; }
        public virtual Admin? ModifiedByNavigation { get; set; }
        public virtual NewsType? NewsTypeNavigation { get; set; }
    }
}
