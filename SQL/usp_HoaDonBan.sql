--usp_HoaDonBan_Insert
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_HoaDonBan_Insert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_HoaDonBan_Insert
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_HoaDonBan_Insert
   -- add more stored procedure parameters here
   @mahdb NCHAR(10),
   @manv NCHAR(10),
   @ngayban date, 
   @makh NCHAR(10),
   @thanhtien money
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM HoaDonBan WHERE MaHDB=@mahdb)
        BEGIN
            IF NOT EXISTS (select * from dbo.NhanVien WHERE MaNV=@manv)
                BEGIN
                    SELECT 1 as flag;
                    RETURN;
                END
            IF NOT EXISTS (select * from dbo.KhachHang WHERE MaKH=@makh)
                BEGIN
                    SELECT 2 as flag;
                    RETURN;
                END
            INSERT INTO HoaDonBan(MaHDB, MaNV, NgayBan,MaKH,ThanhTien)
            VALUES (@mahdb,@manv,@ngayban,@makh,@thanhtien);
            SELECT 3 AS flag;
        END
    ELSE SELECT 0 AS flag;
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_HoaDonBan_Insert 8000040,'020102','2021-10-02',919760,1000000;
GO








--usp_HoaDonBan_Update
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_HoaDonBanUpdate'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_HoaDonBanUpdate
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_HoaDonBanUpdate
    @mahdb NCHAR(10),
    @manv NCHAR(10),
    @ngayban date, 
    @makh NCHAR(10),
    @thanhtien money
AS
BEGIN
    IF EXISTS (SELECT * FROM HoaDonBan WHERE MaHDB = @mahdb)
        BEGIN
            IF NOT EXISTS (select * from dbo.NhanVien WHERE MaNV=@manv)
                BEGIN
                    SELECT 1 as flag;
                    RETURN;
                END
            IF NOT EXISTS (select * from dbo.KhachHang WHERE MaKH=@makh)
                BEGIN
                    SELECT 2 as flag;
                    RETURN;
                END
            UPDATE HoaDonBan SET MaNV=@manv,NgayBan=@ngayban,MaKH=@makh,ThanhTien=@thanhtien
            WHERE MaHDB=@mahdb;
            SELECT 3 as flag;
        END
    ELSE SELECT 0 as flag;
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_HoaDonBanUpdate 8000040,'020102','2021-10-02','919760',10000000;
GO

--usp_HoaDonBan_Delete
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_HoaDonBan_Delete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_HoaDonBan_Delete
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_HoaDonBan_Delete
    @mahdb NCHAR(10)
-- add more stored procedure parameters here
AS
BEGIN
    IF EXISTS (SELECT * FROM DBO.HoaDonBan WHERE MaHDB=@mahdb)
    BEGIN
        DELETE FROM ChiTietHoaDonBan WHERE MaHDB=@mahdb;
        DELETE FROM HoaDonBan WHERE MaHDB=@mahdb;
        Select 1 as flag;
    END
    ELSE SELECT 0 as flag;
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_HoaDonBan_Delete 800001;
GO