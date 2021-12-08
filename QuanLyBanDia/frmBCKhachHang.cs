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
using Microsoft.Reporting.WinForms;

namespace QuanLyBanDia
{
    public partial class frmBCKhachHang : Form
    {
        public frmBCKhachHang()
        {
            InitializeComponent();
        }



        private void button1_Click(object sender, EventArgs e)
        {
            if (tbMaKhach.TextLength == 0)
            {
                MessageBox.Show("Nhập tên mã khách hàng");
                return;
            }
            string sql = "SELECT * FROM ufn_HoaDonBan_TimKiemHoaDonBanTheoKhachHang(" + tbMaKhach.Text.Trim() + ")";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Properties.Settings.Default.QUANLIBANDIAConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = con;

            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            dap.Fill(ds);


            rpvBCNhapHang.ProcessingMode = ProcessingMode.Local;
            rpvBCNhapHang.LocalReport.ReportPath = "rptKhachHang.rdlc";
            if (ds.Tables[0].Rows.Count > 0)
            {
                ReportDataSource rds = new ReportDataSource();
                rds.Name = "DataSet2";
                rds.Value = ds.Tables[0];

                rpvBCNhapHang.LocalReport.DataSources.Clear();
                rpvBCNhapHang.LocalReport.DataSources.Add(rds);
                rpvBCNhapHang.RefreshReport();

                cmd.Cancel();
                con.Close();
                con.Dispose();
            }
            else
                MessageBox.Show("Không tồn tại dữ liệu khách hàng :" + tbMaKhach.Text);
        }
    }
}
