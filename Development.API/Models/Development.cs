using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Development.API.Models
{
    public class Development
    {
        public long Id { get; set; }
        [Required]
        public int CountryId { get; set; }
        [Required]
        public int IndicatorId { get; set; }
        [Required]
        public int FrequencyId { get; set; }
        [Required]
        public double Value { get; set; }

        public virtual Country Country { get; set; }
        public virtual Frequency Frequency { get; set; }
        public virtual Indicator Indicator { get; set; }
    }
}
