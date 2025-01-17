﻿using Badminton.Web.DTO.TimeSlot;
using Badminton.Web.Models;

namespace Badminton.Web.Mappers
{
    public static class TimeSlotMapper
    {
        public static TimeSlotDTO ToFormatTimeSlotDTO(this TimeSlot timeModel)
        {
            return new TimeSlotDTO
            {
                TimeSlotId = timeModel.TimeSlotId,
                StartTime = timeModel.StartTime,
                EndTime = timeModel.EndTime,
                SlotType = timeModel.SlotType
            };
        }

        public static TimeSlot ToFormatTimeSlotFromCreate(this CreateTimeSlotDTO timeSlotDTO)
        {
            return new TimeSlot
            {
                StartTime = TimeOnly.Parse(timeSlotDTO.StartTime),
                EndTime = TimeOnly.Parse(timeSlotDTO.EndTime),
                SlotType = timeSlotDTO.SlotType
            };
        }
    }
}
