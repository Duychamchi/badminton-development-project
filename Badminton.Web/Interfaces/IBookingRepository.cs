﻿using Badminton.Web.DTO.Booking;
using Badminton.Web.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Badminton.Web.Interfaces
{
    public interface IBookingRepository
    {
        // Create
        Task<Booking> CreateAsync(Booking bookingModel);
        Task<BookingDTO> CreateBookingAsync(BookingDTO createBookingDto);

        // Read
        Task<List<Booking>> GetAllAsync();
        Task<Booking?> GetByIdAsync(int id);
        Task<List<BookingDTO>> GetAllBookingsAsync();
        Task<BookingDTO> GetBookingByIdAsync(int id);
        Task<List<BookingDTO>> GetBookingsByUserIdAsync(int userId);
        Task<List<BookingDTO>> GetBookingsBySubCourtIdAsync(int subCourtId);

        // Update
        Task<Booking?> UpdateAsync(int id, BookingDTO bookingDTO);
        Task<BookingDTO> UpdateBookingAsync(int id, BookingDTO updateBookingDto);
        Task<BookingDTO> CancelBookingAsync(int bookingId, string cancellationReason);

        // Delete
        Task<Booking?> DeleteAsync(int id);
        Task DeleteBookingAsync(int bookingId);

        // Kiểm tra
        Task<bool> BookingExists(int id);
        Task<bool> IsTimeSlotAvailableAsync(int subCourtId, int timeSlotId, DateOnly bookingDate);

        // Tính toán
        Task<decimal> CalculateBookingPriceAsync(int subCourtId, int timeSlotId, int promotionId);
    }
}