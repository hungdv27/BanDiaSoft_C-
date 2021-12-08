using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class NhanVien
    {
        public NhanVien()
        {

        }
        public NhanVien(string maNV, string tenNV, string gioiTinh, DateTime ngaySinh, string dienThoai, string diachi)
        {
            MaNV = maNV;
            TenNV = tenNV;
            GioiTinh = gioiTinh;
            NgaySinh = ngaySinh;
            DienThoai = dienThoai;
            Diachi = diachi;
        }

        private string MaNV { get; set; }
        private string TenNV { get; set; }
        private string GioiTinh { get; set; }
        private DateTime NgaySinh { get; set; }
        private string DienThoai { get; set; }
        private string Diachi { get; set; }
    }
}
