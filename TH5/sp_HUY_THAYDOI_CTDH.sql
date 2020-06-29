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
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE sp_HUY_THAYDOI_CTHD 
	@MAHD NVARCHAR(5),
	@TENSP NVARCHAR(40),
	@SOLUONGBANMOI SMALLINT
AS
BEGIN
	IF @SOLUONGBANMOI IS NULL 
	BEGIN
		UPDATE SANPHAM SET SoLuongTon = SoLuongTon + (SELECT SoLuong FROM CTHOADON WHERE MaHD = @MAHD) -- CỘNG LẠI SỐ LƯỢNG TỒN
		DELETE CTHOADON WHERE MaHD = @MAHD -- HỦY CTDONHANG
	END 
END
GO
