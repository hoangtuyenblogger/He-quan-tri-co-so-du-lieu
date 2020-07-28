﻿ALTER PROCEDURE [dbo].[sp_BanSanPham] 
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


---------------------------------------------------------------

	
AS
BEGIN
	DECLARE @HOTEN NVARCHAR(50)
	DECLARE @TENPHONG NVARCHAR(50)

	DECLARE CONTRO CURSOR FOR
		(	SELECT KHACHTRO.HoTen, PHONGTRO.TenPhong
			FROM KHACHTRO INNER JOIN
			PHONGTRO ON KHACHTRO.MaPhong = PHONGTRO.MaPhong)

	OPEN CONTRO
	FETCH NEXT FROM CONTRO INTO @HOTEN, @TENPHONG

	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT @HOTEN + N' Ở ' + @TENPHONG

			FETCH NEXT FROM CONTRO INTO @HOTEN, @TENPHONG
		END
		CLOSE CONTRO
		DEALLOCATE CONTRO
END



--------------------------------
-----------------------TRIGGER--------------
CREATE TRIGGER KIEMTRA_XOAHANGHOA 
   ON  HangHoa 
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	DECLARE @DELETED_MAHH NCHAR(50)
	SET @DELETED_MAHH = (SELECT ma_hh FROM deleted)

	IF EXISTS (SELECT ma_hh FROM HangHoa WHERE ma_hh = @DELETED_MAHH)
	BEGIN
		PRINT N'ĐÃ PHÁT SINH DỮ LIỆU, KHÔNG THỂ XÓA!!!'
	END
END
GO