using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class HoaDonBan
    {
        public HoaDonBan()
        {

        }
        public HoaDonBan(string soHDB, string maNhanVien, DateTime ngayBan, string maKhach, int tongTien)
        {
            SoHDB = soHDB;
            MaNhanVien = maNhanVien;
            NgayBan = ngayBan;
            MaKhach = maKhach;
            TongTien = tongTien;
        }

        private string SoHDB { get; set; }
        private string MaNhanVien { get; set; }
        private DateTime NgayBan { get; set; }
        private string MaKhach { get; set; }
        private int TongTien { get; set; }
    }
}
