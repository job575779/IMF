using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

class DevelopmentEntityTypeConfiguration
    : IEntityTypeConfiguration<Development.API.Models.Development>
{
    public void Configure(EntityTypeBuilder<Development.API.Models.Development> builder)
    {
        builder.ToTable("Development");

        builder.Property(e => e.Id).HasColumnName("ID");

        builder.HasOne(d => d.Country)
                .WithMany(p => p.Developments)
                .HasForeignKey(d => d.CountryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Development_Country");

        builder.HasOne(d => d.Frequency)
                .WithMany(p => p.Developments)
                .HasForeignKey(d => d.FrequencyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Development_Frequency");

        builder.HasOne(d => d.Indicator)
                .WithMany(p => p.Developments)
                .HasForeignKey(d => d.IndicatorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Development_Indicator");

        builder.Property(e => e.Value).HasColumnType("double");

        //builder.ToTable("Development");

        //builder.HasKey(d => d.Id);

        //builder.Property(d => d.Id)
        //    .UseHiLo("development_hilo")
        //    .IsRequired();

        //builder.Property(d => d.CountryId)
        //    .IsRequired(true);

        //builder.Property(d => d.IndicatorId)
        //    .IsRequired(true);

        //builder.Property(d => d.FrequencyId)
        //    .IsRequired(true);

        //builder.Property(d => d.Value)
        //    .IsRequired(true);


        //builder.HasOne(d => d.Country)
        //    .WithMany()
        //    .HasForeignKey(d => d.CountryId);

        //builder.HasOne(d => d.Indicator)
        //   .WithMany()
        //   .HasForeignKey(d => d.IndicatorId);

        //builder.HasOne(d => d.Frequency)
        //   .WithMany()
        //   .HasForeignKey(d => d.FrequencyId);
    }
}
