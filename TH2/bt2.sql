/*
1. Viết thủ tục tìm kiếm sinh viên theo bất kỳ thành phần nào của họ tên
*/
USE [QL_Sinh_Vien]
GO
/****** Object:  StoredProcedure [dbo].[TimKiemHocSinh]    Script Date: 5/4/2020 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HOANG KIM TUYEN
-- Create date: 04/05/2020
-- Description:	Viết thủ tục tìm kiếm sinh viên theo bất kỳ thành phần nào của họ tên
-- exec TimKiemHocSinh N'Nguyễn Gia', N''
-- =============================================
ALTER PROCEDURE [dbo].[TimKiemHocSinh] 
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

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
/*
2. Viết thủ tục xuất ra thông tin kết quả học tập của sinh viên khi người dùng nhập
MaSV
*/
USE [QL_Sinh_Vien]
GO
/****** Object:  StoredProcedure [dbo].[sp_XuatThongTinHocTap]    Script Date: 5/4/2020 11:42:58 PM ******/
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
ALTER PROCEDURE [dbo].[sp_XuatThongTinHocTap] 
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

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

/*
3.Viết thủ tục hiển thị số sinh viên của 1 khoa khi người dùng nhập mã khoa. Nếu mã
khoa chưa có thì sẽ thêm một khoa mới vào bảng KHOA (có mã khoa là mã khoa
vừa mới nhập vào)
*/
USE [QL_Sinh_Vien]
GO
/****** Object:  StoredProcedure [dbo].[sp_HienThiSoSVCuaKhoa]    Script Date: 5/4/2020 11:43:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HOANG KIM TUYEN
-- Create date: 04/05/2020
-- Description:	Viết thủ tục hiển thị số sinh viên của 1 khoa khi người dùng nhập mã khoa...
-- exec sp_HienThiSoSVCuaKhoa N'CNTT', N''
-- =============================================
ALTER PROCEDURE [dbo].[sp_HienThiSoSVCuaKhoa]
	-- Add the parameters for the stored procedure here
	@ma_khoa char(4),
	@ten_khoa nvarchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF exists(SELECT        sv.*
			FROM          SinhVien as sv , LOP as l
			WHERE sv.MaLop = l.MaLop and l.MaKhoa = @ma_khoa)
		  begin
			SELECT        sv.*
			FROM          SinhVien as sv , LOP as l
			WHERE sv.MaLop = l.MaLop and l.MaKhoa = @ma_khoa
		  end
		  else
		  begin
				insert into KHOA values(@ma_khoa,@ten_khoa,0)
				print N'Cập nhật thành công'
		  end
END




----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
/*
4.Viết thủ tục thêm một sinh viên mới vào bảng SINHVIEN
*/
USE [QL_Sinh_Vien]
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemMoiSinhVien]    Script Date: 5/4/2020 11:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HOÀNG KIM TUYẾN
-- Create date: 04/05/2020
-- Description:	Viết thủ tục thêm một sinh viên mới vào bảng SINHVIEN
-- exec sp_ThemMoiSinhVien N'182443',N'Hoàng Kim',N'Tuyến',N'0',N'03/05/2000',N'16 Đoàn Thị Liên, Phú Lợi',N'012349999',N'D18HT01'
-- =============================================
ALTER PROCEDURE [dbo].[sp_ThemMoiSinhVien] 
	-- Add the parameters for the stored procedure here
	@mssv varchar(10), 
	@ho_dem nvarchar(30),
	@ten nvarchar(20),
	@phai bit,
	@ngay_sinh date,
	@dia_chi nvarchar(50),
	@dien_thoai nvarchar(14),
	@ma_lop varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists (  SELECT *
				FROM SinhVien
				WHERE MaSV = @mssv
				)
		begin
			print N'Đã tồn tại sinh viên có MSSV này, xem lại MSSV!'
		end
		else
		begin
			INSERT INTO SinhVien values(@mssv,@ho_dem,@ten,@phai,@ngay_sinh,@dia_chi,@dien_thoai,@ma_lop)
			print N'Đã thêm thành công!'
		end
END


------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- câu 5: thêm 1 sinh viên và tăng sĩ số lớp của sinh viên đó lên 1
USE [QL_Sinh_Vien]
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemMoiSinhVien]    Script Date: 5/5/2020 12:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HOÀNG KIM TUYẾN
-- Create date: 04/05/2020
-- Description:	Viết thủ tục thêm một sinh viên mới vào bảng SINHVIEN, tăng sĩ số lớp đó lên 1
-- exec sp_ThemMoiSinhVien N'124577',N'Hoàng Kim',N'Tuân',N'0',N'03/05/2000',N'16 Đoàn Thị Liên, Phú Lợi',N'012349999',N'D18HT02'
-- =============================================
ALTER PROCEDURE [dbo].[sp_ThemMoiSinhVien] 
	-- Add the parameters for the stored procedure here
	@mssv varchar(10), 
	@ho_dem nvarchar(30),
	@ten nvarchar(20),
	@phai bit,
	@ngay_sinh date,
	@dia_chi nvarchar(50),
	@dien_thoai nvarchar(14),
	@ma_lop varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists (  SELECT *
				FROM SinhVien
				WHERE MaSV = @mssv
				)
		begin
			print N'Đã tồn tại sinh viên có MSSV này, xem lại MSSV!'
		end
		else
		begin
			INSERT INTO SinhVien values(@mssv,@ho_dem,@ten,@phai,@ngay_sinh,@dia_chi,@dien_thoai,@ma_lop)
			print N'Đã thêm thành công!'

			UPDATE LOP 
			SET SiSo = SiSo + 1
			WHERE MaLop = @ma_lop

		end
END