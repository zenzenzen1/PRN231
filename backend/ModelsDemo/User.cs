using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class User
    {
        public User()
        {
            Comments = new HashSet<Comment>();
            Guarantees = new HashSet<Guarantee>();
            Orders = new HashSet<Order>();
            RepairBills = new HashSet<RepairBill>();
        }

        public int UserId { get; set; }
        public string? UserName { get; set; }
        public string? Address { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public bool? Status { get; set; }
        public string? Img { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Guarantee> Guarantees { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<RepairBill> RepairBills { get; set; }
    }
}
