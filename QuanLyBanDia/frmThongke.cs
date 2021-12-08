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
    public partial class frmThongke : Form
    {
        public frmThongke()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            rdbKhachHang.Checked = true;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (rdbSanPham.Checked == true)
            {
                Form frm = new frmBCSanPham();
                frm.Show();
            }
            else if (rdbNhapHang.Checked == true)
            {
                Form frm = new frmBCNhapHang();
                frm.Show();
            }
            else if (rdbKhachHang.Checked == true)
            {
                Form frm = new frmBCKhachHang();
                frm.Show();
            }
            else
            {
                Form frm = new frmBCNCC();
                frm.Show();
            }
        }

        private void frmThongke_FormClosing(object sender, FormClosingEventArgs e)
        {
            new frmMenu().Show();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {

            frmMenu form = new frmMenu();
            form.Show();
            this.Hide();
        }
    }
}
