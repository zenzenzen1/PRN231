using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    public class Image
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ImageId { get; set; }
        
        [MaxLength(ModelSetting.NORMAL_STRING_LENGTH)]
        public string ImageName { get; set; } = string.Empty;
        
        [MaxLength(ModelSetting.LONG_STRING_LENGTH)]
        public string ImageUrl { get; set; } = string.Empty;
        
        public int? ProductId { get; set; }
        public Product? Product { get; set; } = null!;
        
        public bool IsMainImage { get; set; } = true;
    }
}