using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanDia.Class
{
    class CongViec
    {
        public CongViec()
        {

        }
        public CongViec(string maCongViec, string tenCongViec)
        {
            MaCongViec = maCongViec;
            TenCongViec = tenCongViec;
        }

        private string MaCongViec { get; set; }
        private string TenCongViec { get; set; }
    }
}
