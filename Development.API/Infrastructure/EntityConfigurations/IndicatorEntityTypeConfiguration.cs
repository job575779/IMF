using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

class IndicatorEntityTypeConfiguration : IEntityTypeConfiguration<Development.API.Models.Indicator>
{
    public void Configure(EntityTypeBuilder<Development.API.Models.Indicator> builder)
    {
        builder.ToTable("Indicator");

        builder.Property(e => e.Id).HasColumnName("ID");

        builder.Property(e => e.Code)
            .IsRequired()
            .HasMaxLength(100);

        builder.Property(e => e.Name).IsRequired();

        //builder.ToTable("Indicator");

        //builder.HasKey(d => d.Id);

        //builder.Property(d => d.Id)
        //    .UseHiLo("indicator_hilo")
        //    .IsRequired();

        //builder.Property(d => d.Name)
        //    .IsRequired(true);

        //builder.Property(d => d.Code)
        //    .IsRequired(true)
        //    .HasMaxLength(100);
    }
}
