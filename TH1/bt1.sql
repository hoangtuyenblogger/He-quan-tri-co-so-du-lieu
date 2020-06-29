 -- 1. Cho xem danh sách sinh viên có tuổi từ 20 đến 22.

SELECT        MaSV, Ten, Phai, HoDem, NgaySinh, Diachi, DienThoai, MaLop
FROM            SinhVien
WHERE        (YEAR(GETDATE()) - YEAR(NgaySinh) BETWEEN 20 AND 22)

-- Tạo query cho xem kết quả thi của sinh viên, thông tin gồm các field: MaSV,
HoTen,TenHP, DiemLan1, KetQua, trong đó: field KetQua được xét như sau: nếu
DiemLan1>=5 thì đạt, ngược lại thì không đạt.
SELECT        SinhVien.MaSV, SinhVien.HoDem, HocPhan.TenHP, KetQua.Diemlan1, "KetQua" = case when KetQua.Diemlan1 >=5 then 'Dat' else 'Khong Dat' end
FROM            SinhVien INNER JOIN
                         KetQua ON SinhVien.MaSV = KetQua.MaSV INNER JOIN
                         HocPhan ON KetQua.MaHP = HocPhan.MaHP

-- câu 3: 
--Tạo query tính tổng số sinh viên theo lớp, thông tin bao gồm MaLop, TenLop,
---GVCN, SiSoLop, trong đó SiSoLop=count([MaSV])
 
SELECT        SinhVien.MaLop, LOP.TenLop, COUNT(SinhVien.MaSV) as SiSoLop
FROM            SinhVien INNER JOIN
                         LOP ON SinhVien.MaLop = LOP.MaLop
group by SinhVien.MaLop, LOP.TenLop, LOP.SiSo

-- câu 4:
/*
Tạo query cho xem điểm trung bình của từng sinh viên, thông tin gồm các Field:
MaSV, HoTen, DiemTB, XepLoai. Trong đó:DiemTB=
Round(Avg(IIF([diemlan1]>ISNULL([diemlan2],0),[diemlan1],[diemlan2])),1)
(Gợi ý: Hàm ISNULL(exp,valueifnull): Chuyển giá trị null thành 0); XepLoai: Nếu
DiemTB >=8, xếp loại Giỏi, 8> DiemTB >=6.5, xếp loại Khá, 6.5>DiemTB>=5,
xếp loại Trung bình, Còn lại là loại Yếu, kết nhóm theo MaSV, HoTen.

*/
SELECT *, CASE WHEN DiemTB >= 8 then N'Giỏi' else case when DiemTB>= 6.5 then N'Khá' else case when DiemTB>=5 then N'Trung Bình' else N'Yếu' end end end XepLoai
FROM(
SELECT        SinhVien.MaSV, SinhVien.HoDem, SinhVien.Ten, AVG(case when isnull(DiemLan1,0) > isnull(DiemLan2,0) then isnull(DiemLan1,0) else isnull(DiemLan2,0) end) as DiemTB
FROM            SinhVien INNER JOIN
                         KetQua ON SinhVien.MaSV = KetQua.MaSV
GROUP BY SinhVien.MaSV, SinhVien.HoDem, SinhVien.Ten
) AS HEHE


/*
Tạo query cho biết tổng số sinh viên thi lại theo lớp, thông tin bao gồm MaLop,
TenLop, TSSV_thilan2, nhóm theo MaLop, TenLop
*/
SELECT        LOP.MaLop, LOP.TenLop, count(*) as TSSV_DiemLan2
FROM            LOP CROSS JOIN
                         KetQua
WHERE DiemLan2 is not null
group by LOP.MaLop, LOP.TenLop



/*
6. Tạo query cho biết tổng số sinh viên thi lại theo từng học phần, thông tin bao gồm
MaHP, TenHP, TSSV_thilan2, nhóm theo MaHP, TenHP.
*/

SELECT        HocPhan.MaHP, HocPhan.TenHP, count(*) TSSV_thilan2
FROM            HocPhan INNER JOIN
                         KetQua ON HocPhan.MaHP = KetQua.MaHP
WHERE DiemLan2 is not null
group by HocPhan.MaHP, HocPhan.TenHP