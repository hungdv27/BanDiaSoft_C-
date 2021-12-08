--usp_NhaCungCung_Insert
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_NhaCungCap_Insert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_NhaCungCap_Insert
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_NhaCungCap_Insert
    @mancc NCHAR(10),
    @tenncc NVARCHAR(50),
    @dienthoai NCHAR(10),
    @diachi NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM NhaCungCap WHERE MaNCC =@mancc)
        BEGIN
            INSERT INTO dbo.NhaCungCap
            (MaNCC,TenNCC,DienThoai,DiaChi)
            VALUES 
            (@mancc,@tenncc,@dienthoai,@diachi);
            SELECT 1 AS Flag;
        END
    ELSE SELECT 0 AS Flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_NhaCungCap_Insert  1,Hoang,0848622889,HungYen;







--usp_NhaCungCap_Update
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_NhaCungCap_Update'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_NhaCungCap_Update
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_NhaCungCap_Update
    @mancc NCHAR(10),
    @tenncc NVARCHAR(50),
    @dienthoai NCHAR(10),
    @diachi NVARCHAR(50)
AS
BEGIN
    -- Update rows in table '[NhaCungCap]' in schema '[dbo]'
     IF EXISTS (SELECT * FROM NhaCungCap WHERE MaNCC = @mancc)
        BEGIN
            UPDATE NhaCungCap SET TenNCC=@tenncc,DienThoai=@dienthoai,DiaChi=@diachi
            WHERE MaNCC=@mancc;
            SELECT 1 as flag;
        END
    ELSE SELECT 0 as flag;
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_NhaCungCap_Update 1,Hoang,113,HY;







--usp_NhaCungCap_Delete
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_NhaCungCap_Delete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_NhaCungCap_Delete
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_NhaCungCap_Delete
   @mancc NCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT * from dbo.NhaCungCap WHERE MaNCC=@mancc)
        BEGIN
            DELETE FROM [dbo].[HoaDonNhap]
            WHERE MaNCC = @mancc;
            DELETE FROM [dbo].[NhaCungCap]
            WHERE MaNCC = @mancc;
            select 1 as flag;
        END
    ELSE SELECT 0 as flag;
END
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_NhaCungCap_Delete 1;
GO