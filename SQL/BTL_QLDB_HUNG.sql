USE [master]
GO
/****** Object:  Database [QUANLIBANDIA]    Script Date: 08/11/2021 16:06:52 ******/
CREATE DATABASE [QUANLIBANDIA]
GO
USE [QUANLIBANDIA]
GO
CREATE TABLE [dbo].[ChiTietHoaDonBan](
	[MaHDB] [nchar](10) NOT NULL,
	[MaDia] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[GiamGia] [float] NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [pk_ChitietHDB] PRIMARY KEY CLUSTERED 
(
	[MaDia] ASC,
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaHDN] [nchar](10) NOT NULL,
	[MaDia] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[GiamGia] [float] NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [pk_ChitietHDN] PRIMARY KEY CLUSTERED 
(
	[MaDia] ASC,
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[MaCV] [nchar](10) NOT NULL,
	[TenCV] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHDB] [nchar](10) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[NgayBan] [date] NULL,
	[MaKH] [nchar](10) NULL,
	[ThanhTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHDN] [nchar](10) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[NgayNhap] [date] NULL,
	[MaNCC] [nchar](10) NULL,
	[ThanhTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DienThoai] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoDia]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoDia](
	[MaDia] [nchar](10) NOT NULL,
	[TenDia] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGiaBan] [money] NULL,
	[DonGiaNhap] [money] NULL,
	[MaNSX] [nchar](10) NULL,
	[MaTL] [nchar](10) NULL,
	[Anh] [nchar](255) NULL,
	[GhiChu] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mat_Hong]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mat_Hong](
	[MaMat] [nchar](10) NOT NULL,
	[MaDia] [nchar](10) NULL,
	[SoLuongMat] [int] NULL,
	[NgayMat] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DienThoai] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
	[DienThoai] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MaCV] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NoiSanXuat]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiSanXuat](
	[MaNSX] [nchar](10) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTL] [nchar](10) NOT NULL,
	[TenTL] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_ChitietHDB_KhoDia] FOREIGN KEY([MaDia])
REFERENCES [dbo].[KhoDia] ([MaDia])
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan] CHECK CONSTRAINT [fk_ChitietHDB_KhoDia]
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_ChitietHDN_HDB] FOREIGN KEY([MaHDB])
REFERENCES [dbo].[HoaDonBan] ([MaHDB])
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan] CHECK CONSTRAINT [fk_ChitietHDN_HDB]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [fk_ChitietHDN_HDN] FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HoaDonNhap] ([MaHDN])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [fk_ChitietHDN_HDN]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [fk_ChitietHDN_KhoDia] FOREIGN KEY([MaDia])
REFERENCES [dbo].[KhoDia] ([MaDia])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [fk_ChitietHDN_KhoDia]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_HoaDonBan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [fk_HoaDonBan_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_HoaDonBan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [fk_HoaDonBan_NhanVien]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [fk_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [fk_HoaDonNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [fk_HoaDonNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [fk_HoaDonNhap_NhanVien]
GO
ALTER TABLE [dbo].[KhoDia]  WITH CHECK ADD  CONSTRAINT [fk_KhoDia_NoiSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NoiSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[KhoDia] CHECK CONSTRAINT [fk_KhoDia_NoiSanXuat]
GO
ALTER TABLE [dbo].[KhoDia]  WITH CHECK ADD  CONSTRAINT [fk_KhoDia_TheLoai] FOREIGN KEY([MaTL])
REFERENCES [dbo].[TheLoai] ([MaTL])
GO
ALTER TABLE [dbo].[KhoDia] CHECK CONSTRAINT [fk_KhoDia_TheLoai]
GO
ALTER TABLE [dbo].[Mat_Hong]  WITH CHECK ADD  CONSTRAINT [fk_MatHong_KhoDia] FOREIGN KEY([MaDia])
REFERENCES [dbo].[KhoDia] ([MaDia])
GO
ALTER TABLE [dbo].[Mat_Hong] CHECK CONSTRAINT [fk_MatHong_KhoDia]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [fk_NhanVien_CongViec] FOREIGN KEY([MaCV])
REFERENCES [dbo].[CongViec] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [fk_NhanVien_CongViec]
GO
/****** Object:  StoredProcedure [dbo].[ups_KhoDia_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[ups_KhoDia_Insert]
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
/****** Object:  StoredProcedure [dbo].[usp_ChiTietHDB_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ChiTietHDB_Delete]
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
/****** Object:  StoredProcedure [dbo].[usp_ChiTietHDB_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ChiTietHDB_Insert]
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
/****** Object:  StoredProcedure [dbo].[usp_ChiTietHDB_Update]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ChiTietHDB_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_ChiTietHDN_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ChiTietHDN_Delete]
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
/****** Object:  StoredProcedure [dbo].[usp_ChiTietHDN_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ChiTietHDN_Insert]
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
/****** Object:  StoredProcedure [dbo].[usp_ChiTietHDN_Update]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ChiTietHDN_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_HoaDonBan_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_HoaDonBan_Delete]
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
/****** Object:  StoredProcedure [dbo].[usp_HoaDonBan_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_HoaDonBan_Insert]
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
/****** Object:  StoredProcedure [dbo].[usp_HoaDonBanUpdate]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_HoaDonBanUpdate]
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
/****** Object:  StoredProcedure [dbo].[usp_HoaDonNhap_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_HoaDonNhap_Delete]
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
/****** Object:  StoredProcedure [dbo].[usp_HoaDonNhap_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_HoaDonNhap_Insert]
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
/****** Object:  StoredProcedure [dbo].[usp_HoaDonNhap_Update]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_HoaDonNhap_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_KhachHang_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_KhachHang_Delete]
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
/****** Object:  StoredProcedure [dbo].[usp_KhachHang_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_KhachHang_Insert]
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
/****** Object:  StoredProcedure [dbo].[usp_KhachHang_Update]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_KhachHang_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_KhoDia_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_KhoDia_Delete]
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


GO
/****** Object:  StoredProcedure [dbo].[usp_KhoDia_Update]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_KhoDia_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_NhaCungCap_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_NhaCungCap_Delete]
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
/****** Object:  StoredProcedure [dbo].[usp_NhaCungCap_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_NhaCungCap_Insert]
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
/****** Object:  StoredProcedure [dbo].[usp_NhaCungCap_Update]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[usp_NhaCungCap_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_NhanVien_Delete]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_NhanVien_Delete]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_NhanVien_Insert]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_NhanVien_Insert] 
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
/****** Object:  StoredProcedure [dbo].[usp_NhanVien_Update]    Script Date: 08/11/2021 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_NhanVien_Update]
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
USE [master]
GO
ALTER DATABASE [QUANLIBANDIA] SET  READ_WRITE 
GO



insert into CongViec(MaCV, TenCV) values ('1', 'GiamDoc');
insert into CongViec(MaCV, TenCV) values ('2', 'Quanli');
insert into CongViec(MaCV, TenCV) values ('3', 'BanHang');
insert into CongViec(MaCV, TenCV) values ('4', 'DonVeSinh');



insert into NoiSanXuat(MaNSX, TenNSX) values ('123456', 'Shotacon');
insert into NoiSanXuat(MaNSX, TenNSX) values ('235461', 'Lolicon');
insert into NoiSanXuat(MaNSX, TenNSX) values ('345621', 'Brocon');
insert into NoiSanXuat(MaNSX, TenNSX) values ('345216', 'Siscon');

insert into TheLoai(MaTL, TenTL) values ('234567', 'Shoujo');
insert into TheLoai(MaTL, TenTL) values ('435672', 'Kodomo');
insert into TheLoai(MaTL, TenTL) values ('234576', 'Seinen');
insert into TheLoai(MaTL, TenTL) values ('245673', 'Redikomi');
insert into TheLoai(MaTL, TenTL) values ('245674', 'Seijin'); /* Sửa MaTL từ 245673 do trùng bên trên */
insert into TheLoai(MaTL, TenTL) values ('254376', 'Yaoi');
insert into TheLoai(MaTL, TenTL) values ('224567', 'Shonen-ai');
insert into TheLoai(MaTL, TenTL) values ('334562', 'Shonen');
insert into TheLoai(MaTL, TenTL) values ('442356', 'Yuri');
insert into TheLoai(MaTL, TenTL) values ('553246', 'Shoujo-ai');
insert into TheLoai(MaTL, TenTL) values ('667345', 'Doujinshi');
insert into TheLoai(MaTL, TenTL) values ('772345', 'Horror');


insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('617746', 'Blogtag', '6769482622', '519 Annamark Trail');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('279181', 'Minyx', '2528870938', '43196 Havey Pass');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('290211', 'Babbleblab', '4103987124', '2 Golf View Lane');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('375602', 'Myworks', '8088937433', '96 Browning Crossing');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('381571', 'Tagpad', '9008586054', '15 Columbus Park');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('245101', 'Voonte', '3714936856', '095 Novick Trail');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('756398', 'Skynoodle', '3828270162', '37870 Bartillon Plaza');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('322775', 'Snaptags', '5015945311', '1744 Muir Avenue');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('657177', 'Jetwire', '8373676517', '3 Meadow Valley Pass');
insert into NhaCungCap (MaNCC, TenNCC, DienThoai, DiaChi) values ('975620', 'Realpoint', '2613696003', '72 Mallard Point');


insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('697799', 'Benjamin Tubble', 'Female', '1992/04/26', '5587549807', '77113 Butterfield Court', '1');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('607444', 'Rancell Polley', 'Male', '1999/10/05', '9477911589', '4 Springview Parkway', '2');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('322655', 'Annaliese Curson', 'Male', '1998/08/08', '7379794947', '4438 Hazelcrest Avenue', '2');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('676421', 'Leo Yggo', 'Non-binary', '1990/11/15', '8175027478', '4 Butterfield Way', '4');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('750731', 'Mitzi Menis', 'Female', '1992/02/23', '1352566997', '4 Prentice Place', '4');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('020102', 'Tallou Dando', 'Non-binary', '1990/01/17', '3209227811', '86986 Green Ridge Crossing', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('621456', 'Levey Reding', 'Male', '1997/05/31', '8487074474', '47 Garrison Crossing', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('579502', 'Lynelle Tomaszczyk', 'Female', '1995/03/24', '7638074571', '78 Manley Pass', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('047222', 'Shayna Anstee', 'Female', '1990/02/20', '2101786692', '4940 Aberg Park', '3');
insert into NhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV) values ('710507', 'Enrique Salvage', 'Male', '1993/12/11', '7777859203', '7 Vidon Road', '3');


insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('919760', 'Hanni McShee', '6715542144', '0 Vernon Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('888853', 'Perri Mival', '7812052228', '02790 Meadow Ridge Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('176240', 'Salvador Bullar', '1524142550', '8 Charing Cross Road');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('824210', 'Carlene Najera', '8623566491', '1 Cordelia Parkway');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('924356', 'Stanley Treeby', '2184071049', '19107 Kim Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('373461', 'Cornelia Duffil', '2668141859', '5345 Pleasure Alley');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('331305', 'Ermina Kiff', '2547902893', '325 Utah Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('265572', 'Charlotte Skinner', '5659851492', '99784 Havey Alley');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('265656', 'Clarisse Harmour', '5375629240', '90352 School Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('305962', 'Kelley Flintoff', '4622935397', '14281 Dottie Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('139227', 'Karen Wooton', '5439436098', '677 Nobel Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('426355', 'Hazel Bickers', '7931153809', '3 Burrows Trail');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('514509', 'Sileas Rubi', '7703980221', '07 Hallows Street');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('565452', 'Min Give', '5654302099', '66 Delaware Center');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('116136', 'Celestia Casley', '3415190028', '30 Fuller Street');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('273410', 'Richart Tawse', '2751088395', '45819 5th Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('244580', 'Shaina Puxley', '1668986863', '3298 Leroy Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('124911', 'Rad MacCumiskey', '5598414599', '749 Dixon Drive');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('630603', 'Mamie Poole', '9123280994', '5039 Sommers Avenue');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('695006', 'Jemie Trewin', '6156735651', '7852 Talmadge Alley');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('963846', 'Kerry Zaple', '8687076391', '7 Alpine Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('613721', 'Pooh Pilger', '1552369767', '2 Spohn Crossing');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('844256', 'Riobard Lawling', '3392561858', '4259 Elka Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('736044', 'Avis Reidie', '9554081173', '5 Hudson Crossing');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('109219', 'Latisha Dundon', '5978893514', '1749 Sommers Court');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('738019', 'Junie Cornejo', '7039245261', '8 Oak Valley Park');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('348110', 'Garreth Pamphilon', '2542466270', '57 Swallow Plaza');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('833505', 'Audrey Ketcher', '3143835904', '176 Mendota Circle');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('541710', 'Amery Kulas', '3136033407', '2148 Helena Park');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('898798', 'Maude Grunder', '1825367093', '4 Eliot Trail');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('066087', 'Yolande Cramond', '3136056773', '8 Schiller Place');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('860894', 'Earlie Capper', '1532414066', '0 Victoria Avenue');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('668285', 'Piggy Iacovini', '7935499233', '624 Schmedeman Parkway');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('031617', 'Audre Broxton', '4342434000', '2 Hansons Junction');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('410256', 'Anjanette Gremane', '3291295128', '087 Judy Crossing');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('936833', 'Irwinn Norman', '7354477791', '8016 Coleman Terrace');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('994443', 'Guglielma Mirams', '2196049105', '238 Waxwing Way');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('093879', 'Noby Antrum', '3548718821', '44 Oak Valley Plaza');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('285101', 'Jerrome Tatteshall', '8801028119', '619 Hagan Road');
insert into KhachHang (MaKH, TenKH, DienThoai, DiaChi) values ('613369', 'Jaquelin Petschelt', '3757367902', '64 Hazelcrest Center');

insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('118560', 'Edgepulse', 10, 10000, 5000, '123456', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('822499', 'Shufflebeat', 20, 20000, 10000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('558190', 'Twinder', 30, 30000, 10000, '235461', '234576');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('743246', 'Trupe', 40, 15000, 5000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('230089', 'Digitube', 50, 20000, 10000, '235461', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('315647', 'Centimia', 60, 30000, 15000, '123456', '234576');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('796207', 'Jabbercube', 70, 20000, 10000, '345621', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('267257', 'Jamia', 80, 20000, 10000, '235461', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('045156', 'Roomm', 90, 10000, 2000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('265891', 'Rhynoodle', 10, 20000, 10000, '345621', '234576');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('550261', 'Dazzlesphere', 11, 30000, 15000, '345621', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('160326', 'Devcast', 12, 20000, 10000, '345621', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('538006', 'Dynava', 13, 15000, 5000, '123456', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('364951', 'Avamm', 14, 30000, 15000, '345216', '234567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('056106', 'Rhybox', 15, 20000, 10000, '235461', '224567');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('689349', 'Yoveo', 16, 15000, 5000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('655790', 'Twitterlist', 17, 15000, 5000, '123456', '245673');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('364748', 'Rhynyx', 18, 20000, 10000, '235461', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('598034', 'Chatterpoint', 19, 15000, 5000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('128006', 'Twitterwire', 20, 30000, 15000, '345216', '435672');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('591254', 'Viva', 21, 10000, 5000, '235461', '245673');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('849299', 'Aibox', 22, 20000, 10000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('420625', 'Abatz', 23, 10000, 5000, '345216', '772345');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('670920', 'Eabox', 24, 10000, 5000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('914345', 'Realcube', 25, 15000, 5000, '345216', '254376');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('902269', 'Yabox', 26, 10000, 5000, '345216', '254376');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('137778', 'Browseblab', 27, 20000, 10000, '345216', '442356');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('429443', 'Jetpulse', 28, 10000, 5000, '235461', '254376');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('234585', 'Shufflebeat', 29, 15000, 5000, '345621', '245673');
insert into KhoDia (MaDia, TenDia, SoLuong, DonGiaBan, DonGiaNhap, MaNSX, MaTL) values ('056113', 'Jaxbean', 30, 10000, 5000, '345621', '245673');

insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770001, '118560', 10, '2021/09/27');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770002, '056113', 5, '2021/05/02');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770003, '234585', 6, '2021/08/16');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770004, '137778', 12, '2021/03/06');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770005, '670920', 24, '2021/05/04');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770006, '420625', 3, '2020/10/20');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770007, '598034', 5, '2021/07/01');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770008, '128006', 6, '2021/08/19');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770009, '538006', 2, '2021/10/14');
insert into Mat_Hong (MaMat, MaDia, SoLuongMat, NgayMat) values (770010, '265891', 8, '2021/04/20');
 
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800001', '020102', '2021/10/02', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800002', '621456', '2021/07/29', '888853', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800003', '579502', '2021/05/03', '305962', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800004', '020102', '2021/08/26', '613721', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800005', '047222', '2021/08/06', '176240', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800006', '579502', '2020/11/26', '613721', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800007', '047222', '2021/07/09', '844256', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800008', '047222', '2021/02/26', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800009', '047222', '2021/07/24', '541710', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800010', '020102', '2021/06/20', '305962', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800011', '621456', '2021/06/04', '888853', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800012', '047222', '2021/01/15', '844256', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800013', '579502', '2021/01/30', '109219', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800014', '047222', '2021/07/06', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800015', '020102', '2021/04/12', '176240', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800016', '047222', '2021/09/13', '109219', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800017', '710507', '2021/05/10', '305962', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800018', '621456', '2021/06/08', '541710', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800019', '047222', '2021/08/16', '919760', null);
insert into HoaDonBan (MaHDB, MaNV, NgayBan, MaKH, ThanhTien) values ('800020', '047222', '2021/09/09', '844256', null);

insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200001', '607444', '2017/07/05', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200002', '607444', '2016/09/03', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200003', '607444', '2017/06/02', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200004', '607444', '2016/01/29', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200005', '607444', '2018/11/25', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200006', '607444', '2018/12/11', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200007', '607444', '2017/12/24', '975620', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200008', '607444', '2017/12/15', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200009', '607444', '2019/03/09', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200010', '607444', '2018/11/22', '975620', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200011', '607444', '2018/10/01', '975620', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200012', '607444', '2015/06/05', '617746', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200013', '607444', '2016/09/09', '279181', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200014', '322655', '2019/05/02', '756398', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200015', '322655', '2018/09/25', '756398', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200016', '322655', '2018/09/15', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200017', '322655', '2017/01/31', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200018', '322655', '2019/11/10', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200019', '322655', '2018/12/21', '381571', null);
insert into HoaDonNhap (MaHDN, MaNV, NgayNhap, MaNCC, ThanhTien) values ('200020', '322655', '2019/05/18', '756398', null);

insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '558190', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800002', '822499', 7, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800003', '118560', 8, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800004', '558190', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800005', '558190', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800006', '822499', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800007', '743246', 7, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800008', '743246', 8, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800009', '118560', 2, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800010', '743246', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800011', '230089', 8, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800012', '230089', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800013', '230089', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800014', '230089', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800015', '822499', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800016', '315647', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800017', '267257', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800018', '267257', 2, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800019', '267257', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800020', '045156', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800011', '558190', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800012', '822499', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800013', '118560', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800014', '558190', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800015', '558190', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800016', '822499', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800017', '743246', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800018', '743246', 3, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800019', '118560', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '743246', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '230089', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800002', '230089', 4, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800003', '230089', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800004', '230089', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800005', '822499', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800006', '315647', 1, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800007', '267257', 2, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800008', '267257', 5, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800009', '267257', 6, null, null);
insert into ChiTietHoaDonBan (MaHDB, MaDia, SoLuong, GiamGia, ThanhTien) values ('800001', '045156', 2, null, null);

insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200001', '822499', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200001', '118560', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200002', '822499', 70, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200003', '558190', 80, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200004', '743246', 90, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200005', '230089', 40, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200006', '315647', 40, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200007', '796207', 40, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200008', '267257', 40, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200009', '045156', 50, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200010', '265891', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200011', '550261', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200012', '538006', 70, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200013', '364951', 90, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200014', '056106', 40, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200015', '689349', 40, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200016', '364748', 60, 10000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200017', '655790', 60, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200018', '598034', 50, 15000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200019', '128006', 70, 5000, null, null);
insert into ChiTietHoaDonNhap (MaHDN, MaDia, SoLuong, DonGia, GiamGia, ThanhTien) values ('200020', '591254', 60, 15000, null, null);


