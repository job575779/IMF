using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Development.API.Models
{
    public class Frequency
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Abbreviation { get; set; }
        [Required]
        public DateTime Date { get; set; }

        public virtual ICollection<Development> Developments { get; set; }
    }
}
