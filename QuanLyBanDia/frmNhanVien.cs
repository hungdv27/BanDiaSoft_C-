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
using app = Microsoft.Office.Interop.Excel.Application;
using ClosedXML.Excel;

namespace QuanLyBanDia
{

    public partial class frmNhanVien : Form
    {
        DataTable tblNhanVien;
        public frmNhanVien()
        {
            InitializeComponent();
        }
        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            string sql = "Select * From CongViec";
            Functions.FillCombo(sql, cboCongViec, "MaCV", "TenCV");
            txtMaNhanVien.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
        }
        public void LoadDataGridView()
        {
            string sql;
            sql = "SELECT * From NhanVien";
            tblNhanVien = Class.Functions.GetDataTotable(sql); //lấy dữ 
            dgvNhanVien.DataSource = tblNhanVien;
            dgvNhanVien.Columns[0].HeaderText = "Mã nhân viên";
            dgvNhanVien.Columns[1].HeaderText = "Tên nhân viên";
            dgvNhanVien.Columns[2].HeaderText = "Giới tính";
            dgvNhanVien.Columns[3].HeaderText = "Ngày sinh";
            dgvNhanVien.Columns[4].HeaderText = "Điện thoại";
            dgvNhanVien.Columns[5].HeaderText = "Địa chỉ";
            dgvNhanVien.Columns[6].HeaderText = "Mã Công Việc";
            dgvNhanVien.AllowUserToAddRows = false;
            dgvNhanVien.EditMode = DataGridViewEditMode.EditProgrammatically;
            this.dgvNhanVien.DefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
            this.dgvNhanVien.AutoResizeRows();
            this.dgvNhanVien.ColumnHeadersDefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            ResetValues();
            txtMaNhanVien.Enabled = true;
            txtMaNhanVien.Focus();
            Disable_Button_ThemSuaXoa();
            btnLuu.Enabled = true;
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectSQL.stringConn))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_NhanVien_Update";
                    cmd.Parameters.AddWithValue("@manv", txtMaNhanVien.Text);
                    cmd.Parameters.AddWithValue("@tennv", txtTenNhanVien.Text);
                    cmd.Parameters.AddWithValue("@gioitinh", txtGioiTinh.Text);
                    cmd.Parameters.AddWithValue("@ngaysinh", dtpNgaySinh.Value);
                    cmd.Parameters.AddWithValue("@dienthoai", txtDienThoai.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cmd.Parameters.AddWithValue("@macv", cboCongViec.SelectedValue.ToString());
                    cmd.Connection = connection;
                    if ((int)cmd.ExecuteScalar() == 0)
                        MessageBox.Show("Opp, Nhân viên bạn sửa không tồn tại.Hãy sử dụng nút lưu để thêm vào", "Thông báo");
                    else
                        MessageBox.Show("Bạn đã sửa thành công");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadDataGridView();
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (!CheckDataForBtnLuu())
                return;
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectSQL.stringConn))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_NhanVien_Insert";
                    cmd.Parameters.AddWithValue("@manv", txtMaNhanVien.Text);
                    cmd.Parameters.AddWithValue("@tennv", txtTenNhanVien.Text);
                    cmd.Parameters.AddWithValue("@gioitinh", txtGioiTinh.Text);
                    cmd.Parameters.AddWithValue("@ngaysinh", dtpNgaySinh.Value);
                    cmd.Parameters.AddWithValue("@dienthoai", txtDienThoai.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cmd.Parameters.AddWithValue("@macv", cboCongViec.SelectedValue.ToString());
                    cmd.Connection = connection;
                    if ((int)cmd.ExecuteScalar() == 0)
                    {
                        MessageBox.Show("Opp, Nhân viên này đã tồn tại. Hãy dùng nút sửa để thay đổi ", "Thông báo");
                    }
                    else
                    {
                        MessageBox.Show("Thêm nhân viên thành công", "Thông báo");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadDataGridView();
            ResetValues();
            txtMaNhanVien.Focus();
        }
        private void ResetValues()
        {
            txtMaNhanVien.Text = "";
            txtTenNhanVien.Text = "";
            txtGioiTinh.Text = "";
            dtpNgaySinh.Text = "";
            txtDienThoai.Text = "";
            txtDiaChi.Text = "";
            cboCongViec.SelectedIndex = -1;
        }
        private void Enable_Button_ThemSuaXoa()
        {
            btnSua.Enabled = true;
            btnLuu.Enabled = true;
            btnXoa.Enabled = true;
        }
        private void Disable_Button_ThemSuaXoa()
        {
            btnSua.Enabled = false;
            btnLuu.Enabled = false;
            btnXoa.Enabled = false;
        }
        private void dgvNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string MaCongViec;
            string sql;
            txtMaNhanVien.Text = dgvNhanVien.CurrentRow.Cells[0].Value.ToString();
            txtTenNhanVien.Text = dgvNhanVien.CurrentRow.Cells[1].Value.ToString();
            txtGioiTinh.Text = dgvNhanVien.CurrentRow.Cells[2].Value.ToString();
            dtpNgaySinh.Text = dgvNhanVien.CurrentRow.Cells[3].Value.ToString();
            txtDienThoai.Text = dgvNhanVien.CurrentRow.Cells[4].Value.ToString();
            txtDiaChi.Text = dgvNhanVien.CurrentRow.Cells[5].Value.ToString();
            MaCongViec = dgvNhanVien.CurrentRow.Cells[6].Value.ToString();
            sql = "SELECT TenCV FROM CongViec WHERE MaCV=N'" + MaCongViec + "'";
            cboCongViec.Text = Functions.GetFieldValues(sql);
            Enable_Button_ThemSuaXoa();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Ban có muốn xóa nhân viên", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question))
            {
                using (SqlConnection connection = new SqlConnection(ConnectSQL.stringConn))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_NhanVien_Delete";
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@manv", txtMaNhanVien.Text);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadDataGridView();
        }
        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc muốn thoát không?",
                 "Error", MessageBoxButtons.YesNoCancel))
            {
                frmMenu form = new frmMenu();
                form.Show();
                this.Hide();
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaNhanVien.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
            ResetValues();
        }

        private bool CheckDataForBtnLuu()
        {
            if (txtMaNhanVien.Text == "" || txtTenNhanVien.Text == "")
            {
                MessageBox.Show("Vui lòng nhập đủ các thông tin của nhân viên!!!", "Thông báo");
                return false;
            }

            return true;
        }

        private void txtDienThoai_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void export2Excel(DataGridView g, string duongDan, string tenTap)
        {
            app obj = new app();
            obj.Application.Workbooks.Add(Type.Missing);
            obj.Columns.ColumnWidth = 25;
            for (int i = 1; i < g.Columns.Count + 1; i++) { obj.Cells[1, i] = g.Columns[i - 1].HeaderText; }
            for (int i = 0; i < g.Rows.Count; i++)
            {
                for (int j = 0; j < g.Columns.Count; j++)
                {
                    if (g.Rows[i].Cells[j].Value != null) { obj.Cells[i + 2, j + 1] = g.Rows[i].Cells[j].Value.ToString(); }
                }
            }
            obj.ActiveWorkbook.SaveCopyAs(duongDan + tenTap + ".xlsx");
            obj.ActiveWorkbook.Saved = true;
        }

        private void button1_Click(object sender, EventArgs e)
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
                                xLWorkbook.Worksheets.Add(tblNhanVien);
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

        private void frmNhanVien_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc muốn thoát không?",
                 "Error", MessageBoxButtons.YesNoCancel))
            {
                frmMenu form = new frmMenu();
                form.Show();
                this.Hide();
            }
        }
    }
}
