using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace QuanLyBanDia
{
    public partial class frmNCC : Form
    {

        DataTable tblNhaCunCap;
        public frmNCC()
        {
            InitializeComponent();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            ResetValues();
            txtMaNCC.Enabled = true;
            txtMaNCC.Focus();
            Disable_Button_ThemSuaXoa();
            btnLuu.Enabled = true;
        }

        //insert row - usp_KhachHang_Insert
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (isEmpty())
            {
                txtMaNCC.Focus();
                return;
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_NhaCungCap_Insert";
                    cmd.Parameters.AddWithValue("@mancc", txtMaNCC.Text);
                    cmd.Parameters.AddWithValue("@tenncc", txtTenNCC.Text);
                    cmd.Parameters.AddWithValue("@dienthoai", txtDienThoai.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cmd.Connection = conn;
                    if ((int)cmd.ExecuteScalar() == 0)
                        MessageBox.Show("NCC đã tồn tại.Dùng chức năng chỉnh sửa để thay đổi", "Thông báo");
                    else
                        MessageBox.Show("NCC đã được thêm thành công!!!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadDataGridView();
            ResetValues();

        }

        //update row - usp_KhachHang_Udapte
        private void btnSua_Click(object sender, EventArgs e)
        {

            if (isEmpty())
            {
                txtMaNCC.Focus();
                return;
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_NhaCungCap_Update";
                    cmd.Parameters.AddWithValue("@mancc", txtMaNCC.Text);
                    cmd.Parameters.AddWithValue("@tenncc", txtTenNCC.Text);
                    cmd.Parameters.AddWithValue("@dienthoai", txtDienThoai.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cmd.Connection = conn;
                    if ((int)cmd.ExecuteScalar() == 0)
                        MessageBox.Show("Opp, Nhà cung cấp bạn muốn sửa không tồn tại./nHãy thêm vào rồi chỉnh sưa");
                    else
                        MessageBox.Show("Bạn đã sửa thành công");
                    //  this.nhaCungCapTableAdapter.Fill(this.qUANLIBANDIADataSet1.NhaCungCap);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadDataGridView();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (isEmpty())
            {
                txtMaNCC.Focus();
                return;
            }
            if (DialogResult.Yes == MessageBox.Show("Bạn có muốn nhà cung cấp này", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question))
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "usp_NhaCungCap_Delete";
                        cmd.Parameters.AddWithValue("@mancc", txtMaNCC.Text);
                        cmd.Connection = conn;
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("Xóa thành công");
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            LoadDataGridView();
        }

        private void ResetValues()
        {
            txtMaNCC.Text = "";
            txtTenNCC.Text = "";
            txtDienThoai.Text = "";
            txtDiaChi.Text = "";
        }

        private bool isEmpty()
        {
            if (txtMaNCC.Text == "")
                return true;
            return false;
        }

        private void LoadDataGridView()
        {
            string sql;
            sql = "SELECT *  FROM NhaCungCap ";
            tblNhaCunCap = Class.Functions.GetDataTotable(sql); //Đọc dữ liệu từ bảng
            dgvNCC.DataSource = tblNhaCunCap; //Nguồn dữ liệu          
            dgvNCC.Columns[0].HeaderText = "Mã NCC";
            dgvNCC.Columns[1].HeaderText = "Tên NCC";
            dgvNCC.Columns[2].HeaderText = "Điện thoại";
            dgvNCC.Columns[3].HeaderText = "Địa chỉ";
            dgvNCC.AllowUserToAddRows = false; //Không cho người dùng thêm dữ liệu trực tiếp
            dgvNCC.EditMode = DataGridViewEditMode.EditProgrammatically; //Không cho sửa dữ liệu trực tiếp
        }

        private void frmNCC_Load(object sender, EventArgs e)
        {
            txtMaNCC.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
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
            ResetValues();
            txtMaNCC.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
        }

        private void dgvNCC_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaNCC.Text = dgvNCC.CurrentRow.Cells[0].Value.ToString();
            txtTenNCC.Text = dgvNCC.CurrentRow.Cells[1].Value.ToString();
            txtDienThoai.Text = dgvNCC.CurrentRow.Cells[2].Value.ToString();
            txtDiaChi.Text = dgvNCC.CurrentRow.Cells[3].Value.ToString();
            Enable_Button_ThemSuaXoa();
            txtMaNCC.Enabled = true;
        }

        private void frmNCC_FormClosing(object sender, FormClosingEventArgs e)
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
