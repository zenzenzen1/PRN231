using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class ImageProduct
    {
        public int ImgId { get; set; }
        public int? ProductId { get; set; }
        public string? ImgLink { get; set; }

        public virtual Product? Product { get; set; }
    }
}
