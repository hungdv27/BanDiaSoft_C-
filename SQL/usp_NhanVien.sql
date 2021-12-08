--usp_NhanVien_Insert
Drop PROCEDURE usp_NhanVien_Insert;
GO

CREATE PROCEDURE usp_NhanVien_Insert 
    @manv NCHAR(10),
    @tennv NVARCHAR(50),
    @gioitinh NVARCHAR(10),
    @ngaysinh date, 
    @dienthoai NVARCHAR(50),
    @diachi NVARCHAR(50),
    @macv NCHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM NhanVien WHERE MaNV=@manv)
        BEGIN
            IF NOT EXISTS (SELECT * from dbo.CongViec WHERE MaCV=@macv)
            BEGIN
                select 1 as flag;
                return;
            END
            INSERT INTO NhanVien(MaNV,TenNV,GioiTinh,NgaySinh,DienThoai,DiaChi,MaCV)
            VALUES (@manv,@tennv,@gioitinh,@ngaysinh,@dienthoai,@diachi,@macv)
            SELECT 2 AS flag
        END
    ELSE    SELECT 0 as flag;
END
GO
EXECUTE usp_NhanVien_Insert 100,Hoang,Nam,'2012-10-17',0848622889,'Hung Yen',1;
GO





--usp_NhanVien_Update
DROP PROCEDURE usp_NhanVien_Update;
GO

CREATE PROCEDURE usp_NhanVien_Update
    @manv NCHAR(10),
    @tennv NVARCHAR(50),
    @gioitinh NVARCHAR(10),
    @ngaysinh date, 
    @dienthoai NVARCHAR(50),
    @diachi NVARCHAR(50),
    @macv NCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT * FROM NhanVien WHERE MaNV=@manv)
        BEGIN
            IF NOT EXISTS (SELECT * from dbo.CongViec WHERE MaCV=@macv)
            BEGIN
                select 1 as flag;
                return;
            END
            UPDATE NhanVien SET TenNV=@tennv, GioiTinh=@gioitinh, NgaySinh=@ngaysinh,DienThoai=@dienthoai,DiaChi=@diachi,MaCV=@macv WHERE MaNV=@manv
            SELECT 2 AS flag
        END
    ELSE    SELECT 0 as flag;
END
GO

EXECUTE usp_NhanVien_Update 1,'Hoang','Nam','2001-09-19',0848622889,'Hung Yen',100;
GO





--usp_NhanVien_Delete
DROP PROCEDURE usp_NhanVien_Delete;
GO

CREATE PROCEDURE usp_NhanVien_Delete
    @manv NCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT *FROM dbo.NhanVien WHERE MaNV=@manv)
    BEGIN
        UPDATE NhanVien SET MaCV = null WHERE MaNV=@manv
        select 1 as flag;
    END
    ELSE SELECT 0 as flag;
END

EXECUTE usp_NhanVien_Delete 1;