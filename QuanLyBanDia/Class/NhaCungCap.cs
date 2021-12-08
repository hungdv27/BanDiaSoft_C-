using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class NhaCungCap
    {
        public NhaCungCap()
        {

        }
        public NhaCungCap(string maNCC, string tenNCC, string diaChi, string dienThoai)
        {
            MaNCC = maNCC;
            TenNCC = tenNCC;
            DiaChi = diaChi;
            DienThoai = dienThoai;
        }

        private string MaNCC { get; set; }
        private string TenNCC { get; set; }
        private string DiaChi { get; set; }
        private string DienThoai { get; set; }
    }

}
