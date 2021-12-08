--usp_KhachHang_Insert
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_KhachHang_Insert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_KhachHang_Insert
GO

CREATE PROCEDURE dbo.usp_KhachHang_Insert
    @makh NCHAR(10),
    @tenkh NVARCHAR(50),
    @dienthoai NCHAR(10),
    @diachi NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM KhachHang WHERE MaKH=@makh)
        BEGIN
            INSERT INTO KhachHang
            VALUES
            (@makh,@tenkh,@dienthoai,@DiaChi);
            SELECT 1 AS Flag;
        END
    ELSE SELECT 0 AS flag;

END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_KhachHang_Insert 1,Hoang, 123, HY;







--usp_KhachHang_Update
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_KhachHang_Update'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_KhachHang_Update
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_KhachHang_Update
    @makh NCHAR(10),
    @tenkh NVARCHAR(50),
    @dienthoai NCHAR(10),
    @diachi NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT * FROM KhachHang WHERE MaKH = @makh)
        BEGIN
            UPDATE KhachHang SET TenKH=@tenkh,DienThoai=@dienthoai,DiaChi=@diachi
            WHERE MaKH=@makh;
            SELECT 1 as flag;
        END
    ELSE SELECT 0 as flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_KhachHang_Update 1,H1,114,Test;








--usp_KhachHang_delete
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_KhachHang_Delete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_KhachHang_Delete
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_KhachHang_Delete
    @makh NCHAR(10)
AS
BEGIN
    IF EXISTS (select * from dbo.KhachHang WHERE MaKH=@makh)
        BEGIN
            
            DELETE FROM dbo.HoaDonBan WHERE MaKH=@makh;
            DELETE FROM dbo.KhachHang WHERE MaKH=@makh;
            SELECT 1 as flag;
        END
    ELSE SELECT 0 as flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_KhachHang_Delete 1 ;
GO

