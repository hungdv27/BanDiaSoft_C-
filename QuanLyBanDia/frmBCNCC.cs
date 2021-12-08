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
using QuanLyBanDia.Class;
using ClosedXML.Excel;



namespace QuanLyBanDia
{
    public partial class frmBCNCC : Form
    {
        DataTable tblNCC;
        string sql = "";

        public frmBCNCC()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            sql = " select * from ufn_5NCC(" + cbNam_NhapHang.SelectedItem.ToString() + ");";
            tblNCC = Functions.GetDataTotable(sql);
            dataGridView1.DataSource = tblNCC;
            dataGridView1.Columns[0].HeaderText = "Mã NCCB";
            dataGridView1.Columns[1].HeaderText = "Tên NCC";
            dataGridView1.Columns[2].HeaderText = "Số lượng cung cấp";
            dataGridView1.AllowUserToAddRows = false; //Không cho người dùng thêm dữ liệu trực tiếp
            dataGridView1.EditMode = DataGridViewEditMode.EditProgrammatically; //Không cho sửa dữ liệu trực tiếp
            this.dataGridView1.DefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
            this.dataGridView1.AutoResizeRows();
            this.dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
        }

        private void frmBCNCC_Load(object sender, EventArgs e)
        {
            cbNam_NhapHang.SelectedIndex = 2;
        }

        private void rpvBCNCC_Load(object sender, EventArgs e)
        {

        }

        private void btnExportExcel_Click(object sender, EventArgs e)
        {
            using (SaveFileDialog sfd = new SaveFileDialog() { Filter = "Excel WorkBook|*.xlsx" })
            {
                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    try
                    {
                        if (MessageBox.Show("Bạn có muốn xuất ra file excel không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
                        {
                            using (XLWorkbook xLWorkbook = new XLWorkbook())
                            {
                                xLWorkbook.Worksheets.Add(tblNCC, "Nhà cung cấp");
                                xLWorkbook.SaveAs(sfd.FileName);
                            }
                            MessageBox.Show("Xuất excel thành công", "Thông báo");
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
        }
    }
}
