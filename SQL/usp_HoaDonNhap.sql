--usp_HoaDonNhap_Insert
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_HoaDonNhap_Insert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_HoaDonNhap_Insert
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_HoaDonNhap_Insert
   -- add more stored procedure parameters here
   @mahdn NCHAR(10),
   @manv NCHAR(10),
   @ngaynhap date, 
   @mancc NCHAR(10),
   @thanhtien money
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM HoaDonNhap WHERE mahdn=@mahdn)
        BEGIN
            IF NOT EXISTS (SELECT * FROM dbo.NhanVien WHERE MaNV=@manv)
            BEGIN
                Select 1 as flag;
                RETURN;
            END

            IF NOT EXISTS (SELECT * FROM dbo.NhaCungCap WHERE MaNCC=@mancc)
            BEGIN
                Select 2 as flag;
                RETURN;
            END

            INSERT INTO HoaDonNhap(mahdn, MaNV, ngaynhap,mancc,ThanhTien)
            VALUES (@mahdn,@manv,@ngaynhap,@mancc,@thanhtien);
            SELECT 3 AS flag;
        END
    ELSE SELECT 0 AS flag;
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_HoaDonNhap_Insert 2000020,607444,'2017-07-05',617746,null;
GO






--usp_HoaDonNhap_Update
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_HoaDonNhap_Update'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_HoaDonNhap_Update
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_HoaDonNhap_Update
    @mahdn NCHAR(10),
    @manv NCHAR(10),
    @ngaynhap date, 
    @mancc NCHAR(10),
    @thanhtien money
AS
BEGIN
    IF EXISTS (SELECT * FROM HoaDonNhap WHERE mahdn = @mahdn)
        BEGIN
            IF NOT EXISTS (SELECT * FROM dbo.NhanVien WHERE MaNV=@manv)
            BEGIN
                Select 1 as flag;
                RETURN;
            END

            IF NOT EXISTS (SELECT * FROM dbo.NhaCungCap WHERE MaNCC=@mancc)
            BEGIN
                Select 2 as flag;
                RETURN;
            END

            UPDATE HoaDonNhap SET MaNV=@manv,ngaynhap=@ngaynhap,mancc=@mancc,ThanhTien=@thanhtien
            WHERE mahdn=@mahdn;
            SELECT 3 as flag;
        END
    ELSE SELECT 0 as flag;
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_HoaDonNhap_Update 2000020,607444,'2017-07-05',617746,10000000;
GO

--usp_HoaDonNhap_Delete
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_HoaDonNhap_Delete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_HoaDonNhap_Delete
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_HoaDonNhap_Delete
    @mahdn NCHAR(10)
-- add more stored procedure parameters here
AS
BEGIN
    IF EXISTS (SELECT * FROM dbo.HoaDonNhap WHERE MaHDN=@mahdn)
    BEGIN
        DELETE FROM ChiTietHoaDonNhap WHERE mahdn=@mahdn;
        DELETE FROM HoaDonNhap WHERE mahdn=@mahdn;
        Select 1 as flag;
    END
    ELSE SELECT 0 as flag;
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_HoaDonNhap_Delete 200001;
GO