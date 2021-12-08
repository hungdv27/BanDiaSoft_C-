using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanDia
{
    public partial class frmMenu : Form
    {
        public frmMenu()
        {
            InitializeComponent();
        }

        private void lbClose_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc muốn thoát không?",
                 "Thông báo", MessageBoxButtons.YesNoCancel))
            {
                this.Close();
            }
        }

        private void btnBanHangt_Click(object sender, EventArgs e)
        {
            new frmBanHang().Show();
            this.Hide();
        }

        private void btnNhapHang_Click(object sender, EventArgs e)
        {
            new frmNhapHang().Show();
            this.Hide();
        }

        private void btnKhachHang_Click(object sender, EventArgs e)
        {
            new frmKhachHang().Show();
            this.Hide();
        }

        private void btnKhoDia_Click(object sender, EventArgs e)
        {
            new frmKhoDia().Show();
            this.Hide();
        }

        private void btnNhanVien_Click(object sender, EventArgs e)
        {
            new frmNhanVien().Show();
            this.Hide();
        }

        private void btnThongKe_Click(object sender, EventArgs e)
        {
            new frmThongke().Show();
            this.Hide();
        }

        private void frmMenu_Load(object sender, EventArgs e)
        {
            LoadDongHo();
        }

        private void timer_DongHo_Tick(object sender, EventArgs e)
        {
            lbTimer.Text = DateTime.Now.ToLongTimeString();
            lbDate.Text = DateTime.Now.ToShortDateString();
        }

        private void LoadDongHo()
        {
            timer_DongHo.Start();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc muốn thoát không?",
                 "Error", MessageBoxButtons.YesNoCancel))
            {
                this.Close();
                new frmLogin().Show();
            }
        }
    }
}
