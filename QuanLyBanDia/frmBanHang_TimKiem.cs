using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.SqlClient;
using QuanLyBanDia.Class;

namespace QuanLyBanDia
{
    public partial class frmBanHang_TimKiem : Form
    {
        DataTable tblHoaDonBan;
        string sql = "";
        public frmBanHang_TimKiem()
        {
            InitializeComponent();
        }

        private void frmBanHang_TimKiem_Load(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private bool check()
        {
            if (textBox1.TextLength == 0)
            {
                MessageBox.Show("Nhập thông tin cần tìm kiếm");
                return false;
            }
            if (rdbMaHang.Checked == true)
            {
                sql = "Select * from ufn_HoaDonBan_TimKiemTheoMaHang('" + textBox1.Text.Trim() + "');";
                return true;
            }
            else if (rdbKhachHang.Checked == true)
            {
                sql = "Select * from ufn_HoaDonBan_TimKiemTheoMaKhachHang('" + textBox1.Text.Trim() + "')";
                return true;

            }
            else if (rdbNhanVien.Checked == true)
            {
                sql = "Select * from ufn_HoaDonBan_TimKiemTheoMaNhanVien('" + textBox1.Text.Trim() + "');";
                return true;
            }


            return false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (check())
            {
                tblHoaDonBan = Functions.GetDataTotable(sql);
                dataGridView1.DataSource = tblHoaDonBan;
                dataGridView1.Columns[0].HeaderText = "Mã HĐB";
                dataGridView1.Columns[1].HeaderText = "Mã NV";
                dataGridView1.Columns[2].HeaderText = "Ngày Bán";
                dataGridView1.Columns[3].HeaderText = "Mã Khách Hàng";
                dataGridView1.Columns[4].HeaderText = "Thành Tiền";
                dataGridView1.AllowUserToAddRows = false; //Không cho người dùng thêm dữ liệu trực tiếp
                dataGridView1.EditMode = DataGridViewEditMode.EditProgrammatically; //Không cho sửa dữ liệu trực tiếp
                this.dataGridView1.DefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
                this.dataGridView1.AutoResizeRows();
                this.dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
            }
            else MessageBox.Show("Kiếm tra thông tin tìm kiếm");
        }
    }
}
