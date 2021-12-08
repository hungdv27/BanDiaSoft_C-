using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class KhachHang
    {
        public KhachHang()
        {

        }
        public KhachHang(string maKhach, string tenKhach, string diaChi, string dienThoai)
        {
            MaKhach = maKhach;
            TenKhach = tenKhach;
            DiaChi = diaChi;
            DienThoai = dienThoai;
        }

        private string MaKhach { get; set; }
        private string TenKhach { get; set; }
        private string DiaChi { get; set; }
        private string DienThoai { get; set; }
    }
}
