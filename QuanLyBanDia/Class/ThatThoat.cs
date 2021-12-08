using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class TheLoai
    {
        public TheLoai()
        {

        }
        public TheLoai(string maTheLoai, string tenTheLoai)
        {
            MaTheLoai = maTheLoai;
            TenTheLoai = tenTheLoai;
        }

        private string MaTheLoai { get; set; }
        private string TenTheLoai { get; set; }
    }
}
