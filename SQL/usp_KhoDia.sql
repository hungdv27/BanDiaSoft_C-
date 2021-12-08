IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_KhoDia_Update'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE usp_KhoDia_Update
GO

CREATE PROCEDURE usp_KhoDia_Update
    @madia NCHAR(10),
    @tendia NVARCHAR(50), 
    @soluong INT, 
    @dongiaban money, 
    @dongianhap money, 
    @mansx NCHAR(10), 
    @matl NCHAR(10), 
    @anh NCHAR(255), 
    @ghichu NVARCHAR(200) 
AS
BEGIN
    IF EXISTS (Select * FROM dbo.KhoDia WHERE MaDia=@madia)
        BEGIN
            IF NOT EXISTS (SELECT * FROM dbo.NoiSanXuat WHERE MaNSX=@mansx)
                BEGIN
                    SELECT 1 as flag;
                    RETURN;
                END
            IF NOT EXISTS (SELECT * FROM dbo.TheLoai WHERE MaTL=@matl)
                BEGIN
                    SELECT 2 as flag;
                    RETURN;
                END
            UPDATE [dbo].[KhoDia]
            SET
                [TenDia] = @tendia,
                [SoLuong] = @soluong,
                [DonGiaBan] = @dongiaban,
                [DonGiaNhap] = @dongianhap,
                [MaNSX] = @mansx,
                [MaTL] = @matl,
                [Anh] = @anh,
                [GhiChu] = @ghichu
            WHERE MaDia=@madia;
			select 3 as flag;
        END
    ELSE SELECT 0 as flag;
END
EXECUTE usp_KhoDia_Update '045156',Test,10,10000,5000,123456,224567,null,null;
-- 230089
EXECUTE usp_KhoDia_Update '230089',Test,10,10000,5000,123456,224567,null,null;
GO




--usp_KhoDia_Insert
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'ups_KhoDia_Insert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE ups_KhoDia_Insert
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE ups_KhoDia_Insert
    @madia NCHAR(10), 
    @tendia NVARCHAR(50), 
    @soluong INT, @dongiaban money, 
    @dongianhap money, 
    @mansx NCHAR(10), 
    @matl NCHAR(10), 
    @anh nchar(255), 
    @ghichu NVARCHAR(200) 
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.KhoDia WHERE MaDia = @madia)
        BEGIN 
            IF NOT EXISTS (SELECT * FROM dbo.NoiSanXuat WHERE MaNSX=@mansx)
                BEGIN
                    SELECT 1 as flag;
                    RETURN;
                END
            IF NOT EXISTS (SELECT * FROM dbo.TheLoai WHERE MaTL=@matl)
                BEGIN
                    SELECT 2 as flag;
                    RETURN;
                END
            INSERT INTO [dbo].[KhoDia] 
            (MaDia,TenDia,SoLuong,DonGiaBan,DonGiaNhap,MaNSX,MaTL,Anh,GhiChu)
            VALUES
            (@madia,@tendia,@soluong,@dongiaban,@dongianhap,@mansx,@matl,@anh,@ghichu);
            SELECT 3 as Flag;
        END
    ELSE SELECT 0 as Flag;
END
GO
EXECUTE ups_KhoDia_Insert 1,test,10,10000,5000,123456,224567,null,null;

--usp_KhoDia_Delete
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_KhoDia_Delete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_KhoDia_Delete
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE usp_KhoDia_Delete
    @madia NCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT * FROM dbo.KhoDia Where MaDia=@madia)
    BEGIN
        DELETE FROM dbo.ChiTietHoaDonBan
        WHERE MaDia = @madia;
        DELETE FROM dbo.ChiTietHoaDonNhap
        WHERE MaDia = @madia;
        DELETE FROM dbo.Mat_Hong
        WHERE MaDia = @madia;
        DELETE FROM dbo.KhoDia
        WHERE MaDia = @madia;
        select 1 as flag;
    END
    ELSE SELECT 0 as flag;
END

EXECUTE usp_KhoDia_Delete 1;

