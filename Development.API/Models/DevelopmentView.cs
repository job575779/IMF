using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Development.API.Models
{
    public class DevelopmentView
    {
        public long Id { get; set; }
        public string CountryName { get; set; }
        public string CountryCode { get; set; }
        public string IndicatorName { get; set; }
        public string IndicatorCode { get; set; }
        public string Frequency { get; set; }
        public DateTime Date { get; set; }
        public double Value { get; set; }
    }
}
