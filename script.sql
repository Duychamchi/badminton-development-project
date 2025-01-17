USE [CourtSync]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SubCourtID] [int] NOT NULL,
	[TimeSlotID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[BookingDate] [date] NOT NULL,
	[Status] [int] NOT NULL,
	[CancellationReason] [varchar](255) NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[PromotionID] [int] NULL,
	[InvoiceID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckIn]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckIn](
	[CheckInID] [int] IDENTITY(1,1) NOT NULL,
	[SubCourtID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
	[CheckInTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CheckInID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Court]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Court](
	[CourtID] [int] IDENTITY(1,1) NOT NULL,
	[CourtName] [nvarchar](255) NOT NULL,
	[CourtManagerID] [int] NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Phone] [varchar](50) NULL,
	[OpeningHours] [varchar](100) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Announcement] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CourtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluate]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluate](
	[EvaluateID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourtID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[EvaluateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EvaluateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Tax] [decimal](10, 2) NOT NULL,
	[Discount] [decimal](10, 2) NULL,
	[FinalAmount] [decimal](10, 2) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[RefundAmount] [decimal](10, 2) NOT NULL,
	[PaymentMethod] [varchar](100) NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[PaymentGateway] [varchar](100) NOT NULL,
	[PromotionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[CourtID] [int] NOT NULL,
	[PromotionName] [nvarchar](255) NULL,
	[Description] [text] NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SubCourtID] [int] NOT NULL,
	[BookingDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[TotalHours] [decimal](5, 2) NOT NULL,
	[BookingType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCourt]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCourt](
	[SubCourtID] [int] IDENTITY(1,1) NOT NULL,
	[CourtID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PricePerHour] [decimal](10, 2) NOT NULL,
	[TimeSlotId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCourtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[TimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[SlotType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/12/2024 1:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NULL,
	[Password] [varchar](255) NOT NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](50) NULL,
	[RoleType] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ((0)) FOR [RefundAmount]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotion] ([PromotionID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([SubCourtID])
REFERENCES [dbo].[SubCourt] ([SubCourtID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([TimeSlotID])
REFERENCES [dbo].[TimeSlot] ([TimeSlotID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD FOREIGN KEY([SubCourtID])
REFERENCES [dbo].[SubCourt] ([SubCourtID])
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD FOREIGN KEY([CourtManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD FOREIGN KEY([CourtID])
REFERENCES [dbo].[Court] ([CourtID])
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotion] ([PromotionID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD FOREIGN KEY([CourtID])
REFERENCES [dbo].[Court] ([CourtID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([SubCourtID])
REFERENCES [dbo].[SubCourt] ([SubCourtID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[SubCourt]  WITH CHECK ADD FOREIGN KEY([CourtID])
REFERENCES [dbo].[Court] ([CourtID])
GO
ALTER TABLE [dbo].[SubCourt]  WITH CHECK ADD FOREIGN KEY([TimeSlotId])
REFERENCES [dbo].[TimeSlot] ([TimeSlotID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD CHECK  (([BookingType]='Flexible' OR [BookingType]='Daily' OR [BookingType]='Fixed'))
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD CHECK  (([SlotType]='Flexible' OR [SlotType]='Daily' OR [SlotType]='Fixed'))
GO

-- insert table [User]
insert into [User] (Username, [Password], Email, Phone, RoleType) values('administrator', 'P@ssw0rd_777', 'admin@gmail.com', '0387697532', 0);
insert into [User] (Username, [Password], Email, Phone, RoleType) values('vinvestor999', 'P@ssw0rd_999', 'investor777@gmail.com', '0387823694', 2);
insert into [User] (Username, [Password], Email, Phone, RoleType) values('toretto111', 'P@ssw0rd_111', 'dominictoretto@gmail.com', '0387548251', 2);
insert into [User] (Username, [Password], Email, Phone, RoleType) values('vincenro222', 'P@ssw0rd_222', 'teddysmith@gmail.com', '0387957473', 2);
insert into [User] (Username, [Password], Email, Phone, RoleType) values('ferrari888', 'P@ssw0rd_888', 'laferarri247@gmail.com', '0387123558', 2);
insert into [User] (Username, [Password], Email, Phone, RoleType) values('john_doe', 'P@ssw0rd_666', 'mrjohn1@gmail.com', '0387123747', 1);
insert into [User] (Username, [Password], Email, Phone, RoleType) values('jane_smith', 'P@ssw0rd_333', 'janeladdy3@gmail.com', '0387996512', 1);
insert into [User] (Username, [Password], Email, Phone, RoleType) values('maroon5', 'P@ssw0rd_3333', 'maroon5@gmail.com', '0987654321', 2);

-- insert table [Court]
insert into [Court] (CourtName, CourtManagerID, [Location], Phone, OpeningHours, [Image], Announcement) values(N'Sân cầu lông Tân Bình - Fosup', 7, N'24 Phổ Quang, Phường 2, Tân Bình, Hồ Chí Minh', '0387996512', '05:00 - 21:00', 'https://img.courtsite.my/insecure/rs:auto:1920:0:0/g:sm/aHR0cHM6Ly9maXJlYmFzZXN0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vdjAvYi9jb3VydHNpdGUtdGVycmFmb3JtLmFwcHNwb3QuY29tL28vY2VudHJlSW1hZ2VzJTJGY2w1cm9kOTdvMjRwZjBxOGE5NDlzejd5NSUyRm9tMmZwcXZmdWxPOGJNaDFiWXpUeUU0aXowSzMtYTM2NGJiMzMtN2ZiOS00ZWE5LThiNTEtMTAyMzAwODM3MmRlLmpwZWc_YWx0PW1lZGlhJnRva2VuPWYxMDY2OWEwLTRjNzgtNDllOC04Y2ZlLTdiZmE1ZWJjNjE0YQ.webp', N'Chào mừng đến sân Tân Bình - Fosup');
insert into [Court] (CourtName, CourtManagerID, [Location], Phone, OpeningHours, [Image], Announcement) values(N'Sân cầu lông Hồng Hà Tân Bình', 7, N'45/3A Tây Thạnh, Tân Bình, Hồ Chí Minh, Việt Nam', '0387996512', '05:00 - 21:00', 'https://cdn.shopvnb.com/uploads/images/tin_tuc/danh-sach-11-san-cau-long-tan-binh-cac-long-thu-da-biet-chua--2.webp', N'Chào mừng đến sân Hồng Hà Tân Bình');
insert into [Court] (CourtName, CourtManagerID, [Location], Phone, OpeningHours, [Image], Announcement) values(N'Sân cầu lông Tân Bình - Sky', 6, N'Khu A9 Bạch Đằng (Sân Bay TSN), P.2, Quận Tân Bình', '0387123747', '05:00 - 21:00', 'https://img.courtsite.my/insecure/rs:auto:1920:0:0/g:sm/aHR0cHM6Ly9maXJlYmFzZXN0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vdjAvYi9jb3VydHNpdGUtdGVycmFmb3JtLmFwcHNwb3QuY29tL28vY2VudHJlSW1hZ2VzJTJGMDFDQzlRSzVTQjdGTkhOWVNWOUFUWjRYRTAlMkZvbTJmcHF2ZnVsTzhiTWgxYll6VHlFNGl6MEszLTRjOTVkZWUxLWY4M2UtNDRhNS05MmM4LWZkNjhhNTcwMmI5ZC5qcGc_YWx0PW1lZGlhJnRva2VuPWFkYmFhMDY2LTcyN2YtNGRlZS04ZTk3LTIzNTBiMTUxZDYxNg.webp', N'Chào mừng đến sân Tân Bình - Sky');
insert into [Court] (CourtName, CourtManagerID, [Location], Phone, OpeningHours, [Image], Announcement) values(N'Sân cầu lông Quân khu 7 Tân Bình', 6, N'142 Hoàng Văn Thụ, P.7, Quận Tân Bình', '0387123747', '05:00 - 21:00', 'https://img.courtsite.my/insecure/rs:auto:1200:0:0/g:sm/aHR0cHM6Ly9maXJlYmFzZXN0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vdjAvYi9jb3VydHNpdGUtdGVycmFmb3JtLmFwcHNwb3QuY29tL28vY2VudHJlSW1hZ2VzJTJGMDFDQzlRSzVTQjdGTkhOWVNWOUFUWjRYRTAlMkYzN2lQZk9Jd1pCZ0Y2TXpNdDV4QWRLck16V20xLThlMjRlYWFkLWQ5YzktNGUzNy04ZWY2LTZjODNiNWIyMGI2ZC5qcGc_YWx0PW1lZGlhJnRva2VuPWFlMDlmODYxLTcyZGItNDc1Ni1hNTc5LTk5OGNlNmQzOWViZQ.webp', N'Chào mừng đến sân Quân khu 7 Tân Bình');
insert into [Court] (CourtName, CourtManagerID, [Location], Phone, OpeningHours, [Image], Announcement) values(N'Sân cầu lông Tân Bình - Hoàng Hoa Thám', 7, N'367 Hoàng Hoa Thám, Quận Tân Bình', '0387996512', '05:00 - 21:00', 'https://img.courtsite.my/insecure/rs:auto:1920:0:0/g:sm/aHR0cHM6Ly9maXJlYmFzZXN0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vdjAvYi9jb3VydHNpdGUtdGVycmFmb3JtLmFwcHNwb3QuY29tL28vY2VudHJlSW1hZ2VzJTJGY2wxOHYzdDdlMWJuNjA3YTlha2FlODh2MSUyRm9tMmZwcXZmdWxPOGJNaDFiWXpUeUU0aXowSzMtOGIyMjk5YTUtYTczYi00MDg4LTg1NzgtNTM2MzIxMDI4MzY0LmpwZWc_YWx0PW1lZGlhJnRva2VuPTZhM2U3NDllLTJmNDItNGNlMC1hMGRkLTY1MTg1ZWMzMjlkMw.webp', N'Chào mừng đến sân Tân Bình - Hoàng Hoa Thám');

--insert table [TimeSlot]
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('05:00:00', '07:00:00', 'Daily');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('07:00:00', '09:00:00', 'Daily');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('09:00:00', '11:00:00', 'Daily');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('13:00:00', '15:00:00', 'Daily');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('15:00:00', '17:00:00', 'Daily');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('17:00:00', '19:00:00', 'Daily');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('19:00:00', '21:00:00', 'Daily');

insert into [TimeSlot] (StartTime, EndTime, SlotType) values('05:00:00', '07:00:00', 'Fixed');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('07:00:00', '09:00:00', 'Fixed');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('09:00:00', '11:00:00', 'Fixed');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('13:00:00', '15:00:00', 'Fixed');

insert into [TimeSlot] (StartTime, EndTime, SlotType) values('05:00:00', '07:00:00', 'Flexible');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('07:00:00', '09:00:00', 'Flexible');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('07:00:00', '09:00:00', 'Flexible');
insert into [TimeSlot] (StartTime, EndTime, SlotType) values('13:00:00', '15:00:00', 'Flexible');

--insert table [SubCourt]
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A1', 35, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A1', 35, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A1', 35, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A1', 35, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A1', 35, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A1', 35, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A1', 35, 7);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A0', 55, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A0', 55, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A0', 55, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A0', 55, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A0', 55, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A0', 55, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A0', 55, 7);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A2', 55, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A2', 55, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A2', 55, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A2', 55, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A2', 55, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A2', 55, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(1, N'Sân cầu lông Tân Bình - Fosup - A2', 55, 7);

insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A0', 50, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A0', 50, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A0', 50, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A0', 50, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A0', 50, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A0', 50, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A0', 50, 7);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A1', 50, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A1', 50, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A1', 50, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A1', 50, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A1', 50, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A1', 50, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(2, N'Sân cầu lông Hồng Hà Tân Bình - A1', 50, 7);

insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B0', 60, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B0', 60, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B0', 60, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B0', 60, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B0', 60, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B0', 60, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B0', 60, 7);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B1', 75, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B1', 75, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B1', 75, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B1', 75, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B1', 75, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B1', 75, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(4, N'Sân cầu lông Quân khu 7 Tân Bình - B1', 75, 7);

insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A0', 70, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A0', 70, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A0', 70, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A0', 70, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A0', 70, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A0', 70, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A0', 70, 7);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A1', 80, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A1', 80, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A1', 80, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A1', 80, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A1', 80, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A1', 80, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(3, N'Sân cầu lông Tân Bình - Sky - A1', 80, 7);

insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A0', 45, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A0', 45, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A0', 45, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A0', 45, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A0', 45, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A0', 45, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A0', 45, 7);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A1', 50, 1);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A1', 50, 2);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A1', 50, 3);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A1', 50, 4);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A1', 50, 5);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A1', 50, 6);
insert into [SubCourt] (CourtID, [Name], PricePerHour, TimeSlotID) values(5, N'Sân cầu lông Tân Bình - Hoàng Hoa Thám - A1', 50, 7);

--insert Table [Schedule]
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(2, 1, '2024-05-01', '05:00', '07:00', 2.00, 'Fixed');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(2, 2, '2024-12-02', '09:00', '11:00', 2.00, 'Fixed');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(3, 3, '2024-08-06', '13:00', '15:00', 2.00, 'Flexible');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(8, 1, '2024-05-07', '07:00', '09:00', 2.00, 'Fixed');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(8, 4, '2024-05-01', '19:00', '21:00', 2.00, 'Flexible');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(4, 6, '2024-02-01', '13:00', '15:00', 2.00, 'Daily');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(4, 2, '2024-07-23', '19:00', '21:00', 2.00, 'Fixed');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(5, 9, '2024-03-18', '07:00', '09:00', 2.00, 'Daily');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(8, 7, '2024-02-04', '13:00', '15:00', 2.00, 'Fixed');
insert into [Schedule] (UserID, SubCourtID, BookingDate, StartTime, EndTime, TotalHours, BookingType) values(4, 5, '2024-04-07', '05:00', '07:00', 2.00, 'Flexible');

--insert Table [Promotion]
insert into [Promotion] (CourtID, PromotionName, [Description], DiscountPercentage, StartDate, EndDate) values(1, N'Giảm giá mùa hè', 'Giảm giá 10% trong mùa hè', 10.00, '2024-06-01', '2024-08-31');
insert into [Promotion] (CourtID, PromotionName, [Description], DiscountPercentage, StartDate, EndDate) values(2, N'Giảm giá mùa đông', 'Giảm giá 20% trong mùa hè', 20.00, '2024-12-01', '2025-02-28');

--insert Table [Invoice]
insert into [Invoice] (UserID, TotalAmount, Tax, Discount, FinalAmount, InvoiceDate) values(2, 90.00, 10.00, 00.00, 89.00, '2024-05-01 07:24:32');
insert into [Invoice] (UserID, TotalAmount, Tax, Discount, FinalAmount, InvoiceDate) values(4, 100.00, 10.00, 12.00, 88.00, '2024-12-02 10:12:58');

--insert Table [Payment]
insert into [Payment] (UserID, TotalPrice, RefundAmount, PaymentMethod, PaymentStatus, PaymentDate, InvoiceID, PaymentGateway, PromotionID) values(2, 89.00, 0.00, 'Credit Card', 1, '2024-05-01 17:24:35', 1, 'PayPal', 1);
insert into [Payment] (UserID, TotalPrice, RefundAmount, PaymentMethod, PaymentStatus, PaymentDate, InvoiceID, PaymentGateway, PromotionID) values(4, 88.00, 0.00, 'Credit Card', 0, '2024-12-02 06:53:23', 1, 'PayPal', 2);

--insert Table [Booking]
insert into [Booking] (UserID, SubCourtID, TimeSlotID, ScheduleID, BookingDate, [Status], CancellationReason, TotalPrice, PromotionID, InvoiceID, PaymentID) values(2, 1, 1, 1, '2024-05-01', 1, '', 90, 1, 1, 1);
insert into [Booking] (UserID, SubCourtID, TimeSlotID, ScheduleID, BookingDate, [Status], CancellationReason, TotalPrice, PromotionID, InvoiceID, PaymentID) values(4, 2, 2, 2, '2024-12-02', 1, '', 100.00, 2, 2, 2);

--insert Table [CheckIn]
insert into [CheckIn] (SubCourtID, BookingID, CheckInTime, UserID) values(2, 1, '2024-05-01 05:00:00', 3);
insert into [CheckIn] (SubCourtID, BookingID, CheckInTime, UserID) values(1, 2, '2024-12-02 09:00:00', 6);

--insert Table [Evaluate]
insert into [Evaluate] (UserID, CourtID, Rating, Comment, EvaluateDate) values(2, 1, 5, N'Trải nghiệm tuyệt vời!', '2024-05-03 19:12:35');
insert into [Evaluate] (UserID, CourtID, Rating, Comment, EvaluateDate) values(4, 2, 4, N'Sân tốt, nhưng hơi đắt', '2024-05-07 14:32:42');
