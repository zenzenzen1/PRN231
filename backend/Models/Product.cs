using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    public class Product
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProductId { get; set; }
        
        [MaxLength(ModelSetting.NORMAL_STRING_LENGTH)]
        public string ProductName { get; set; } = string.Empty;
        
        public Setting Brand { get; set; } = null!;
        
        public Setting Category { get; set; } = null!;
        
        [Column(TypeName = "nvarchar(-1)")]
        public string Description { get; set; } = string.Empty;
        
        public virtual ICollection<Image> Images { get; set; } = null!;
        
        public int UnitInStock { get; set; }
        
        public bool Status { get; set; } = true;
        
        public DateTime CreatedAt {get; set;} = DateTime.Now;
        public DateTime? ModifiedAt {get; set;}
        
        
        
    }
}