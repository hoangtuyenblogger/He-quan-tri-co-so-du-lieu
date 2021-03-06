USE [master]
GO
/****** Object:  Database [QL_BAN_HANG]    Script Date: 18/05/2020 11:06:29 SA ******/
CREATE DATABASE [QL_BAN_HANG] ON  PRIMARY 
( NAME = N'QL_BAN_HANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QL_BAN_HANG.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_BAN_HANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QL_BAN_HANG_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_BAN_HANG] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_BAN_HANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_BAN_HANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QL_BAN_HANG] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BAN_HANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BAN_HANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_BAN_HANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_BAN_HANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_BAN_HANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_BAN_HANG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_BAN_HANG] SET  MULTI_USER 
GO
ALTER DATABASE [QL_BAN_HANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_BAN_HANG] SET DB_CHAINING OFF 
GO
USE [QL_BAN_HANG]
GO
/****** Object:  StoredProcedure [dbo].[xuat_thong_tin_chi_tiet_hoa_don_khach_hang]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hoang Kim Tuyen
-- Create date: 18/05/2020
-- Description:	xuất thông tin chi tiết các hóa đơn
-- exec : xuat_thong_tin_chi_tiet_hoa_don_khach_hang 'kh1'
-- =============================================
CREATE PROCEDURE [dbo].[xuat_thong_tin_chi_tiet_hoa_don_khach_hang] 
	-- Add the parameters for the stored procedure here
	@ms_kh nchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        KhachHang.ma_kh, KhachHang.ten_kh, HoaDonCT.sohoadonct, HoaDonCT.sohoadon, HoaDonCT.soluong, HoaDonCT.dongia, HoaDonCT.thanhtien
FROM            HoaDonCT CROSS JOIN
                         KhachHang
WHERE @ms_kh =  KhachHang.ma_kh
END

GO
/****** Object:  StoredProcedure [dbo].[xuat_thong_tin_hoa_don_nv]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hoang Kim Tuyen
-- Create date: 18/05/2020
-- Description:	Viết thủ tục xuất thông tin hóa đơn của nhân viên khi nhập mã nhân viên
-- exec xuat_thong_tin_hoa_don_nv 'nv1'
-- =============================================
CREATE PROCEDURE [dbo].[xuat_thong_tin_hoa_don_nv] 
	-- Add the parameters for the stored procedure here
	@ms_nv nchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        NhanVien.ma_nv, NhanVien.ten_nv, HoaDon.sohoadon, HoaDon.ngayhoadon, HoaDon.noidung, HoaDon.ma_kh
FROM            HoaDon INNER JOIN
                         NhanVien ON HoaDon.ma_nv = NhanVien.ma_nv
WHERE @ms_nv = NhanVien.ma_nv
END

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[ma_hh] [nchar](50) NOT NULL,
	[ten_hh] [nvarchar](128) NULL,
	[dv_tinh] [nvarchar](50) NULL,
	[dongia] [decimal](18, 0) NULL,
	[ma_loaihang] [nchar](50) NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[ma_hh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[sohoadon] [uniqueidentifier] NOT NULL,
	[ngayhoadon] [datetime] NULL,
	[ma_kh] [nchar](50) NULL,
	[noidung] [nvarchar](128) NULL,
	[ma_nv] [nchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[sohoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonCT]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonCT](
	[sohoadonct] [uniqueidentifier] NOT NULL,
	[sohoadon] [uniqueidentifier] NULL,
	[ma_hh] [nchar](50) NULL,
	[soluong] [decimal](18, 0) NULL,
	[dongia] [decimal](18, 0) NULL,
	[thanhtien] [money] NULL,
	[ngaygiaohang] [datetime] NULL,
 CONSTRAINT [PK_HoaDonCT] PRIMARY KEY CLUSTERED 
(
	[sohoadonct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ma_kh] [nchar](50) NOT NULL,
	[ten_kh] [nvarchar](128) NULL,
	[diachi] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ma_kh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[ma_loaihang] [nchar](50) NOT NULL,
	[ten_loaihang] [nvarchar](128) NULL,
	[ghichu] [nvarchar](128) NULL,
 CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[ma_loaihang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[ma_ncc] [nchar](50) NOT NULL,
	[Ten_ncc] [nvarchar](128) NULL,
	[diachi] [nvarchar](512) NULL,
	[dienthoai] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[ma_ncc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ma_nv] [nchar](50) NOT NULL,
	[ten_nv] [nvarchar](128) NULL,
	[diachi] [nvarchar](512) NULL,
	[dienthoai] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[ngayvaolam] [datetime] NULL,
	[luong] [decimal](18, 0) NULL,
	[ngaysinh] [date] NULL,
 CONSTRAINT [PK_NhanVien_1] PRIMARY KEY CLUSTERED 
(
	[ma_nv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[sophieunhap] [nchar](10) NOT NULL,
	[ngayphieunhap] [datetime] NULL,
	[ma_ncc] [nchar](50) NULL,
	[noidung] [nvarchar](512) NULL,
	[ma_nv] [nchar](50) NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[sophieunhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhapCT]    Script Date: 18/05/2020 11:06:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapCT](
	[sophieunhapct] [uniqueidentifier] NOT NULL,
	[sophieunhap] [nchar](50) NULL,
	[ma_hh] [nchar](50) NULL,
	[soluong] [decimal](18, 0) NULL,
	[dongia] [decimal](18, 0) NULL,
	[thanhtien] [money] NULL,
 CONSTRAINT [PK_PhieuNhapCT] PRIMARY KEY CLUSTERED 
(
	[sophieunhapct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[HangHoa] ([ma_hh], [ten_hh], [dv_tinh], [dongia], [ma_loaihang]) VALUES (N'ms1                                               ', N'But muc thien long', N'cai', CAST(5000 AS Decimal(18, 0)), N'bm                                                ')
INSERT [dbo].[HangHoa] ([ma_hh], [ten_hh], [dv_tinh], [dongia], [ma_loaihang]) VALUES (N'ms2                                               ', N'Compa thien long', N'cai', CAST(10000 AS Decimal(18, 0)), N'cm                                                ')
INSERT [dbo].[HangHoa] ([ma_hh], [ten_hh], [dv_tinh], [dongia], [ma_loaihang]) VALUES (N'ms3                                               ', N' Tap trang thien long', N'cai', CAST(3500 AS Decimal(18, 0)), N'tv                                                ')
INSERT [dbo].[HoaDon] ([sohoadon], [ngayhoadon], [ma_kh], [noidung], [ma_nv]) VALUES (N'7e7a4dd6-5ac7-402c-a0ab-5e4cf841b000', CAST(0x0000ABBF00000000 AS DateTime), N'kh1                                               ', N'Mua bút', N'nv1                                               ')
INSERT [dbo].[HoaDon] ([sohoadon], [ngayhoadon], [ma_kh], [noidung], [ma_nv]) VALUES (N'142f69b8-ba1c-4095-abe1-bf75ff3f7580', CAST(0x0000ABBF00000000 AS DateTime), N'kh3                                               ', N'Mua compa', N'nv2                                               ')
INSERT [dbo].[HoaDon] ([sohoadon], [ngayhoadon], [ma_kh], [noidung], [ma_nv]) VALUES (N'3c5fd847-13f6-4323-afa7-dabf36c0f88b', CAST(0x0000ABBF00000000 AS DateTime), N'kh2                                               ', N'Mua tập', N'nv1                                               ')
INSERT [dbo].[HoaDonCT] ([sohoadonct], [sohoadon], [ma_hh], [soluong], [dongia], [thanhtien], [ngaygiaohang]) VALUES (N'36ba6520-cc47-4e5b-8a5f-2a74239f928f', NULL, N'kh1                                               ', CAST(2 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 2000.0000, NULL)
INSERT [dbo].[HoaDonCT] ([sohoadonct], [sohoadon], [ma_hh], [soluong], [dongia], [thanhtien], [ngaygiaohang]) VALUES (N'43d65e0f-8e18-47d1-ae69-40d98da5ce38', NULL, N'kh1                                               ', CAST(5 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), 25000.0000, NULL)
INSERT [dbo].[HoaDonCT] ([sohoadonct], [sohoadon], [ma_hh], [soluong], [dongia], [thanhtien], [ngaygiaohang]) VALUES (N'a2ed0c28-4d16-4ced-ac32-a46b4c7e4103', NULL, N'kh2                                               ', CAST(5 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), 10000.0000, NULL)
INSERT [dbo].[KhachHang] ([ma_kh], [ten_kh], [diachi], [email], [dienthoai], [fax]) VALUES (N'kh1                                               ', N'Đại học Thủ Dầu Một', N'Trần Văn Ơn, Thủ Dầu Một', N'tdmu@edu.vn', N'0123456789', N'12354354')
INSERT [dbo].[KhachHang] ([ma_kh], [ten_kh], [diachi], [email], [dienthoai], [fax]) VALUES (N'kh2                                               ', N'Đại học Bình Dương', N'Hoàng Hoa Thám, Thủ Dầu Một', N'bdu@edu.com', N'6543131612', N'54664551')
INSERT [dbo].[KhachHang] ([ma_kh], [ten_kh], [diachi], [email], [dienthoai], [fax]) VALUES (N'kh3                                               ', N'Đại học Kinh tế - kĩ thuật Bình Dương', N'Đại lộ Bình Dương', N'ktkt@edu.com', N'1154654564', N'33654654')
INSERT [dbo].[LoaiHang] ([ma_loaihang], [ten_loaihang], [ghichu]) VALUES (N'bm                                                ', N'But muc', N'But muc sin so')
INSERT [dbo].[LoaiHang] ([ma_loaihang], [ten_loaihang], [ghichu]) VALUES (N'cm                                                ', N'Compa', N'Compa sin so')
INSERT [dbo].[LoaiHang] ([ma_loaihang], [ten_loaihang], [ghichu]) VALUES (N'tv                                                ', N'Tap viet', N'Tap viet sin so')
INSERT [dbo].[NhaCungCap] ([ma_ncc], [Ten_ncc], [diachi], [dienthoai], [email]) VALUES (N'ncc1                                              ', N'Cty Thien Long', N'16 Hoang Van Thu', N'0123456789', N'thienlong@co.com')
INSERT [dbo].[NhaCungCap] ([ma_ncc], [Ten_ncc], [diachi], [dienthoai], [email]) VALUES (N'ncc2                                              ', N'Cty Thien Long 2', N'61 Huynh Van Nghe', N'0123456985', N'thielong2@co.com')
INSERT [dbo].[NhaCungCap] ([ma_ncc], [Ten_ncc], [diachi], [dienthoai], [email]) VALUES (N'ncc3                                              ', N'Cty Thien Long 3', N'53 Doan Thi Lien', N'0121324452', N'thienlong3@co.com')
INSERT [dbo].[NhanVien] ([ma_nv], [ten_nv], [diachi], [dienthoai], [email], [ngayvaolam], [luong], [ngaysinh]) VALUES (N'nv1                                               ', N'Trần Cẩm Tú', N'15 Lê Hồng Phong', N'2121354354', N'camtu@ct.com', CAST(0x0000A8E400000000 AS DateTime), CAST(10000000 AS Decimal(18, 0)), CAST(0x041D0B00 AS Date))
INSERT [dbo].[NhanVien] ([ma_nv], [ten_nv], [diachi], [dienthoai], [email], [ngayvaolam], [luong], [ngaysinh]) VALUES (N'nv2                                               ', N'Nguyễn Thanh An', N'11 Trần Văn Ơn', N'3213543435', N'thanhan@ct.com', CAST(0x0000A49C00000000 AS DateTime), CAST(10000000 AS Decimal(18, 0)), CAST(0x20230B00 AS Date))
INSERT [dbo].[NhanVien] ([ma_nv], [ten_nv], [diachi], [dienthoai], [email], [ngayvaolam], [luong], [ngaysinh]) VALUES (N'nv3                                               ', N'Nguyễn Thanh Tùng', N'66 Cách mạng tháng 8', N'5545545455', N'thanhtung@ct.com', CAST(0x0000A1C200000000 AS DateTime), CAST(20000000 AS Decimal(18, 0)), CAST(0x57210B00 AS Date))
INSERT [dbo].[PhieuNhap] ([sophieunhap], [ngayphieunhap], [ma_ncc], [noidung], [ma_nv]) VALUES (N'1         ', CAST(0x0000ABBF00000000 AS DateTime), N'ncc1                                              ', N'Phieu nhap ngay 18/05', N'nv1                                               ')
INSERT [dbo].[PhieuNhap] ([sophieunhap], [ngayphieunhap], [ma_ncc], [noidung], [ma_nv]) VALUES (N'2         ', CAST(0x0000ABBF00000000 AS DateTime), N'ncc2                                              ', N'Phieu nhap ngay 18/05', N'nv1                                               ')
INSERT [dbo].[PhieuNhap] ([sophieunhap], [ngayphieunhap], [ma_ncc], [noidung], [ma_nv]) VALUES (N'3         ', CAST(0x0000ABBF00000000 AS DateTime), N'ncc3                                              ', N'Phieu nhap ngay 18/05', N'nv2                                               ')
INSERT [dbo].[PhieuNhapCT] ([sophieunhapct], [sophieunhap], [ma_hh], [soluong], [dongia], [thanhtien]) VALUES (N'747c1387-47bf-44ba-be65-05dd93aa9160', NULL, N'cm                                                ', CAST(5 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), 10000.0000)
INSERT [dbo].[PhieuNhapCT] ([sophieunhapct], [sophieunhap], [ma_hh], [soluong], [dongia], [thanhtien]) VALUES (N'2918b650-d7eb-4b50-adcc-bfa5823911f3', NULL, N'bm                                                ', CAST(5 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), 10000.0000)
INSERT [dbo].[PhieuNhapCT] ([sophieunhapct], [sophieunhap], [ma_hh], [soluong], [dongia], [thanhtien]) VALUES (N'11a9e9a4-171b-4a44-8bad-c3040523086d', NULL, N'cm                                                ', CAST(2 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2000.0000)
INSERT [dbo].[PhieuNhapCT] ([sophieunhapct], [sophieunhap], [ma_hh], [soluong], [dongia], [thanhtien]) VALUES (N'ccdef861-5c49-420b-b760-cc5f9e8987bb', NULL, N'bm                                                ', CAST(4 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 4000.0000)
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_sohoadon]  DEFAULT (newid()) FOR [sohoadon]
GO
ALTER TABLE [dbo].[HoaDonCT] ADD  CONSTRAINT [DF_HoaDonCT_sohoadonct]  DEFAULT (newid()) FOR [sohoadonct]
GO
ALTER TABLE [dbo].[PhieuNhapCT] ADD  CONSTRAINT [DF_PhieuNhapCT_sophieunhapct]  DEFAULT (newid()) FOR [sophieunhapct]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD FOREIGN KEY([ma_loaihang])
REFERENCES [dbo].[LoaiHang] ([ma_loaihang])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([ma_kh])
REFERENCES [dbo].[KhachHang] ([ma_kh])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([ma_nv])
REFERENCES [dbo].[NhanVien] ([ma_nv])
GO
ALTER TABLE [dbo].[HoaDonCT]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonCT_HoaDon] FOREIGN KEY([sohoadon])
REFERENCES [dbo].[HoaDon] ([sohoadon])
GO
ALTER TABLE [dbo].[HoaDonCT] CHECK CONSTRAINT [FK_HoaDonCT_HoaDon]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([ma_ncc])
REFERENCES [dbo].[NhaCungCap] ([ma_ncc])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([ma_nv])
REFERENCES [dbo].[NhanVien] ([ma_nv])
GO
USE [master]
GO
ALTER DATABASE [QL_BAN_HANG] SET  READ_WRITE 
GO
