-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		hoang tuyen
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE sp_BanSanPham 
	@MAHD NVARCHAR(50),
	@MANV INT,
	@TENSP NVARCHAR(40),
	@SOLUONGBAN SMALLINT,
	@DONGIABAN MONEY
AS
BEGIN
	BEGIN TRAN
	DECLARE @MASP SMALLINT
	SET @MASP = (SELECT MaSP FROM SANPHAM WHERE TenSP = @TENSP ) -- LẤY MÃ SẢN PHẨM
	IF EXISTS (SELECT @MAHD FROM HOADON WHERE MaHD = @MAHD) -- TỒN TẠI MÃ HÓA ĐƠN
	BEGIN
		IF EXISTS(SELECT MaNV FROM NHANVIEN WHERE MaNV = @MANV) --  TỒN TẠI MÃ NHÂN VIÊN
		BEGIN
			INSERT INTO CTHOADON VALUES(@MAHD,@MASP,@SOLUONGBAN,@DONGIABAN)
			UPDATE SANPHAM SET SoLuongTon = SoLuongTon - @SOLUONGBAN
		END
	END
	ELSE -- NẾU KHÔNG TỒN TẠI MÃ HÓA ĐƠN
	BEGIN
		ROLLBACK TRAN
		RETURN
	END

	IF @SOLUONGBAN > (SELECT SoLuongTon FROM SANPHAM WHERE MaSP = @MASP ) -- NẾU SỐ LƯỢNG BÁN > SỐ LƯỢNG TỒN -> ROLLBACK
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
	COMMIT TRAN
END
GO
