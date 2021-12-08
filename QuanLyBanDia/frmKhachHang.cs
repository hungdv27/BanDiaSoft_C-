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


namespace QuanLyBanDia
{
    public partial class frmKhachHang : Form
    {
        DataTable tblKhachHang;

        public frmKhachHang()
        {
            InitializeComponent();
        }
        private void frmKhachHang_Load(object sender, EventArgs e)
        {
            txtMaKhach.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
        }

        private void LoadDataGridView()
        {
            string sql;
            sql = "SELECT * FROM KhachHang";
            tblKhachHang = Class.Functions.GetDataTotable(sql); //Đọc dữ liệu từ bảng
            dgvKhach.DataSource = tblKhachHang; //Nguồn dữ liệu          
            dgvKhach.Columns[0].HeaderText = "Mã Khách";
            dgvKhach.Columns[1].HeaderText = "Tên Khách";
            dgvKhach.Columns[2].HeaderText = "Điện thoại";
            dgvKhach.Columns[3].HeaderText = "Địa chỉ";
            dgvKhach.AllowUserToAddRows = false; //Không cho người dùng thêm dữ liệu trực tiếp
            dgvKhach.EditMode = DataGridViewEditMode.EditProgrammatically; //Không cho sửa dữ liệu trực tiếp
            this.dgvKhach.AutoResizeRows();
            this.dgvKhach.ColumnHeadersDefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
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

        private void ResetValues()
        {
            txtMaKhach.Text = "";
            txtTenKhach.Text = "";
            txtDienThoai.Text = "";
            txtDiaChi.Text = "";

        }

        private bool isEmpty()
        {
            if (txtMaKhach.Text == "")
                return true;
            return false;
        }

        private void txtDienThoai_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            ResetValues();
            txtMaKhach.Enabled = true;
            txtMaKhach.Focus();
            Disable_Button_ThemSuaXoa();
            btnLuu.Enabled = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (isEmpty())
            {
                txtMaKhach.Focus();
                return;
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_KhachHang_Insert";
                    cmd.Parameters.AddWithValue("@makh", txtMaKhach.Text);
                    cmd.Parameters.AddWithValue("@tenkh", txtTenKhach.Text);
                    cmd.Parameters.AddWithValue("@dienthoai", txtDienThoai.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cmd.Connection = conn;
                    if ((int)cmd.ExecuteScalar() == 0)
                        MessageBox.Show("Khách hàng đã tồn tại.Dùng chức năng chỉnh sửa để thay đổi", "Thông báo");
                    else
                        MessageBox.Show("Khách hàng đã được thêm thành công!!!");

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            ResetValues();
            LoadDataGridView();
            txtMaKhach.Focus();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (isEmpty())
            {
                txtMaKhach.Focus();
                return;
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_KhachHang_Update";
                    cmd.Parameters.AddWithValue("@makh", txtMaKhach.Text);
                    cmd.Parameters.AddWithValue("@tenkh", txtTenKhach.Text);
                    cmd.Parameters.AddWithValue("@dienthoai", txtDienThoai.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text);
                    cmd.Connection = conn;
                    if ((int)cmd.ExecuteScalar() == 0)
                        MessageBox.Show("Opp, khách hàng bạn muốn sửa không tồn tại./nHãy thêm vào rồi chỉnh sưa");
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

        private void dgvKhach_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaKhach.Text = dgvKhach.CurrentRow.Cells[0].Value.ToString();
            txtTenKhach.Text = dgvKhach.CurrentRow.Cells[1].Value.ToString();
            txtDienThoai.Text = dgvKhach.CurrentRow.Cells[2].Value.ToString();
            txtDiaChi.Text = dgvKhach.CurrentRow.Cells[3].Value.ToString();
            Enable_Button_ThemSuaXoa();
            txtMaKhach.Enabled = false;

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
            txtMaKhach.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (isEmpty())
            {
                txtMaKhach.Focus();
                return;
            }
            if (DialogResult.Yes == MessageBox.Show("Bạn có muốn xóa hóa đơn này", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question))
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "usp_KhachHang_Delete";
                        cmd.Parameters.AddWithValue("@makh", txtMaKhach.Text);
                        cmd.Connection = conn;
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("Xóa thành công");
                        //this.khachHangTableAdapter.Fill(this.qUANLIBANDIADataSet2.KhachHang);
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            LoadDataGridView();
        }

        private void frmKhachHang_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc muốn thoát không?",
                 "Error", MessageBoxButtons.YesNoCancel))
            {
                frmMenu form = new frmMenu();
                form.Show();
                this.Hide();
            }
        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
