using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class HoaDonNhap
    {
        public HoaDonNhap()
        {

        }
        public HoaDonNhap(string soHDN, string maNV, DateTime ngayNhap, string maNCC, int tongTien)
        {
            SoHDN = soHDN;
            MaNV = maNV;
            NgayNhap = ngayNhap;
            MaNCC = maNCC;
            TongTien = tongTien;
        }

        private string SoHDN { get; set; }
        private string MaNV { get; set; }
        private DateTime NgayNhap { get; set; }
        private string MaNCC { get; set; }
        private int TongTien { get; set; }
    }
}
