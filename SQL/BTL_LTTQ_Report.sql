--4.1, Tìm kiếm theo thể loại
-- GO
-- DROP FUNCTION ufn_KhoDia_TimKiemDiaTheoTheLoai;
Go
CREATE FUNCTION ufn_KhoDia_TimKiemDiaTheoTheLoai
(
    @matheloai nchar(10)
)
RETURNS TABLE
AS
RETURN 
    (
        SELECT Anh, MaDia, TenDia,TheLoai.TenTL, SoLuong, DonGiaBan
        FROM KhoDia JOIN TheLoai ON KhoDia.MaTL = TheLoai.MaTL
        WHERE @matheloai= KhoDia.MaTL
    );
GO

SELECT * FROM ufn_KhoDia_TimKiemDiaTheoTheLoai('224567');


--4.2, Tìm kiếm theo noi sản xuất
-- GO
-- DROP FUNCTION ufn_KhoDia_TimKiemTheoNoiSanXuat;
GO
Create FUNCTION ufn_KhoDia_TimKiemTheoNoiSanXuat
(
    @mansx NCHAR(10)
)
RETURNS TABLE
AS
RETURN
    (        
        SELECT Anh, MaDia, TenDia, NoiSanXuat.TenNSX, SoLuong, DonGiaBan
        FROM KhoDia JOIN NoiSanXuat ON KhoDia.MaNSX = NoiSanXuat.MaNSX
        WHERE @mansx= KhoDia.MaNSX
    );
GO

SELECT * FROM ufn_KhoDia_TimKiemTheoNoiSanXuat('123456');



--5.1, Tìm kiếm hóa đơn theo mã hàng
GO
CREATE FUNCTION ufn_HoaDonBan_TimKiemTheoMaHang
(
    @mahang NCHAR(10)
)
RETURNS TABLE
AS
RETURN
    (
        SELECT * 
        FROM HoaDonBan
        WHERE MaHDB in (Select MaHDB FROM ChiTietHoaDonBan WHERE MaDia=@mahang)
    );
GO

Select * from ufn_HoaDonBan_TimKiemTheoMaHang('118560');

--5.2 Tìm kiếm hóa đơn bán theo mã nhân viên
GO
CREATE FUNCTION ufn_HoaDonBan_TimKiemTheoMaNhanVien
(
    @manv NCHAR(10)
)
RETURNS TABLE
AS
RETURN
    (
        SELECT * 
        FROM HoaDonBan
        WHERE MaNV=@manv
    );
GO

Select * from ufn_HoaDonBan_TimKiemTheoMaNhanVien('020102    ');

--5.2 Tìm kiếm hóa đơn bán theo mã nhân viên
GO
CREATE FUNCTION ufn_HoaDonBan_TimKiemTheoMaKhachHang
(
    @makh NCHAR(10)
)
RETURNS TABLE
AS
RETURN
    (
        SELECT * 
        FROM HoaDonBan
        WHERE MaKH=@makh
    );
GO

Select * from ufn_HoaDonBan_TimKiemTheoMaKhachHang('031617    ')

go
--6, Báo cáo danh sách sản phẩm không được chon trong 1 quý cho trước
/*
1,2,3 - quý 1
4,5,6 - quý 2
7,8,9 - quý 3
10,11,12 - quý 4*/
--Drop PROCEDURE usp_KhoDia_TimKiemSanPhamKhongBanDuocTheoQui
GO
CREATE PROCEDURE usp_KhoDia_TimKiemSanPhamKhongBanDuocTheoQui
(
    @qui int 
)
AS
BEGIN
    DECLARE @var1 int, @var2 int, @var3 int 
    if(@qui=1)
        BEGIN
            SET @var1=1
            SET @var2=2
            SET @var3=3
        END
     if(@qui=2)
        BEGIN
            SET @var1=4
            SET @var2=5
            SET @var3=6
        END 
    if(@qui=3)
        BEGIN
            SET @var1=7
            SET @var2=8
            SET @var3=9
        END 
    if(@qui=4)
        BEGIN
            SET @var1=10
            SET @var2=11
            SET @var3=12
        END 
    SELECT * FROM KhoDia
    WHERE MaDia NOT IN (select DISTINCT MaDia from ChiTietHoaDonBan CTHDB, HoaDonBan HDB WHERE CTHDB.MaHDB=HDB.MaHDB and CAST(MONTH(NgayBan)As int) in(@var1,@var2,@var3))
     
END;
GO
EXECUTE usp_KhoDia_TimKiemSanPhamKhongBanDuocTheoQui 1;


go
select * from HoaDonBan hdb join ChiTietHoaDonBan ct on hdb.MaHDB = ct.MaHDB join KhoDia kd on kd.MaDia = ct.MaDia

--7
GO
CREATE FUNCTION ufn_HoaDonNhap_TimKiemHoaDonNhapTheoThang
(
    @thang int
)
RETURNS TABLE
AS
RETURN
    (
        SELECT * FROM HoaDonNhap WHERE MONTH(NgayNhap)=@thang
    );

GO
SELECT * FROM ufn_HoaDonNhap_TimKiemHoaDonNhapTheoThang(5);

--8
GO
CREATE FUNCTION ufn_HoaDonBan_TimKiemHoaDonBanTheoKhachHang
(
    @KhangHang NCHAR(10)
)
RETURNS TABLE
AS
RETURN
    (
        SELECT * FROM HoaDonBan WHERE MaKH=@KhangHang
    );

GO
SELECT * FROM ufn_HoaDonBan_TimKiemHoaDonBanTheoKhachHang('888853    ')

--9

go

alter FUNCTION ufn_5NCC(
@nam int
)

RETURNS TABLE
AS
RETURN
    (
        SELECT TOP 5 HDN.MaNCC,TenNCC, COUNT(Soluong) as "So luong cung cap"
FROM ChiTietHoaDonNhap CTHDN,HoaDonNhap HDN, NhaCungCap
WHERE CTHDN.MaHDN=HDN.MaHDN and YEAR(NgayNhap)= @nam AND NhaCungCap.MaNCC=HDN.MaNCC
GROUP By HDN.MaNCC,TenNCC
ORDER BY COUNT(Soluong) Desc
    );

go
 select * from ufn_5NCC(2019);
go

create view vw_5NCC as
SELECT TOP 5 HDN.MaNCC,TenNCC, COUNT(Soluong) as "So luong cung cap"
FROM ChiTietHoaDonNhap CTHDN,HoaDonNhap HDN, NhaCungCap
WHERE CTHDN.MaHDN=HDN.MaHDN and YEAR(NgayNhap)=12016 AND NhaCungCap.MaNCC=HDN.MaNCC
GROUP By HDN.MaNCC,TenNCC
ORDER BY COUNT(Soluong) Desc;

go
select * from vw_5NCC
