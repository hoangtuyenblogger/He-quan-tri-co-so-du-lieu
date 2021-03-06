USE [master]
GO
/****** Object:  Database [QL_Sinh_Vien]    Script Date: 04/05/2020 11:25:04 SA ******/
CREATE DATABASE [QL_Sinh_Vien] ON  PRIMARY 
( NAME = N'QL_Sinh_Vien', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MISASME2017\MSSQL\DATA\QL_Sinh_Vien.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_Sinh_Vien_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MISASME2017\MSSQL\DATA\QL_Sinh_Vien_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_Sinh_Vien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_Sinh_Vien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_Sinh_Vien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QL_Sinh_Vien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_Sinh_Vien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_Sinh_Vien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_Sinh_Vien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_Sinh_Vien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_Sinh_Vien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_Sinh_Vien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_Sinh_Vien] SET  MULTI_USER 
GO
ALTER DATABASE [QL_Sinh_Vien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_Sinh_Vien] SET DB_CHAINING OFF 
GO
USE [QL_Sinh_Vien]
GO
/****** Object:  StoredProcedure [dbo].[sp_XuatThongTinHocTap]    Script Date: 04/05/2020 11:25:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HOANG KIM TUYEN
-- Create date: 04/05/2020
-- Description:	Viết thủ tục xuất ra thông tin kết quả học tập của sinh viên khi người dùng nhập
-- exec sp_XuatThongTinHocTap '03'
-- =============================================
CREATE PROCEDURE [dbo].[sp_XuatThongTinHocTap] 
	-- Add the parameters for the stored procedure here
	@mssv varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        SinhVien.MaSV, SinhVien.HoDem, SinhVien.Ten, KetQua.Diemlan1, LOP.TenLop, KetQua.MaHP
FROM            SinhVien INNER JOIN
                         KetQua ON SinhVien.MaSV = KetQua.MaSV INNER JOIN
                         LOP ON SinhVien.MaLop = LOP.MaLop
WHERE SinhVien.MaSV=@mssv
END

GO
/****** Object:  StoredProcedure [dbo].[TimKiemHocSinh]    Script Date: 04/05/2020 11:25:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HOANG KIM TUYEN
-- Create date: 04/05/2020
-- Description:	Viết thủ tục tìm kiếm sinh viên theo bất kỳ thành phần nào của họ tên
-- exec TimKiemHocSinh N'Nguyễn Gia',N''
-- =============================================
CREATE PROCEDURE [dbo].[TimKiemHocSinh] 
	-- Add the parameters for the stored procedure here
	@hodem nvarchar(30), 
	@ten nvarchar(20) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * 
	from SinhVien 
	where HoDem = @hodem or Ten = @ten

  
END

GO
/****** Object:  Table [dbo].[HocPhan]    Script Date: 04/05/2020 11:25:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocPhan](
	[MaHP] [nchar](10) NOT NULL,
	[TenHP] [nvarchar](30) NULL,
	[SoTC] [int] NULL,
 CONSTRAINT [PK_HocPhan] PRIMARY KEY CLUSTERED 
(
	[MaHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 04/05/2020 11:25:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaSV] [varchar](10) NOT NULL,
	[MaHP] [nchar](10) NULL,
	[Diemlan1] [float] NULL,
	[Diemlan2] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 04/05/2020 11:25:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHOA](
	[MaKhoa] [char](4) NOT NULL,
	[TenKhoa] [nchar](30) NULL,
	[SiSo] [int] NULL,
 CONSTRAINT [PK_KHOA] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 04/05/2020 11:25:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOP](
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](30) NULL,
	[GVCN] [nvarchar](30) NULL,
	[MaKhoa] [char](4) NULL,
	[SiSo] [int] NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 04/05/2020 11:25:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](10) NOT NULL,
	[HoDem] [nvarchar](30) NULL,
	[Ten] [nvarchar](20) NULL,
	[Phai] [bit] NULL,
	[NgaySinh] [date] NULL,
	[Diachi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](14) NULL,
	[MaLop] [varchar](10) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC]) VALUES (N'CTR       ', N'Chính trị', 3)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC]) VALUES (N'JAVA      ', N'Lập trình Java', 5)
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC]) VALUES (N'TPWB      ', N'Phát triển web', 3)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'01', N'JAVA      ', 8, 8)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'02', N'JAVA      ', 7, 7)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'03', N'JAVA      ', 6, 8)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'04', N'JAVA      ', 6, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'05', N'JAVA      ', 3, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'06', N'JAVA      ', 2, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'07', N'JAVA      ', 10, NULL)
INSERT [dbo].[KetQua] ([MaSV], [MaHP], [Diemlan1], [Diemlan2]) VALUES (N'08', N'JAVA      ', 6, NULL)
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SiSo]) VALUES (N'CNTT', N'Công nghệ thông tin           ', 70)
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SiSo]) VALUES (N'CTXH', N'Công tác xã hội               ', 50)
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SiSo]) VALUES (N'DDT ', N'Điện - điện tử                ', 65)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [GVCN], [MaKhoa], [SiSo]) VALUES (N'D16HT01', N'Hệ thống D16', N'Nguyễn Văn Nam', N'CNTT', 61)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [GVCN], [MaKhoa], [SiSo]) VALUES (N'D18HT01', N'Hệ thống 1', N'Lê Thanh Hùng', N'CNTT', 45)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [GVCN], [MaKhoa], [SiSo]) VALUES (N'D18HT02', N'Hệ thống 2', N'Nguyễn Văn Minh', N'CNTT', 50)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [GVCN], [MaKhoa], [SiSo]) VALUES (N'D18PM01', N'Phần mềm 1', N'Trần Văn Hải', N'CNTT', 60)
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'01', N'Tạ Thành', N'Lâm', 1, CAST(0x14230B00 AS Date), N'Bình Dương', N'012345678', N'D18HT01')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'02', N'Nguyễn Thanh', N'Tâm', 1, CAST(0x8C240B00 AS Date), N'Bình Dương', N'012345678', N'D18PM01')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'03', N'Phạm Văn', N'Hùng', 0, CAST(0x2D210B00 AS Date), N'Bình Dương', N'012653482', N'D18HT02')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'04', N'Phạm Thành', N'Long', 1, CAST(0x43250B00 AS Date), N'Bình Duong', N'012364785', N'D16HT01')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'05', N'Nguyễn Văn', N'Nam', 1, CAST(0x12230B00 AS Date), N'Bình Duong', N'012345652', N'D18HT02')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'06', N'Phạm Đình', N'Tùng', 1, CAST(0xFB240B00 AS Date), N'Bình Duong', N'0123456987', N'D18HT01')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'07', N'Võ Thị', N'Trang', 1, CAST(0xA3240B00 AS Date), N'Bình Duong', N'013546589', N'D18HT01')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'08', N'Nguyễn Thị', N'Lan Anh', 1, CAST(0x9A220B00 AS Date), N'Bình Duong', N'012546542', N'D18HT02')
INSERT [dbo].[SinhVien] ([MaSV], [HoDem], [Ten], [Phai], [NgaySinh], [Diachi], [DienThoai], [MaLop]) VALUES (N'09', N'Nguyễn Gia', N'Bảo', 0, CAST(0x47240B00 AS Date), N'Bình Duong', N'013564976', N'D18HT01')
ALTER TABLE [dbo].[KetQua] ADD  CONSTRAINT [DF_KetQua_MaHP]  DEFAULT (N'JAVA') FOR [MaHP]
GO
ALTER TABLE [dbo].[KetQua] ADD  CONSTRAINT [DF_KetQua_Diemlan1]  DEFAULT ((0)) FOR [Diemlan1]
GO
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [DF_SinhVien_Diachi]  DEFAULT ('Bình Duong') FOR [Diachi]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_HocPhan] FOREIGN KEY([MaHP])
REFERENCES [dbo].[HocPhan] ([MaHP])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_HocPhan]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_SinhVien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_SinhVien]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_LOP]
GO
USE [master]
GO
ALTER DATABASE [QL_Sinh_Vien] SET  READ_WRITE 
GO
