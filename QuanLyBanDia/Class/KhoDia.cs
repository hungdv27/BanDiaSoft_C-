using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class KhoDia
    {
        public KhoDia()
        {

        }
        public KhoDia(string maDia, string tenDia, int soLuong, int donGiaBan, int donGiaNhap, string maNSX, string maTheLoai, string anh, string ghiChu)
        {
            MaDia = maDia;
            TenDia = tenDia;
            SoLuong = soLuong;
            DonGiaBan = donGiaBan;
            DonGiaNhap = donGiaNhap;
            MaNSX = maNSX;
            MaTheLoai = maTheLoai;
            Anh = anh;
            GhiChu = ghiChu;
        }

        private string MaDia { get; set; }
        private string TenDia { get; set; }
        private int SoLuong { get; set; }
        private int DonGiaBan { get; set; }
        private int DonGiaNhap { get; set; }
        private string MaNSX { get; set; }
        private string MaTheLoai { get; set; }
        private string Anh { get; set; }
        private string GhiChu { get; set; }


    }
}
