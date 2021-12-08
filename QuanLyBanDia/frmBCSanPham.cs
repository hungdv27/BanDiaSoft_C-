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
    public partial class frmBCSanPham : Form
    {
        public frmBCSanPham()
        {
            InitializeComponent();
        }

        private void frmBCSanPham_Load(object sender, EventArgs e)
        {

            this.rpvBCSanPham.RefreshReport();
            cbQuy.SelectedIndex = 0;
            cbNam_SanPham.SelectedIndex = 4;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Properties.Settings.Default.QUANLIBANDIAConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "usp_KhoDia_TimKiemSanPhamKhongBanDuocTheoQui";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.Add(new SqlParameter("@qui", cbQuy.SelectedItem.ToString()));

            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            dap.Fill(ds);


            rpvBCSanPham.ProcessingMode = ProcessingMode.Local;
            rpvBCSanPham.LocalReport.ReportPath = "rptSanPham.rdlc";
            if (ds.Tables[0].Rows.Count > 0)
            {
                ReportDataSource rds = new ReportDataSource();
                rds.Name = "tblKhoDia";
                rds.Value = ds.Tables[0];

                rpvBCSanPham.LocalReport.DataSources.Clear();
                rpvBCSanPham.LocalReport.DataSources.Add(rds);
                rpvBCSanPham.RefreshReport();
            }
        }
    }
}
