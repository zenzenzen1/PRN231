using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    public class Order
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int OrderId { get; set; }
        public int UserId { get; set; }
        public virtual User? User { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? ShipDate { get; set; }
        public decimal TotalPrice { get; set; }
        public Setting OrderStatus {set; get;} = null!;
        public Setting PaymentType { get; set; } = null!;
        
        [MaxLength(ModelSetting.LONG_STRING_LENGTH)]
        public string ShipAddress { get; set; } = string.Empty;

    }
}