using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

class DevelopmentViewEntityTypeConfiguration : IEntityTypeConfiguration<Development.API.Models.DevelopmentView>
{
    public void Configure(EntityTypeBuilder<Development.API.Models.DevelopmentView> builder)
    {
        builder.ToView("vwDevelopment");
        //builder.HasNoKey();
        builder.Property(e => e.Id).HasColumnName("ID");
        builder.Property(e => e.CountryName).HasColumnName("Country Name");
        builder.Property(e => e.CountryCode).HasColumnName("Country Code");

        builder.Property(e => e.IndicatorName).HasColumnName("Indicator Name");
        builder.Property(e => e.IndicatorCode).HasColumnName("Indicator Code");

        builder.Property(e => e.Frequency).HasColumnName("Frequency");

        builder.Property(e => e.Date).HasColumnType("date").HasColumnName("Date");

        builder.Property(e => e.Value).HasColumnType("double").HasColumnName("Value");
    }
}
