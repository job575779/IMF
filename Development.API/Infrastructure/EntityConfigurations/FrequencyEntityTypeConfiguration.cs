using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

class FrequencyEntityTypeConfiguration : IEntityTypeConfiguration<Development.API.Models.Frequency>
{
    public void Configure(EntityTypeBuilder<Development.API.Models.Frequency> builder)
    {

        builder.ToTable("Frequency");

        builder.Property(e => e.Id).HasColumnName("ID");

        builder.Property(e => e.Abbreviation)
                .IsRequired()
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength(true);

        builder.Property(e => e.Date).HasColumnType("date");

        builder.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(100);

        //builder.ToTable("Frequency");

        //builder.HasKey(d => d.Id);

        //builder.Property(d => d.Id)
        //    .UseHiLo("frequency_hilo")
        //    .IsRequired();

        //builder.Property(d => d.Name)
        //    .IsRequired(true)
        //    .HasMaxLength(100);

        //builder.Property(d => d.Abbreviation)
        //    .IsRequired(true)
        //    .HasMaxLength(1);

        //builder.Property(d => d.Date)
        //    .IsRequired(true);

    }
}
