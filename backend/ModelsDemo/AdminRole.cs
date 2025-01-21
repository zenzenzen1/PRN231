using System;
using System.Collections.Generic;

namespace backend.ModelsDemo
{
    public partial class AdminRole
    {
        public AdminRole()
        {
            Admins = new HashSet<Admin>();
        }

        public int RoleId { get; set; }
        public string? RoleName { get; set; }

        public virtual ICollection<Admin> Admins { get; set; }
    }
}
