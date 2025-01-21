using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace backend.Models
{
    public class User : IdentityUser
    {
        [MaxLength(ModelSetting.DEFAULT_STRING_LENGTH)]
        public string? Address { get; set; } = string.Empty;
        
        [MaxLength(ModelSetting.DEFAULT_STRING_LENGTH)]
        public string? ImageUrl { get; set; } = string.Empty;
        
    }
}