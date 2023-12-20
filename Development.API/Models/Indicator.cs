using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Development.API.Models
{
    public class Indicator
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Code { get; set; }

        public virtual ICollection<Development> Developments { get; set; }
    }
}
