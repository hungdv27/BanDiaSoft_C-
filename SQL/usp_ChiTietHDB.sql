-- Create a new stored procedure called 'usp_ChiTietHDB_Insert' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ChiTietHDB_Insert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ChiTietHDB_Insert
GO
CREATE PROCEDURE dbo.usp_ChiTietHDB_Insert
   @mahdb NCHAR(10), 
   @madia NCHAR(10),
   @soluong NCHAR(10),
   @giamgia float,
   @thanhtien money
AS
BEGIN
    IF NOT EXISTS(Select * From dbo.ChiTietHoaDonBan Where MaHDB = @mahdb and MaDia = @madia)
        BEGIN
            IF NOT EXISTS (Select * From dbo.HoaDonBan Where MaHDB=@mahdb)
                BEGIN
                    Select 1 AS flag;
                    RETURN;  
                END
            IF NOT EXISTS (Select * From dbo.KhoDia Where MaDia=@madia)
                BEGIN
                    Select 2 as flag;
                    RETURN;
                END
            INSERT INTO [dbo].[ChiTietHoaDonBan]
            (MaHDB,MaDia,SoLuong,GiamGia,ThanhTien)
            VALUES
            (@mahdb,@madia,@soluong,@giamgia,@thanhtien);
            SELECT 3 AS Flag;
        END
    ELSE SELECT 0 AS Flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_ChiTietHDB_Insert 800001,118560,1,null,null;
GO



-- Create a new stored procedure called 'usp_ChiTietHDB_Update' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ChiTietHDB_Update'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ChiTietHDB_Update
GO

CREATE PROCEDURE dbo.usp_ChiTietHDB_Update
    @mahdb NCHAR(10),
    @madia NCHAR(10),
    @soluong int,
    @GiamGia float,
    @thanhtien money
AS
BEGIN
    IF EXISTS(Select * From dbo.ChiTietHoaDonBan Where MaHDB = @mahdb and MaDia = @madia)
        BEGIN
            UPDATE [dbo].[ChiTietHoaDonBan]
            SET
                [SoLuong] = @soluong,
                [GiamGia] = @GiamGia,
                [ThanhTien] = @thanhtien
            WHERE MaDia=@madia and MaHDB = @mahdb;
            Select 1 as flag;
        END
    ELSE SELECT 0 as flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_ChiTietHDB_Update  800001,118560,3,10,null;
GO

-- Create a new stored procedure called 'usp_ChiTietHDB_Delete' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ChiTietHDB_Delete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ChiTietHDB_Delete

GO
CREATE PROCEDURE dbo.usp_ChiTietHDB_Delete
    @mahdb NCHAR(10),
    @madia NCHAR(10)
AS
BEGIN
    -- Delete rows from table '[ChiTietHoaDonBan]' in schema '[dbo]'
    IF EXISTS(Select * From dbo.ChiTietHoaDonBan Where MaHDB = @mahdb and MaDia = @madia)
        BEGIN
            DELETE FROM [dbo].[ChiTietHoaDonBan]
            WHERE MaDia=@madia AND MaHDB=@mahdb;
            Select 1 as flag;
        END
    ELSE
        SELECT 0 as flag;
END

GO
EXECUTE dbo.usp_ChiTietHDB_Delete 800001,118560;