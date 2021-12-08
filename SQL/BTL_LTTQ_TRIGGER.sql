GO
-- cần bổ sung thêm rollback khi số lượng bán vượt quá số lượng tồn
ALter TRIGGER trg_ChiTietHoaDonBan_CapNhapSoLuongKhoDia ON dbo.ChiTietHoaDonBan
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @soluongbancu INT, @soluongbanmoi INT,  @madia NCHAR(10)
    SELECT @madia=MaDia, @soluongbancu=SoLuong From deleted
    SELECT  @madia=MaDia, @soluongbanmoi=soluong FROM inserted
    UPDATE KhoDia 
        SET SoLuong = ISNULL(SoLuong,0) - ISNULL(@soluongbanmoi,0) + ISNULL(@soluongbancu,0)
        WHERE MaDia=@madia
END;


GO
ALTER TRIGGER trg_ChiTietHoaDonNhap_CapNhapSoLuongKhoDia ON dbo.ChiTietHoaDonNhap
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @soluongnhapcu INT, @soluongnhapmoi INT,@dongiamoi money,  @madia NCHAR(10)
    SELECT @madia=MaDia, @soluongnhapcu=SoLuong From deleted
    SELECT @madia=MaDia, @soluongnhapmoi=SoLuong ,@dongiamoi=(DonGia-DonGia*GiamGia) FROM inserted
    UPDATE KhoDia 
        SET SoLuong = (ISNULL(SoLuong,0) + ISNULL(@soluongnhapmoi,0) - ISNULL(@soluongnhapcu,0)),
            DonGiaNhap = @dongiamoi,
            DonGiaBan = (@dongiamoi+@dongiamoi*0.1)
        WHERE MaDia=@madia
END;
