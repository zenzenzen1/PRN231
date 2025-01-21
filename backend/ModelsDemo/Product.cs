using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class Product
    {
        public Product()
        {
            Comments = new HashSet<Comment>();
            Guarantees = new HashSet<Guarantee>();
            ImageProducts = new HashSet<ImageProduct>();
            OrderDetails = new HashSet<OrderDetail>();
            RepairBillDetails = new HashSet<RepairBillDetail>();
        }

        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public int? BrandId { get; set; }
        public int? CategoryId { get; set; }
        public string? Description { get; set; }
        public decimal? UnitPrice { get; set; }
        public int? Discount { get; set; }
        public string? Img { get; set; }
        public int? UnitInStock { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? Guarantee { get; set; }
        public bool? Status { get; set; }
        public string? LargeImage { get; set; }
        public string? OtherDescription { get; set; }
        public string? File { get; set; }

        public virtual Brand? Brand { get; set; }
        public virtual Category? Category { get; set; }
        public virtual Admin? CreatedByNavigation { get; set; }
        public virtual Admin? ModifiedByNavigation { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Guarantee> Guarantees { get; set; }
        public virtual ICollection<ImageProduct> ImageProducts { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<RepairBillDetail> RepairBillDetails { get; set; }
    }
}
