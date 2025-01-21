using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    public class Setting
    {
        
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SettingId { get; set; }
        
        [MaxLength(ModelSetting.NORMAL_STRING_LENGTH)]
         public string Name { get; set; } = string.Empty;
        
        [MaxLength(ModelSetting.DEFAULT_STRING_LENGTH)]
        public string? Value { get; set; } = string.Empty;
        
        public int? TypeId { get; set; }
        public Setting? Type { get; set; } = null!;
        
        public virtual ICollection<Setting>? Settings { get; set; } = null!;
        
        public bool Status { get; set; } = true;
        
        [MaxLength(ModelSetting.DEFAULT_STRING_LENGTH)]
        public string? Description { get; set; } = string.Empty;
    }
}