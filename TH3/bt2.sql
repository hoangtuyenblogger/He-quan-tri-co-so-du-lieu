/*
1. Viết thủ tục xuất thông tin hóa đơn của nhân viên khi nhập mã nhân viên
*/
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
alter PROCEDURE xuat_thong_tin_hoa_don_nv 
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


-- ==================================================================================================================== --
-- ==================================================================================================================== --
/*
2. Viết thủ tục xuất thông tin chi tiết các hóa đơn của một khách hàng khi nhập mã khách
hàng
*/
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
alter PROCEDURE xuat_thong_tin_chi_tiet_hoa_don_khach_hang 
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

-- ==================================================================================================================== --
-- ==================================================================================================================== --
/*
3.Viết thủ tục xuất thông tin các hóa đơn được lập trong 1 khoảng thời gian do người dùng
nhập.
*/
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
alter PROCEDURE xuat_thong_tin_chi_tiet_hoa_don_khach_hang 
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