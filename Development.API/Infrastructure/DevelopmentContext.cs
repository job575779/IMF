using Development.API.Infrastructure;
using Development.API.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;

namespace Development.API.Infrastructure
{
    public partial class DevelopmentContext : DbContext
    {

        public DevelopmentContext(DbContextOptions<DevelopmentContext> options) : base(options) { }

        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Indicator> Indicators { get; set; }
        public virtual DbSet<Frequency> Frequencies { get; set; }
        public virtual DbSet<Models.Development> Developments { get; set; }
        public virtual DbSet<DevelopmentView> DevelopmentView { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new CountryEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new IndicatorEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new FrequencyEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new DevelopmentEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new DevelopmentViewEntityTypeConfiguration());
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, DevelopmentContext context)
        {
            context.Database.EnsureCreated();
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //if (!optionsBuilder.IsConfigured)
            //{
            //    optionsBuilder.UseSqlServer("Server=(local);Database=IMF.WEO;Trusted_Connection=True;");
            //}

            //IConfigurationRoot configuration = new ConfigurationBuilder()
            //                    .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
            //                    .AddJsonFile("appsettings.json")
            //                    .Build();
            //optionsBuilder.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
        }

        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{
        //    modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

        //    modelBuilder.Entity<Country>(entity =>
        //    {
        //        entity.ToTable("Country");

        //        entity.Property(e => e.Id).HasColumnName("ID");

        //        entity.Property(e => e.Code)
        //            .IsRequired()
        //            .HasMaxLength(4)
        //            .IsUnicode(false);

        //        entity.Property(e => e.Name).IsRequired();
        //    });

        //    modelBuilder.Entity<Models.Development>(entity =>
        //    {
        //        entity.ToTable("Development");

        //        entity.Property(e => e.Id).HasColumnName("ID");

        //        entity.HasOne(d => d.Country)
        //            .WithMany(p => p.Developments)
        //            .HasForeignKey(d => d.CountryId)
        //            .OnDelete(DeleteBehavior.ClientSetNull)
        //            .HasConstraintName("FK_Development_Country");

        //        entity.HasOne(d => d.Frequency)
        //            .WithMany(p => p.Developments)
        //            .HasForeignKey(d => d.FrequencyId)
        //            .OnDelete(DeleteBehavior.ClientSetNull)
        //            .HasConstraintName("FK_Development_Frequency");

        //        entity.HasOne(d => d.Indicator)
        //            .WithMany(p => p.Developments)
        //            .HasForeignKey(d => d.IndicatorId)
        //            .OnDelete(DeleteBehavior.ClientSetNull)
        //            .HasConstraintName("FK_Development_Indicator");
        //    });

        //    modelBuilder.Entity<Frequency>(entity =>
        //    {
        //        entity.ToTable("Frequency");

        //        entity.Property(e => e.Id).HasColumnName("ID");

        //        entity.Property(e => e.Abbreviation)
        //            .IsRequired()
        //            .HasMaxLength(1)
        //            .IsUnicode(false)
        //            .IsFixedLength(true);

        //        entity.Property(e => e.Date).HasColumnType("date");

        //        entity.Property(e => e.Name)
        //            .IsRequired()
        //            .HasMaxLength(100);
        //    });

        //    modelBuilder.Entity<Indicator>(entity =>
        //    {
        //        entity.ToTable("Indicator");

        //        entity.Property(e => e.Id).HasColumnName("ID");

        //        entity.Property(e => e.Code)
        //            .IsRequired()
        //            .HasMaxLength(100);

        //        entity.Property(e => e.Name).IsRequired();
        //    });

        //    OnModelCreatingPartial(modelBuilder);
        //}

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

public class DevelopmentContextDesignFactory : IDesignTimeDbContextFactory<DevelopmentContext>
{
    public DevelopmentContext CreateDbContext(string[] args)
    {
        IConfigurationRoot configuration = new ConfigurationBuilder()
                               .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                               .AddJsonFile("appsettings.json")
                               .Build();

        var optionsBuilder = new DbContextOptionsBuilder<DevelopmentContext>()
            .UseSqlServer(configuration.GetConnectionString("DefaultConnection"));

        return new DevelopmentContext(optionsBuilder.Options);
    }
}
