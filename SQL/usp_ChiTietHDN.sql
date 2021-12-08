--usp_ChiTietHDN_Insert
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ChiTietHDN_Insert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ChiTietHDN_Insert
GO
CREATE PROCEDURE dbo.usp_ChiTietHDN_Insert
   @mahdn NCHAR(10), 
   @madia NCHAR(10),
   @soluong NCHAR(10),
   @dongia money,
   @giamgia float,
   @thanhtien money
AS
BEGIN
   IF NOT EXISTS(Select * From dbo.ChiTietHoaDonNhap Where MaHDN = @mahdn and MaDia = @madia)
        BEGIN
            IF NOT EXISTS (Select * From dbo.HoaDonNhap Where MaHDN=@mahdn)
                BEGIN
                    Select 1 AS flag;
                    RETURN;  
                END
            IF NOT EXISTS (Select * From dbo.KhoDia Where MaDia=@madia)
                BEGIN
                    Select 2 as flag;
                    RETURN;
                END
            INSERT INTO [dbo].[ChiTietHoaDonNhap]
            (MaHDN,MaDia,SoLuong,DonGia,GiamGia,ThanhTien)
            VALUES
            (@mahdn,@madia,@soluong,@dongia,@giamgia,@thanhtien);
            SELECT 3 AS Flag;
        END
    ELSE SELECT 0 AS Flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_ChiTietHDN_Insert 200020,118560,30,100000,null,null;
GO



--usp_ChiTietHDN_Update
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ChiTietHDN_Update'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ChiTietHDN_Update
GO

CREATE PROCEDURE dbo.usp_ChiTietHDN_Update
    @mahdn NCHAR(10),
    @madia NCHAR(10),
    @soluong int,
    @dongia money,
    @GiamGia float,
    @thanhtien money
AS
BEGIN
    IF EXISTS(Select * From dbo.ChiTietHoaDonNhap Where MaHDN = @mahdn and MaDia = @madia)
        BEGIN
            UPDATE [dbo].[ChiTietHoaDonNhap]
            SET
                [DonGia] = @dongia,
                [SoLuong] = @soluong,
                [GiamGia] = @GiamGia,
                [ThanhTien] = @thanhtien
            WHERE MaDia=@madia and mahdn = @mahdn;
            Select 1 as flag;
        END;   
    ELSE 
        SELECT 0 as flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_ChiTietHDN_Update 200001,118560,3,10,0.1,null;
GO

--usp_ChiTietHDN_Delete
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ChiTietHDN_Delete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ChiTietHDN_Delete

GO
CREATE PROCEDURE dbo.usp_ChiTietHDN_Delete
    @mahdn NCHAR(10),
    @madia NCHAR(10)
AS
BEGIN
    -- Delete rows from table '[ChiTietHoaDonNhap]' in schema '[dbo]'
    IF EXISTS(Select * From dbo.ChiTietHoaDonNhap Where MaHDN = @mahdn and MaDia = @madia)
        BEGIN
            DELETE FROM [dbo].[ChiTietHoaDonNhap]
            WHERE MaDia=@madia AND MaHDN=@mahdn;
            select 1 as flag;
        END
    ELSE SELECT 0 as flag;
END

GO
EXECUTE dbo.usp_ChiTietHDN_Delete 200001,118560;