﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Badminton.Web.Models;

public partial class Booking
{
    public int BookingId { get; set; }

    public int UserId { get; set; }

    public int SubCourtId { get; set; }

    public int TimeSlotId { get; set; }

    public int ScheduleId { get; set; }

    public DateOnly BookingDate { get; set; }

    public decimal TotalHours { get; set; }

    public string Status { get; set; }

    public string CancellationReason { get; set; }

    public decimal TotalPrice { get; set; }

    public int PromotionId { get; set; }

    public virtual ICollection<CheckIn> CheckIns { get; set; } = new List<CheckIn>();

    public virtual ICollection<Invoice> Invoices { get; set; } = new List<Invoice>();

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual Promotion Promotion { get; set; }

    public virtual Schedule Schedule { get; set; }

    public virtual SubCourt SubCourt { get; set; }

    public virtual TimeSlot TimeSlot { get; set; }

    public virtual User User { get; set; }
}