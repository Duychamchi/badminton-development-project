﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Badminton.Web.Models;

public partial class CourtSyncContext : DbContext
{
    public CourtSyncContext(DbContextOptions<CourtSyncContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Booking> Bookings { get; set; }

    public virtual DbSet<CheckIn> CheckIns { get; set; }

    public virtual DbSet<Court> Courts { get; set; }

    public virtual DbSet<Evaluate> Evaluates { get; set; }

    public virtual DbSet<Invoice> Invoices { get; set; }

    public virtual DbSet<Notification> Notifications { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

    public virtual DbSet<Promotion> Promotions { get; set; }

    public virtual DbSet<Schedule> Schedules { get; set; }

    public virtual DbSet<SubCourt> SubCourts { get; set; }

    public virtual DbSet<TimeSlot> TimeSlots { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Booking>(entity =>
        {
            entity.HasKey(e => e.BookingId).HasName("PK__Booking__73951ACD7B2C2F36");

            entity.ToTable("Booking");

            entity.Property(e => e.BookingId).HasColumnName("BookingID");
            entity.Property(e => e.CancellationReason)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PromotionId).HasColumnName("PromotionID");
            entity.Property(e => e.ScheduleId).HasColumnName("ScheduleID");
            entity.Property(e => e.Status)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.SubCourtId).HasColumnName("SubCourtID");
            entity.Property(e => e.TimeSlotId).HasColumnName("TimeSlotID");
            entity.Property(e => e.TotalHours).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.TotalPrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Promotion).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.PromotionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Booking__Promoti__5535A963");

            entity.HasOne(d => d.Schedule).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.ScheduleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Booking__Schedul__5441852A");

            entity.HasOne(d => d.SubCourt).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.SubCourtId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Booking__SubCour__52593CB8");

            entity.HasOne(d => d.TimeSlot).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.TimeSlotId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Booking__TimeSlo__534D60F1");

            entity.HasOne(d => d.User).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Booking__UserID__5165187F");
        });

        modelBuilder.Entity<CheckIn>(entity =>
        {
            entity.HasKey(e => e.CheckInId).HasName("PK__CheckIn__E64976A4B419A8A3");

            entity.ToTable("CheckIn");

            entity.Property(e => e.CheckInId).HasColumnName("CheckInID");
            entity.Property(e => e.BookingId).HasColumnName("BookingID");
            entity.Property(e => e.CheckInTime).HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Booking).WithMany(p => p.CheckIns)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CheckIn__Booking__628FA481");

            entity.HasOne(d => d.User).WithMany(p => p.CheckIns)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CheckIn__UserID__619B8048");
        });

        modelBuilder.Entity<Court>(entity =>
        {
            entity.HasKey(e => e.CourtId).HasName("PK__Court__C3A67CFA20B4CEB2");

            entity.ToTable("Court");

            entity.Property(e => e.CourtId).HasColumnName("CourtID");
            entity.Property(e => e.Announcement).HasMaxLength(2000);
            entity.Property(e => e.CourtManagerId).HasColumnName("CourtManagerID");
            entity.Property(e => e.CourtName)
                .IsRequired()
                .HasMaxLength(255);
            entity.Property(e => e.Image)
                .IsRequired()
                .IsUnicode(false);
            entity.Property(e => e.Location)
                .IsRequired()
                .HasMaxLength(255);
            entity.Property(e => e.OpeningHours)
                .IsRequired()
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PricePerHour).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.CourtManager).WithMany(p => p.Courts)
                .HasForeignKey(d => d.CourtManagerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Court__CourtMana__3C69FB99");
        });

        modelBuilder.Entity<Evaluate>(entity =>
        {
            entity.HasKey(e => e.EvaluateId).HasName("PK__Evaluate__2092E4DAFF164D0F");

            entity.ToTable("Evaluate");

            entity.Property(e => e.EvaluateId).HasColumnName("EvaluateID");
            entity.Property(e => e.CourtId).HasColumnName("CourtID");
            entity.Property(e => e.EvaluateDate).HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Court).WithMany(p => p.Evaluates)
                .HasForeignKey(d => d.CourtId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Evaluate__CourtI__66603565");

            entity.HasOne(d => d.User).WithMany(p => p.Evaluates)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Evaluate__UserID__656C112C");
        });

        modelBuilder.Entity<Invoice>(entity =>
        {
            entity.HasKey(e => e.InvoiceId).HasName("PK__Invoice__D796AAD52FA1A86E");

            entity.ToTable("Invoice");

            entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");
            entity.Property(e => e.BookingId).HasColumnName("BookingID");
            entity.Property(e => e.Discount).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.FinalAmount).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.InvoiceDate).HasColumnType("datetime");
            entity.Property(e => e.Tax).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Booking).WithMany(p => p.Invoices)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Invoice__Booking__5812160E");
        });

        modelBuilder.Entity<Notification>(entity =>
        {
            entity.HasKey(e => e.NotificationId).HasName("PK__Notifica__20CF2E32661A5F74");

            entity.ToTable("Notification");

            entity.Property(e => e.NotificationId).HasColumnName("NotificationID");
            entity.Property(e => e.IsRead).HasDefaultValue(false);
            entity.Property(e => e.Message).IsRequired();
            entity.Property(e => e.Time).HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Notifications)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Notificat__UserI__6A30C649");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.PaymentId).HasName("PK__Payment__9B556A58DE61D554");

            entity.ToTable("Payment");

            entity.Property(e => e.PaymentId).HasColumnName("PaymentID");
            entity.Property(e => e.BookingId).HasColumnName("BookingID");
            entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");
            entity.Property(e => e.PaymentGateway)
                .IsRequired()
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PaymentMethod)
                .IsRequired()
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PaymentStatus)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PromotionId).HasColumnName("PromotionID");
            entity.Property(e => e.RefundAmount).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.TotalPrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.TransactionId)
                .IsRequired()
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("TransactionID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Booking).WithMany(p => p.Payments)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Payment__Booking__5BE2A6F2");

            entity.HasOne(d => d.Invoice).WithMany(p => p.Payments)
                .HasForeignKey(d => d.InvoiceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Payment__Invoice__5DCAEF64");

            entity.HasOne(d => d.Promotion).WithMany(p => p.Payments)
                .HasForeignKey(d => d.PromotionId)
                .HasConstraintName("FK__Payment__Promoti__5EBF139D");

            entity.HasOne(d => d.User).WithMany(p => p.Payments)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Payment__UserID__5CD6CB2B");
        });

        modelBuilder.Entity<Promotion>(entity =>
        {
            entity.HasKey(e => e.PromotionId).HasName("PK__Promotio__52C42F2FF5D26E5C");

            entity.ToTable("Promotion");

            entity.Property(e => e.PromotionId).HasColumnName("PromotionID");
            entity.Property(e => e.CourtId).HasColumnName("CourtID");
            entity.Property(e => e.Description)
                .IsRequired()
                .HasColumnType("text");
            entity.Property(e => e.DiscountPercentage).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.PromotionName).HasMaxLength(255);

            entity.HasOne(d => d.Court).WithMany(p => p.Promotions)
                .HasForeignKey(d => d.CourtId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Promotion__Court__4222D4EF");
        });

        modelBuilder.Entity<Schedule>(entity =>
        {
            entity.HasKey(e => e.ScheduleId).HasName("PK__Schedule__9C8A5B69746774BA");

            entity.ToTable("Schedule");

            entity.Property(e => e.ScheduleId).HasColumnName("ScheduleID");
            entity.Property(e => e.BookingType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.SubCourtId).HasColumnName("SubCourtID");
            entity.Property(e => e.TotalHours).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.SubCourt).WithMany(p => p.Schedules)
                .HasForeignKey(d => d.SubCourtId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Schedule__SubCou__4D94879B");

            entity.HasOne(d => d.User).WithMany(p => p.Schedules)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Schedule__UserID__4CA06362");
        });

        modelBuilder.Entity<SubCourt>(entity =>
        {
            entity.HasKey(e => e.SubCourtId).HasName("PK__SubCourt__D8ADDD0C6A317FC1");

            entity.ToTable("SubCourt");

            entity.Property(e => e.SubCourtId).HasColumnName("SubCourtID");
            entity.Property(e => e.CourtId).HasColumnName("CourtID");
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(255);

            entity.HasOne(d => d.Court).WithMany(p => p.SubCourts)
                .HasForeignKey(d => d.CourtId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__SubCourt__CourtI__3F466844");

            entity.HasMany(d => d.TimeSlots).WithMany(p => p.SubCourts)
                .UsingEntity<Dictionary<string, object>>(
                    "SubCourtTimeSlot",
                    r => r.HasOne<TimeSlot>().WithMany()
                        .HasForeignKey("TimeSlotId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__SubCourtT__TimeS__48CFD27E"),
                    l => l.HasOne<SubCourt>().WithMany()
                        .HasForeignKey("SubCourtId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__SubCourtT__SubCo__47DBAE45"),
                    j =>
                    {
                        j.HasKey("SubCourtId", "TimeSlotId").HasName("PK__SubCourt__ECB11CF9DFD6710C");
                        j.ToTable("SubCourtTimeSlot");
                        j.IndexerProperty<int>("SubCourtId").HasColumnName("SubCourtID");
                        j.IndexerProperty<int>("TimeSlotId").HasColumnName("TimeSlotID");
                    });
        });

        modelBuilder.Entity<TimeSlot>(entity =>
        {
            entity.HasKey(e => e.TimeSlotId).HasName("PK__TimeSlot__41CC1F52E45ABC70");

            entity.ToTable("TimeSlot");

            entity.Property(e => e.TimeSlotId).HasColumnName("TimeSlotID");
            entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.SlotType)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__User__1788CCAC1FAB9210");

            entity.ToTable("User");

            entity.HasIndex(e => e.Username, "UQ__User__536C85E457127E23").IsUnique();

            entity.HasIndex(e => e.Email, "UQ__User__A9D10534E1F3CE66").IsUnique();

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RoleName)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}