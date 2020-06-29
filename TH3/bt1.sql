create database QL_BAN_HANG 
go 
use QL_BAN_HANG

alter table HangHoa
add foreign key(ma_loaihang) REFERENCES LoaiHang(ma_loaihang)

alter table PhieuNhap
add foreign key(ma_ncc) REFERENCES NhaCungCap(ma_ncc)
alter table PhieuNhap
add foreign key(ma_nv) REFERENCES NhanVien(ma_nv)


alter table HoaDon
add foreign key(ma_kh) REFERENCES KhachHang(ma_kh)
alter table HoaDon
add foreign key(ma_nv) REFERENCES NhanVien(ma_nv)


alter table HoaDonCT
add foreign key(ma_hh) references HangHoa(ma_hh)
alter table HoaDonCT
add foreign key(sohoadon) references HoaDon(sohoadon)



-- ==================================================================================================================== --
-- ==================================================================================================================== --

-- 1. Cho xem danh sách nhân viên có tuổi từ 20 đến 40.
SELECT        *
FROM            NhanVien nv
WHERE			(YEAR(GETDATE())-YEAR(nv.ngaysinh)) BETWEEN 20 AND 40




-- ==================================================================================================================== --
-- ==================================================================================================================== --
/*-- 2. Cho xem danh sách nhân viên với độ tuổi. Thông tin kết quả bao gồm mã nhân viên, họ
và tên, Phái, tuổi, độ tuổi. Trong đó Họ và tên là được ghép bởi HoNv và TenNv; Độ
tuổi: dựa vào tuổi nếu tuổi <18: Thanh thiếu niên; Tuổi từ 18 đến < 35: Thanh niên; Tuổi
từ 35 đến < 50: Trung niên; Tuổi >=50: Cao niên */


SELECT ten_nv, ma_nv, (YEAR(GETDATE())-YEAR(nv.ngaysinh)) as tuoi, CASE WHEN (YEAR(GETDATE())-YEAR(nv.ngaysinh)) < 18 THEN 'Thanh thiếu niên' else 
			case when (YEAR(GETDATE())-YEAR(nv.ngaysinh)) < 35 then 'Thanh niên' else
			case when (YEAR(GETDATE())-YEAR(nv.ngaysinh)) < 50 then 'Trung niên' else
			case when (YEAR(GETDATE())-YEAR(nv.ngaysinh)) >= 50 then 'Cao niên' end end end end dotuoi

FROM            NhanVien nv

-- ==================================================================================================================== --
-- ==================================================================================================================== --
/* Cho xem danh sách 3 nhân viên lớn tuổi nhất, thông tin gồm: MaNV, HoTen, GioiTinh,
Tuoi */
select top 3 nv.ma_nv, nv.ten_nv, (YEAR(GETDATE())-YEAR(nv.ngaysinh)) as 'Tuổi'
from NhanVien nv
order by (YEAR(GETDATE())-YEAR(nv.ngaysinh)) DESC

-- ==================================================================================================================== --
-- ==================================================================================================================== --
/*
4.
Tạo query tính tiền trả trước của khách hàng, thông tin gồm: MaHD,
MaKH,TenSP,DonGiaBan, Songay, Thanhtien, TienTraTruoc, Conlai. Trong đó:
Songay = NgayGiaoHang – NgayLapHD; ThanhTien = SoLuong * DonGiaBan;
TienTraTruoc: Nếu SoNgay <=20 thì trả trước 20% của thành tiền, nếu 20<SoNgay<=30
thì trả trước 30% của thành tiền, các trường hợp còn lại trả trước 50% của thành tiền;
Conlai=ThanhTien-TienTraTruoc
*/
select hehe.*, (hehe.thanh_tien - hehe.TienTraTruoc) as ConLai
from
(
Select T.*, case when T.songay <= 20 then (0.2 * T.thanh_tien) else
			case when T.songay between 20 and 30 then (0.3 * T.thanh_tien) else
			(0.5 * T.thanh_tien) end end TienTraTruoc
			 
From
						(SELECT        KhachHang.ma_kh, LoaiHang.ten_loaihang, HoaDonCT.dongia, dongia * soluong as thanh_tien , DATEDIFF(DAY,HoaDonCT.ngaygiaohang,HoaDon.ngayhoadon) as songay
										
						FROM            HoaDon INNER JOIN
												 KhachHang ON HoaDon.ma_kh = KhachHang.ma_kh INNER JOIN
												 HoaDonCT ON HoaDon.sohoadon = HoaDonCT.sohoadon CROSS JOIN
												 LoaiHang
												 ) as T
) as hehe

-- ==================================================================================================================== --
-- ==================================================================================================================== --

/*
. 5.Tạo query cho xem tổng số lượng các sản phẩm đã bán. Thông tin bao gồm MaSP, TenSP,
DonviTinh, TongSoLuong. Trong đó TongSoLuong là sum của Soluong, kết nhóm theo
Masp, TenSP, DonviTinh
*/
SELECT        HangHoa.ma_hh, HangHoa.ten_hh, HangHoa.dv_tinh, SUM(soluong) as TongSoLuong
FROM            HoaDonCT INNER JOIN
                         HangHoa ON HoaDonCT.ma_hh = HangHoa.ma_hh
GROUP BY  HangHoa.ma_hh, HangHoa.ten_hh, HangHoa.dv_tinh

-- ==================================================================================================================== --
-- ==================================================================================================================== --
/*
6. Tạo query tính tổng tiền của từng hóa đơn của từng khách hàng. Thông tin bao gồm
MaKH, TenKH, MaHD, TongTienHD (Tổng tiền của từng hóa đơn). Trong đó:
TongTienHD = Sum(SoLuong * DonGiaBan), kết nhóm theo MaKH, TenKH và MaHD.
*/
SELECT        KhachHang.ma_kh, KhachHang.ten_kh, HoaDonCT.sohoadon, SUM(soluong * dongia) as TongTienHoaDon
FROM            HoaDonCT CROSS JOIN
                         KhachHang
GROUP BY KhachHang.ma_kh, KhachHang.ten_kh, HoaDonCT.sohoadon

-- ==================================================================================================================== --
-- ==================================================================================================================== --
/*
8. Tăng đơn giá của các sản phẩm lên 1%. 
*/
Update HoaDonCT SET dongia = dongia * 0.01
-- ==================================================================================================================== --
-- ==================================================================================================================== --
/*
9. Cập nhật đơn giá trong CTHoaDon bằng đơn giá trong HangHoa tăng thêm 20%.
*/
Update HoaDonCT 
SET HDCT.dongia = 0.2 * HH.dongia
FROM HoaDonCT HDCT, HangHoa HH
WHERE HDCT.ma_hh = HDCT.ma_hh
