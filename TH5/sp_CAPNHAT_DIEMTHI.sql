USE [QL_SinhVien]
GO
/****** Object:  StoredProcedure [dbo].[sp_CAPTNHAT_DIEMTHI_LAN2]    Script Date: 29/06/2020 8:35:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		tuyen
-- Create date: 2020
-- Description:	Cập nhật điểm thi
-- =============================================
ALTER PROCEDURE [dbo].[sp_CAPTNHAT_DIEMTHI_LAN2] 
	@MASV VARCHAR(10),
	@DIEMLAN2 FLOAT
AS
BEGIN
	BEGIN TRAN
	UPDATE KetQua SET DiemLan2 = @DIEMLAN2 WHERE MaSV = @MASV

	DECLARE @DIEMLAN1 FLOAT
	SET @DIEMLAN1 = (SELECT Diemlan1 FROM KetQua WHERE MaSV = @MASV)
	IF @DIEMLAN1 IS NULL OR @DIEMLAN1 < 5
	BEGIN
		ROLLBACK TRAN
		PRINT 'LỖI'
		RETURN
	END
	COMMIT TRAN
END
