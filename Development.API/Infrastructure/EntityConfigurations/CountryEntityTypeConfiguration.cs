using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

class CountryEntityTypeConfiguration : IEntityTypeConfiguration<Development.API.Models.Country>
{
    public void Configure(EntityTypeBuilder<Development.API.Models.Country> builder)
    {
        builder.ToTable("Country");

        builder.Property(e => e.Id).HasColumnName("ID");

        builder.Property(e => e.Code)
                .IsRequired()
                .HasMaxLength(4)
                .IsUnicode(false);

        builder.Property(e => e.Name).IsRequired();

        //builder.ToTable("Country");

        //builder.HasKey(d => d.Id);

        //builder.Property(d => d.Id)
        //    .UseHiLo("country_hilo")
        //    .IsRequired();

        //builder.Property(d => d.Name)
        //    .IsRequired(true);

        //builder.Property(d => d.Code)
        //    .IsRequired(true)
        //    .HasMaxLength(4);

    }
}
