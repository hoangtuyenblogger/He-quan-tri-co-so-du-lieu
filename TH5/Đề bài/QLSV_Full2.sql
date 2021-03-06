USE [master]
GO
/****** Object:  Database [QL_SinhVien]    Script Date: 10/12/2015 13:13:49 ******/
CREATE DATABASE [QL_SinhVien] ON  PRIMARY 
( NAME = N'QL_SinhVien_Dat', FILENAME = N'E:\Tuyen\QL_SinhVien.mdf' , SIZE = 5120KB , MAXSIZE = 204800KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'QL_SinhVien_Log', FILENAME = N'E:\Tuyen\QL_SinhVien.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 20%)
GO
ALTER DATABASE [QL_SinhVien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_SinhVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_SinhVien] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QL_SinhVien] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QL_SinhVien] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QL_SinhVien] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QL_SinhVien] SET ARITHABORT OFF
GO
ALTER DATABASE [QL_SinhVien] SET AUTO_CLOSE ON
GO
ALTER DATABASE [QL_SinhVien] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QL_SinhVien] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QL_SinhVien] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QL_SinhVien] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QL_SinhVien] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QL_SinhVien] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QL_SinhVien] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QL_SinhVien] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QL_SinhVien] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QL_SinhVien] SET  DISABLE_BROKER
GO
ALTER DATABASE [QL_SinhVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QL_SinhVien] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QL_SinhVien] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QL_SinhVien] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QL_SinhVien] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QL_SinhVien] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QL_SinhVien] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QL_SinhVien] SET  READ_WRITE
GO
ALTER DATABASE [QL_SinhVien] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QL_SinhVien] SET  MULTI_USER
GO
ALTER DATABASE [QL_SinhVien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QL_SinhVien] SET DB_CHAINING OFF
GO
USE [QL_SinhVien]
GO
/****** Object:  Default [dbo].[def_zero]    Script Date: 10/12/2015 13:13:49 ******/
CREATE DEFAULT [dbo].[def_zero] AS 0
GO
/****** Object:  Default [dbo].[def_BD]    Script Date: 10/12/2015 13:13:49 ******/
CREATE DEFAULT [dbo].[def_BD] AS N'Bình Dương'
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 10/12/2015 13:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKh] [char](5) NOT NULL,
	[TenKh] [nvarchar](50) NULL,
	[SoLop] [smallint] NULL,
 CONSTRAINT [PK_Khoa_MaKhoa] PRIMARY KEY CLUSTERED 
(
	[MaKh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'CNTT ', N'Công Nghê Thông Tin', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'CTXH ', N'Công Tác Xã Hội', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'DDT  ', N'Điện-Điện Tử', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'KHTN ', N'Khoa Học Tự Nhiên', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'KT   ', N'Kinh Tế', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'KTDT ', N'Kiến Trúc - Đô Thị', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'LLCT ', N'Lý Luận Chính Trị', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'LS   ', N'Lịch Sử', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'LU   ', N'Luật', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'NN   ', N'Ngoại Ngữ', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'NNTQ ', N'Ngôn Ngữ Trung Quốc', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'NV   ', N'Ngữ Văn', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'SP   ', N'Sư Phạm', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'TCAN ', N'Giáo Dục Thể Chất- Quốc Phòng An Ninh', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'TNMT ', N'Tài Nguyên Môi Trường', NULL)
INSERT [dbo].[Khoa] ([MaKh], [TenKh], [SoLop]) VALUES (N'XD   ', N'Xây Dựng', NULL)
/****** Object:  Rule [dbo].[rul_18nam]    Script Date: 10/12/2015 13:13:52 ******/
CREATE RULE [dbo].[rul_18nam] AS year(Current_Timestamp) - Year(@Ngay)>=18
GO
/****** Object:  Default [dbo].[df_Khongxacdinh]    Script Date: 10/12/2015 13:13:52 ******/
CREATE DEFAULT [dbo].[df_Khongxacdinh] AS N'Không rõ'
GO
/****** Object:  UserDefinedFunction [dbo].[CheckFnctn]    Script Date: 10/12/2015 13:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CheckFnctn]()
RETURNS int
AS 
BEGIN
   DECLARE @retval int
   SELECT @retval = COUNT(*) FROM CheckTbl
   RETURN @retval
END;
GO
/****** Object:  Table [dbo].[HocPhan]    Script Date: 10/12/2015 13:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocPhan](
	[MaHP] [varchar](10) NOT NULL,
	[TenHP] [nvarchar](50) NOT NULL,
	[SoTC] [tinyint] NULL,
	[MaKH] [char](5) NULL,
	[Chung] [bit] NULL,
 CONSTRAINT [PK_HP_MaHP] PRIMARY KEY CLUSTERED 
(
	[MaHP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'CSDL', N'Cơ Sở Dữ Liệu', 4, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'CTDL', N'Cấu Trúc Dữ Liệu', 4, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'CTR', N'Chính Trị', 3, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'DHOA', N'Ðồ Họa Máy Tính', 4, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'JAVA', N'Lập Trình JAVA', 5, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'NMTH', N'Nhập Môn Tin Họcc', 4, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'PPLT', N'Phương Pháp Lập Trình', 5, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'PTWB', N'Phát Triển Web', 3, NULL, NULL)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [MaKH], [Chung]) VALUES (N'TRR', N'Toán Rời Rạc', 3, NULL, NULL)
/****** Object:  Table [dbo].[Lop]    Script Date: 10/12/2015 13:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[Malop] [varchar](10) NOT NULL,
	[Tenlop] [nvarchar](30) NULL,
	[GVCN] [nvarchar](30) NULL,
	[MaKhoa] [char](5) NULL,
	[TrinhDo] [nvarchar](20) NULL,
	[SiSo] [smallint] NULL,
 CONSTRAINT [PK_L_MaLop] PRIMARY KEY CLUSTERED 
(
	[Malop] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'CKT2A', N'Kinh Tế 2A', N'Lê Thanh Hùng', N'KT   ', N'Cao đẳng', NULL)
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'CTH1A', N'Tin Học 1A', N'Nguyễn Văn Minh', N'CNTT ', N'Cao đẳng', NULL)
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'CTH1B', N'Tin Học 1B', N'Nguyễn Văn Thắng', N'CNTT ', N'Cao đẳng', NULL)
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'DLS36A', N'Lịch Sử 36A', N'Trần Văn Hải', N'LS   ', N'Đại học', NULL)
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'DNV36B', N'Ngữ Văn 36b', N'Nguyễn Thị Hoa', N'NV   ', N'Đại học', NULL)
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'DSP35B', N'Sư phạm 35B', N'Nguyễn Hoàng Nam', N'SP   ', N'Đại học', NULL)
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'DTH2B', N'Tin Học 2B', N'Nguyễn Văn Tùng', N'CNTT ', N'Đại học', NULL)
INSERT [dbo].[Lop] ([Malop], [Tenlop], [GVCN], [MaKhoa], [TrinhDo], [SiSo]) VALUES (N'DTH35A', N'Tin Học 35A', N'Hoàng Văn Thạnh', N'CNTT ', N'Đại học', NULL)
/****** Object:  Table [dbo].[SinhVien]    Script Date: 10/12/2015 13:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](10) NOT NULL,
	[HoSV] [nvarchar](30) NULL,
	[TenSV] [nvarchar](20) NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Dienthoai] [nvarchar](14) NULL,
	[MaLop] [varchar](10) NULL,
	[SoCMND] [varchar](9) NULL,
 CONSTRAINT [PK_SV_MaSV] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A101', N'LÊ Kiều', N'Oanh', 0, CAST(0xFB050B00 AS Date), N'12 Nguyễn Trãi Q3', N'9907896746', N'CTH1A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A102', N'Trần Văn', N'An', 1, CAST(0x08030B00 AS Date), N'14 Đinh Tiên Hoàng Q1', N'9907613123', N'CTH1A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A103', N'Nguyễn Thúy', N'Hiền', 0, CAST(0xF3050B00 AS Date), N'13 Trần Bình Trọng QPN', N'9909123126', N'CTH1A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A104', N'Nguyễn Thành', N'Nhân', 1, CAST(0xB9080B00 AS Date), N'15 Nguyễn Trãi Q3', N'9907213546', N'CTH1A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A201', N'Nguyễn', N'Lâm', 1, CAST(0x03140B00 AS Date), N'12 Trần Não PN', NULL, N'CKT2A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A202', N'Tạ Thành', N'Lam', 0, CAST(0x3E110B00 AS Date), N'172E Nguyễn Hồng GV', NULL, N'CKT2A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A203', N'Hoàng', N'Minh', 1, CAST(0x2E140B00 AS Date), N'132/12 Nguyễn Trãi Q5', NULL, N'CKT2A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'A204', N'Lê Thị', N'Hoa', 0, CAST(0xC1110B00 AS Date), N'98/16 Nguyễn Kiệm PN', N'9907892137', N'CKT2A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B101', N'Lê Bá', N'Hải', 1, CAST(0xFD050B00 AS Date), N'12 Trương Định Q3', N'9908131231', N'CTH1B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B102', N'Phạm Thị', N'Hoa', 0, CAST(0x0C070B00 AS Date), N'5 Lê Lai Q1', NULL, N'CTH1B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B103', N'Lê Vĩnh', N'Phúc', 1, CAST(0x14060B00 AS Date), N'12 Phan Văn Trị GV', NULL, N'CTH1B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B104', N'Phạm Văn', N'Hùng', 1, CAST(0x07070B00 AS Date), N'50 Nguyễn Kiệm PN', N'9909541312', N'CTH1B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B105', N'Nguyễn Thanh', N'Tâm', 1, CAST(0x6A090B00 AS Date), N'45 Lê Quang Định BT', N'9908231312', N'CTH1B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B201', N'Đỗ', N'Hoàng', 1, CAST(0x78120B00 AS Date), N'12 Nguyễn Kiệm PN', N'9909347477', N'DTH2B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B202', N'Trần Thị', N'Dung', 0, CAST(0x67150B00 AS Date), N'39/12a Nguyễn Thái Sơn', NULL, N'DTH2B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B203', N'Lê Văn', N'Lợi', 1, CAST(0x61140B00 AS Date), N'145/1A Nguyên Hồng GV', NULL, N'DTH2B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'B204', N'Đặng Trung', N'Tiến', 1, CAST(0x4C140B00 AS Date), N'11/1E Lê Lợi Gv', NULL, N'DTH2B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'C3501', N'Nguyễn Văn', N'Hùng', 1, CAST(0xD8080B00 AS Date), N'45 Bạch Đằng BT', NULL, N'DTH35A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'C3502', N'Lê Thị Tường', N'Vi', 0, CAST(0x12070B00 AS Date), N'56 Hai Bà Trưng Q1', N'9908512631', N'DTH35A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'C3503', N'Đỗ Kim', N'Loan', 0, CAST(0x970A0B00 AS Date), N'8 Cổng Quỳnh Q1', N'9907231232', N'DTH35A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'C3504', N'Trần', N'Hùng', 1, CAST(0x970A0B00 AS Date), N'45 Nguyễn Trãi Q5', N'9907213131', N'DSP35B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'C3505', N'Nguyễn Văn', N'Cường', 1, CAST(0xAE150B00 AS Date), N'123 Nguyễn Oanh GV', N'9907879899', N'DSP35B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'C3506', N'Trần', N'Lâm', 1, CAST(0x86150B00 AS Date), N'45 Quang Trung GV', NULL, N'DSP35B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'E3601', N'Nguyễn Hoàng', N'Nam', 1, CAST(0x610F0B00 AS Date), N'12/A Võ Thị Sáu Q3', NULL, N'DLS36A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'E3602', N'Nguyễn Hoàng', N'Ly', 0, CAST(0x580F0B00 AS Date), N'32/1 Phan Đăng Lưu BT', NULL, N'DLS36A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'E3603', N'Võ Tấn', N'Lộc', 1, CAST(0x24170B00 AS Date), N'21/E Nguyễn Đình Chiểu Q3', N'9908392879', N'DLS36A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'E3604', N'Trần Thị Ngọc', N'Anh', 0, CAST(0x2E160B00 AS Date), N'89 Nguyễn Thi Minh Khai Q3', NULL, N'DNV36B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'E3605', N'Trần Thanh', N'Tuấn', 1, CAST(0xB9150B00 AS Date), N'38 Võ Văn Tần Q3', N'9903732839', N'DNV36B', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'E3606', N'Phạm Hoàng', N'Long', 1, CAST(0xA7110B00 AS Date), N'12/21a Nguyễn V Lượng GV', NULL, N'DLS36A', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [DiaChi], [Dienthoai], [MaLop], [SoCMND]) VALUES (N'E3607', N'Võ Văn', N'Hùng', 1, CAST(0x39140B00 AS Date), N'98/2D Lê Đức Thọ GV', NULL, N'DNV36B', NULL)
/****** Object:  Table [dbo].[KetQua]    Script Date: 10/12/2015 13:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaSV] [varchar](10) NOT NULL,
	[MaHP] [varchar](10) NOT NULL,
	[HocKy] [tinyint] NOT NULL,
	[Diemlan1] [float] NULL,
	[DiemLan2] [float] NULL,
 CONSTRAINT [PK_KQ_MaSV_MaHP] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaHP] ASC,
	[HocKy] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A101', N'CTR', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A101', N'PPLT', 1, 3, 6)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A101', N'PTWB', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A101', N'TRR', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A102', N'DHOA', 1, 6.5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A102', N'PPLT', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A102', N'PTWB', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A102', N'TRR', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A103', N'CTR', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A103', N'DHOA', 1, 4, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A103', N'NMTH', 1, 7.5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A103', N'PPLT', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A103', N'PTWB', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A103', N'TRR', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A104', N'CTR', 1, 2, 5)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A104', N'DHOA', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A104', N'JAVA', 1, 3, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A104', N'PPLT', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A104', N'PTWB', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A104', N'TRR', 1, 3, 5)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A201', N'PTWB', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A202', N'JAVA', 1, 4, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A203', N'CSDL', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A204', N'CTDL', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A204', N'JAVA', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'A204', N'TRR', 1, 6.5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B101', N'CTR', 1, 3, 1)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B101', N'PPLT', 1, 4, 4)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B101', N'PTWB', 1, 10, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B101', N'TRR', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B102', N'CTR', 1, 9, 7)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B102', N'NMTH', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B102', N'PPLT', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B102', N'PTWB', 1, 2, 3)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B102', N'TRR', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B103', N'PPLT', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B103', N'PTWB', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B103', N'TRR', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B104', N'NMTH', 1, 3, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B104', N'PPLT', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B104', N'PTWB', 1, 8.5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B104', N'TRR', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B105', N'CTR', 1, 4, 7)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B105', N'PPLT', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B105', N'PTWB', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B105', N'TRR', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B204', N'CSDL', 1, 7.5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'B204', N'CTDL', 1, 4, 3)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3501', N'CSDL', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3501', N'CTDL', 1, 4, 6)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3501', N'CTR', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3501', N'PTWB', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3501', N'TRR', 1, 10, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3502', N'CSDL', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3502', N'CTDL', 1, 4, 8)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3502', N'TRR', 1, 9.5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3503', N'CSDL', 1, 10, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3503', N'JAVA', 1, 6, 6.5)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3503', N'PTWB', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3503', N'TRR', 1, 3, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3504', N'CSDL', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3504', N'CTDL', 1, 4, 3)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3504', N'PTWB', 1, 3, 5)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3505', N'CTDL', 1, 6, 3)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3505', N'DHOA', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3505', N'JAVA', 1, 4, 6.5)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3505', N'PPLT', 1, 3, 5)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'C3506', N'JAVA', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3601', N'CSDL', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3601', N'NMTH', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3601', N'PPLT', 1, 3, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3602', N'PPLT', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3602', N'PTWB', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3603', N'CSDL', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3603', N'CTDL', 1, 4, 6)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3603', N'CTR', 1, 5, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3603', N'PPLT', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3604', N'CSDL', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3604', N'CTDL', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3604', N'CTR', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3604', N'PPLT', 1, 8, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3604', N'PTWB', 1, 9, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3607', N'CSDL', 1, 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3607', N'DHOA', 1, 7, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [HocKy], [Diemlan1], [DiemLan2]) VALUES (N'E3607', N'PPLT', 1, 8, NULL)
/****** Object:  View [dbo].[DiemThiSV]    Script Date: 10/12/2015 13:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DiemThiSV]
	AS
	SELECT Top (100) s.MaSV, s.HoSV + ' ' + s.TenSV AS [Họ Tên],h.Tenhp,k.DiemLan1,k.DiemLan2
	FROM SinhVien s JOIN KetQua k ON s.MaSV = k.MaSV JOIN HocPhan h ON k.MaHP=h.Mahp
	ORDER BY s.MaSV
GO
/****** Object:  Default [DF_HocPhan_Chung]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[HocPhan] ADD  CONSTRAINT [DF_HocPhan_Chung]  DEFAULT ((0)) FOR [Chung]
GO
/****** Object:  Default [defNoiSinh]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [defNoiSinh]  DEFAULT (N'Bình Dương') FOR [DiaChi]
GO
/****** Object:  Default [DF_KetQua_HocKy]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[KetQua] ADD  CONSTRAINT [DF_KetQua_HocKy]  DEFAULT ((1)) FOR [HocKy]
GO
/****** Object:  Default [def_Diem]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[KetQua] ADD  CONSTRAINT [def_Diem]  DEFAULT ((0)) FOR [Diemlan1]
GO
/****** Object:  Check [chkDienThoai]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[SinhVien]  WITH NOCHECK ADD  CONSTRAINT [chkDienThoai] CHECK  (((left([DienThoai],(2))='09' AND substring([DienThoai],(3),(1)) like '[01234678]' OR left([DienThoai],(2))='01' AND substring([DienThoai],(3),(1)) like '[269]' AND substring([DienThoai],(4),(1)) like case when substring([DienThoai],(3),(1))='2' then '[01235678]' when substring([DienThoai],(3),(1))='6' then '[56789]' when substring([DienThoai],(3),(1))='9' then '9'  end) AND right([DienThoai],(7)) like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [chkDienThoai]
GO
/****** Object:  Check [chk_Diem]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [chk_Diem] CHECK  (([DiemLan1]>=(0) AND [DiemLan1]<=(10) AND [DiemLan1]*(2)=round([DiemLan1]*(2),(0)) AND [DiemLan2]>=(0) AND [DiemLan2]<=(10) AND [DiemLan2]*(2)=round([DiemLan2]*(2),(0))))
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [chk_Diem]
GO
/****** Object:  ForeignKey [FK_HocPhan_Khoa]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[HocPhan]  WITH CHECK ADD  CONSTRAINT [FK_HocPhan_Khoa] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Khoa] ([MaKh])
GO
ALTER TABLE [dbo].[HocPhan] CHECK CONSTRAINT [FK_HocPhan_Khoa]
GO
/****** Object:  ForeignKey [FK_Lop_Khoa]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKh])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_Khoa]
GO
/****** Object:  ForeignKey [FK_SV_L_MaLop]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SV_L_MaLop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([Malop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SV_L_MaLop]
GO
/****** Object:  ForeignKey [FK_KQ_HP_MaHP]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KQ_HP_MaHP] FOREIGN KEY([MaHP])
REFERENCES [dbo].[HocPhan] ([MaHP])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KQ_HP_MaHP]
GO
/****** Object:  ForeignKey [FK_KQ_SV_MaSV]    Script Date: 10/12/2015 13:13:54 ******/
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KQ_SV_MaSV] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KQ_SV_MaSV]
GO
