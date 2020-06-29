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
-- Description:	Xuất hóa đơn < số lượng tồn
-- =============================================
CREATE PROCEDURE sp_XUAT_HOADON 
	@MAHD NVARCHAR(50),
	@MASP SMALLINT,
	@SOLUONG SMALLINT,
	@DONGIABAN MONEY
AS
BEGIN
	BEGIN TRAN
	INSERT INTO CTHOADON VALUES(@MAHD, @MASP,@SOLUONG,@DONGIABAN)
	UPDATE SANPHAM SET SoLuongTon = SoLuongTon - @SOLUONG -- CẬP NHẬT SỐ LƯỢNG

	IF @SOLUONG > (SELECT SoLuongTon FROM SANPHAM WHERE MaSP = @MASP)
	BEGIN 
		ROLLBACK TRAN
		RETURN
	END
	COMMIT TRAN
END
GO
