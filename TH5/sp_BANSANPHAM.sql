USE [QL_HOADON]
GO
/****** Object:  StoredProcedure [dbo].[sp_BanSanPham]    Script Date: 29/06/2020 10:33:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		hoang tuyen
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[sp_BanSanPham] 
	@MAHD NVARCHAR(5),
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
			IF(SELECT SoLuongTon FROM SANPHAM WHERE MaSP = @MASP ) < 0
			BEGIN
				ROLLBACK TRAN
				RETURN
			END
		END
	END
	ELSE -- NẾU KHÔNG TỒN TẠI MÃ HÓA ĐƠN
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
	COMMIT TRAN
END
