-- bài 1
/*1.	Xây dựng thủ tục thêm 1 hàng hóa vào bảng Hàng hóa  “sp_ThemHangHoa”, 
tham số truyền vào là @ma_hh,@ten_hh, @dv_tinh, @dongia, @ma_loaihang. 
(Kiểm tra hàng hóa đã tồn tại trước khi thêm).*/
-- exec sp_ThemHangHoa N'bm1',N'Bút mực 1',N'cái',N'6000',N'bm'
-- =============================================
create PROCEDURE [dbo].[sp_ThemHangHoa] 
	@ma_hh nchar(50),
	@ten_hh nvarchar(50),
	@dv_tinh nvarchar(50), 
	@dongia decimal(18, 0), 
	@ma_loaihang nchar(50)
AS
BEGIN
	if not EXISTS 
	(
	SELECT *
	FROM HangHoa HH
	WHERE @ma_hh = HH.ma_hh
	)
	begin
		insert into HangHoa values(@ma_hh,@ten_hh,@dv_tinh,@dongia,@ma_loaihang)
	end
	else
	begin
		print N'Đã tồn tại hàng hóa này'
	end
END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- bài 2
/*2.	Xây dựng thủ tục xóa 1 hàng hóa trong bảng Hàng Hóa “sp_XoaHangHoa”, 
tham số truyền và là @ma_hh.*/
-- exec sp_XoaHangHoa 'ms1'
-- =============================================
create PROCEDURE [dbo].[sp_XoaHangHoa] 
	@ma_hh nchar(50)
AS
BEGIN
	delete from HangHoa
	where ma_hh = @ma_hh
END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- bài 3
/*2.	3.	Xây dựng thủ tục lấy hóa đơn “sp_LayHoaDon” tham số truyền vào là @SoHoaDon, 
kết quả trả về là thông tin các khách hàng, mặt hàng, số lượng, đơn giá và thành tiền của hóa đơn
*/
-- =============================================
create PROCEDURE [dbo].[sp_LayHoaDon] 
	@SoHoaDon uniqueidentifier
AS
BEGIN
	SELECT        KhachHang.ten_kh, KhachHang.diachi, KhachHang.dienthoai, HangHoa.ten_hh, HoaDonCT.soluong, HoaDonCT.dongia, HoaDonCT.thanhtien
	FROM            HoaDon INNER JOIN
                         KhachHang ON HoaDon.ma_kh = KhachHang.ma_kh INNER JOIN
                         HoaDonCT ON HoaDon.sohoadon = HoaDonCT.sohoadon INNER JOIN
                         HangHoa ON HoaDonCT.ma_hh = HangHoa.ma_hh
	WHERE HoaDon.sohoadon = @SoHoaDon
END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- bài 4
/*	
4.	Xây dựng thủ tục thống kê nhập hàng theo tháng “sp_ThongKeNhapHangTheoThang”  
với tham số truyền vào là @thang kiểu Datetime, 
kết quả trả về là danh sách mặt hàng và số lượng nhập.
*/
-- =============================================
create PROCEDURE [dbo].[sp_ThongKeNhapHangTheoThang] 
	@thang datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        PhieuNhap.sophieunhap, PhieuNhapCT.soluong
	FROM            PhieuNhap INNER JOIN
                         PhieuNhapCT ON PhieuNhap.sophieunhap = PhieuNhapCT.sophieunhap
	WHERE @thang = datepart(MONTH,PhieuNhap.ngayphieunhap)
END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-- bài 5
/*	
5.	Xây dựng thủ tục tính tồn kho theo mặt hàng “sp_ThongKeTonKhoMatHang”, 
kết quả trả về là số lượng tồn kho theo từng mặt hàng.
*/
-- exec sp_ThongKeTonKhoTheoLoaiHang
-- =============================================
ALTER PROCEDURE [dbo].[sp_ThongKeTonKhoTheoLoaiHang] 

AS
BEGIN
	SELECT a.ma_hh, sum(a.soluong) soluong_nhap into T1  FROM PhieuNhapCT a 
	SELECT b.ma_hh, sum(b.soluong) soluong_xuat into T2  FROM HoaDonCT b 

	select T.ten_hh, (T.soluong_nhap - T.soluong_xuat) tonkho
	from
	(
		select T1.ma_hh,T1.soluong_nhap,0  from T1
		union all
		select T2.ma_hh,0,T2.soluong_xuat From T2
	) as T
	group by T.ten_hh
END

drop table T1
drop table T2

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- bài 6
/*	
6.	Xây dựng thủ tục tính tồn kho theo loại hàng “sp_ThongKeTonKhoTheoLoaiHang”, 
kết quả trả về là số lượng tồn kho theo loại hàng.
*/
-- exec sp_ThongKeTonKhoTheoLoaiHang
-- =============================================
ALTER PROCEDURE [dbo].[sp_ThongKeTonKhoTheoLoaiHang] 

AS
BEGIN
	select *, (T.soluong_nhap - T.soluong_xuat) tonkho
	from
	(SELECT        HangHoa.ten_hh, sum(PhieuNhapCT.soluong) soluong_nhap, sum(HoaDonCT.soluong) soluong_xuat
	FROM            HangHoa INNER JOIN
                         HoaDonCT ON HangHoa.ma_hh = HoaDonCT.ma_hh INNER JOIN
                         PhieuNhapCT ON HangHoa.ma_hh = PhieuNhapCT.ma_hh
	group by HangHoa.ten_hh) as T
END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
/*
7.	7.	Xây dựng hàm tính tổng số lượng nhập hàng theo mã hàng “fn_TongNhapTheoMaHang” 
tham số truyền vào là @ma_hh, kết quả trả về là tổng số lượng nhập.(scalar)
*/
-- =============================================
create FUNCTION [dbo].[fn_TongNhapTheoMaHang] 
(
	-- Add the parameters for the function here
	@ma_hh nchar(50)
)
RETURNS int
AS
BEGIN
	
	RETURN 
	(SELECT        sum(soluong)
	FROM           PhieuNhapCT)
END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
/*
8.	Xây dựng hàm tính tổng số lượng xuất hàng theo mã hàng “fn_TongXuatTheoMaHang” 
tham số truyền vào là @ma_hh, kết quả trả về là tổng số lượng xuất.
*/
-- =============================================
-- exec fn_TongXuatTheoMaHang 'ms1'
ALTER FUNCTION [dbo].[fn_TongXuatTheoMaHang]
(
	-- Add the parameters for the function here
	@ma_hh nchar(50)
)
RETURNS int
AS
BEGIN
	
	RETURN 
	(SELECT        sum(soluong)
	FROM           HoaDonCT)
END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
/*
9.	Xây dựng hàm tính tổng số lượng xuất hàng theo mã hàng “fn_TongXuatTheoMaHang” 
tham số truyền vào là @ma_hh, kết quả trả về là tổng số lượng xuất.
*/
-- =============================================
-- exec fn_TongSoLuongTheoKhachHang 'kh1'
create FUNCTION [dbo].[fn_TongSoLuongTheoKhachHang]
(
	-- Add the parameters for the function here
	@ma_kh nchar(50)
)
RETURNS int
AS
BEGIN
	RETURN 
	(SELECT        sum(HoaDonCT.soluong)
	FROM            HoaDonCT INNER JOIN
                         HoaDon ON HoaDonCT.sohoadon = HoaDon.sohoadon INNER JOIN
                         KhachHang ON HoaDon.ma_kh = KhachHang.ma_kh
	WHERE KhachHang.ma_kh  = @ma_kh)

END
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

/*
10.	Tính s(n) = x + x2/2! + x3/3! + …. + xn/n!
*/
ALTER FUNCTION [dbo].[sp_TinhTong]
(
	@X float,
	@N float
)
RETURNS float
AS
BEGIN
	declare @s float
	declare @i float
	set @i = 1
	set @s = 0


	while @n <= @N
		begin
			set @s = @s + POWER(@X,@i)
			set @i = @i + 1
		end
	RETURN @s

END

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
/*
Câu 13.
*/
ALTER PROCEDURE [dbo].[sp_NhanVien&DoanhSo] 
	
AS
BEGIN
	--Khai báo biến @id, @title để lưu nội dung đọc
	declare @ten nvarchar(128)
	declare @so_luong decimal(18, 0)
	declare @tien decimal(18, 0)
	
	-- khai báo con trỏ
	declare contro cursor for 
	-- truy vấn
	(SELECT        NhanVien.ten_nv, HoaDonCT.soluong, HoaDonCT.thanhtien
	FROM            HoaDon INNER JOIN
                         HoaDonCT ON HoaDon.sohoadon = HoaDonCT.sohoadon INNER JOIN
                         NhanVien ON HoaDon.ma_nv = NhanVien.ma_nv
	WHERE Year(HoaDon.ngayhoadon) = 2016)


	-- mở con trỏ
	open contro
	-- đọc dòng đầu tiền
	fetch next from contro
	into @ten, @so_luong, @tien

	while @@FETCH_STATUS = 0
		begin
			print N'Tên nhân viên:' + @ten
			print N'Doanh số:' + @so_luong
			if @tien < 100000000
				begin
					print N'Không đạt yêu cầu '
				end
				else
				begin
					print N'Đạt yêu cầu'
				end

			-- đọc tiếp
			fetch next from contro
			into @ten, @so_luong, @tien
		end

	close contro -- đóng con trỏ
	deallocate contro -- giải phóng tài nguyên
END