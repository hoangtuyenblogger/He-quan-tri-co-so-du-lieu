USE [QL_SinhVien]
GO
/****** Object:  StoredProcedure [dbo].[sp_THEM_SINHVIEN]    Script Date: 29/06/2020 8:31:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		hoang tuyen
-- Create date: 2020
-- Description:	1.	Viết giao dịch đảm bảo việc thực hiện thêm 1 sinh viên mới và cập nhật lại sỉ số của lớp mà sinh viên đó thuộc về 
-- sao cho sỉ số không được vượt quá 45. Nếu không được hủy cả 2 công việc và báo lỗi.
-- exec sp_THEM_SINHVIEN 'D18HT0112',N'HOÀNG', N'KIM TUYẾN','1','01-01-2000','trần văn ơn','0123655','D18HT01','150'
-- =============================================
ALTER PROCEDURE [dbo].[sp_THEM_SINHVIEN] 
	@MASV VARCHAR(10),
	@HO NVARCHAR(30),
	@TEN NVARCHAR(30),
	@PHAI BIT,
	@NGAYSINH DATE,
	@DIACHI NVARCHAR(50),
	@DIENTHOAI NVARCHAR(10),
	@MALOP VARCHAR(10),
	@CMND VARCHAR(9)
AS
BEGIN
	BEGIN TRAN 
	
	INSERT INTO SinhVien VALUES(@MASV,@HO,@TEN,@PHAI,@NGAYSINH,@DIACHI,@DIENTHOAI,@MALOP,@CMND)
	UPDATE Lop 	SET SiSo = SiSo + 1 WHERE Malop = @MALOP
	
	
	IF (SELECT SiSo FROM Lop WHERE Malop = @MALOP) > 45
	BEGIN
		ROLLBACK TRAN 
		print N'lỖI'
		RETURN
	END
	COMMIT TRAN 
END
