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
    public partial class frmBCNhapHang : Form
    {
        public frmBCNhapHang()
        {
            InitializeComponent();
            cbThang.SelectedIndex = 0;
            cbNam_NhapHang.SelectedIndex = 4;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM ufn_HoaDonNhap_TimKiemHoaDonNhapTheoThang(" + cbThang.SelectedItem.ToString() + ")";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Properties.Settings.Default.QUANLIBANDIAConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = con;

            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            dap.Fill(ds);


            rpvBCNhapHang.ProcessingMode = ProcessingMode.Local;
            rpvBCNhapHang.LocalReport.ReportPath = "rptNhapHang.rdlc";
            if (ds.Tables[0].Rows.Count > 0)
            {
                ReportDataSource rds = new ReportDataSource();
                rds.Name = "DataSet1";
                rds.Value = ds.Tables[0];

                rpvBCNhapHang.LocalReport.DataSources.Clear();
                rpvBCNhapHang.LocalReport.DataSources.Add(rds);
                rpvBCNhapHang.RefreshReport();
            }
        }
    }
}
