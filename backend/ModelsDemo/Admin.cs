using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class Admin
    {
        public Admin()
        {
            NewsCreatedByNavigations = new HashSet<News>();
            NewsModifiedByNavigations = new HashSet<News>();
            ProductCreatedByNavigations = new HashSet<Product>();
            ProductModifiedByNavigations = new HashSet<Product>();
        }

        public int AdminId { get; set; }
        public string? AdminName { get; set; }
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public int? RoleId { get; set; }
        public string? Img { get; set; }
        public bool? Status { get; set; }

        public virtual AdminRole? Role { get; set; }
        public virtual ICollection<News> NewsCreatedByNavigations { get; set; }
        public virtual ICollection<News> NewsModifiedByNavigations { get; set; }
        public virtual ICollection<Product> ProductCreatedByNavigations { get; set; }
        public virtual ICollection<Product> ProductModifiedByNavigations { get; set; }
    }
}
