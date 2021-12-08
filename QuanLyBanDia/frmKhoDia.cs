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
    public partial class frmKhoDia : Form
    {
        DataTable tblKhoDia;

        public frmKhoDia()
        {
            InitializeComponent();
        }

        private void frmKhoDia_Load(object sender, EventArgs e)
        {
            string sql = "Select * From TheLoai";
            Functions.FillCombo(sql, cboTenTheLoai, "MaTL", "TenTL");
            txtMaDia.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
        }

        public void LoadDataGridView()
        {
            string sql;
            sql = "SELECT MaDia, TenDia, Soluong, DonGiaBan, DonGiaNhap, MaNSX, KhoDia.MaTL, Anh, GhiChu From KhoDia join TheLoai on KhoDia.MaTL = TheLoai.MaTL";
            tblKhoDia = Functions.GetDataTotable(sql);
            dgvKhoDia.DataSource = tblKhoDia;
            dgvKhoDia.Columns[0].HeaderText = "Mã Đĩa";
            dgvKhoDia.Columns[1].HeaderText = "Tên Đĩa";
            dgvKhoDia.Columns[2].HeaderText = "Số Lượng";
            dgvKhoDia.Columns[3].HeaderText = "Đơn Giá Bán";
            dgvKhoDia.Columns[4].HeaderText = "Đơn Giá Nhập";
            dgvKhoDia.Columns[5].HeaderText = "Mã NSX";
            dgvKhoDia.Columns[6].HeaderText = "Mã Thể Loại";
            //dgvKhoDia.Columns[7].HeaderText = "Ảnh";
            dgvKhoDia.Columns[7].Visible = false;
            dgvKhoDia.Columns[8].HeaderText = "Ghi Chú";
            dgvKhoDia.AllowUserToAddRows = false;
            dgvKhoDia.EditMode = DataGridViewEditMode.EditProgrammatically;
            this.dgvKhoDia.DefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
            this.dgvKhoDia.AutoResizeRows();
            this.dgvKhoDia.ColumnHeadersDefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
        }

        private void txt_OnlyNumber_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
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

        private void ResetValues()
        {
            txtMaDia.Text = "";
            txtTenDia.Text = "";
            txtSoLuong.Text = "";
            txtDonGiaBan.Text = "";
            txtDonGiaNhap.Text = "";
            txtMaNSX.Text = "";
            txtGhiChu.Text = "";
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

        private bool isEmpty()
        {
            if (txtMaDia.Text == "")
            {
                txtMaDia.Focus();
                return true;
            }
            return false;

        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (isEmpty()) return;
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "ups_KhoDia_Insert";
                    cmd.Parameters.AddWithValue("@madia", txtMaDia.Text);
                    cmd.Parameters.AddWithValue("@tendia", txtTenDia.Text);
                    cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text);
                    cmd.Parameters.AddWithValue("@dongiaban", txtDonGiaBan.Text);
                    cmd.Parameters.AddWithValue("@dongianhap", txtDonGiaNhap.Text);
                    cmd.Parameters.AddWithValue("@mansx", txtMaNSX.Text);
                    cmd.Parameters.AddWithValue("@matl", cboTenTheLoai.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@anh", txtAnh.Text);//openfile
                    cmd.Parameters.AddWithValue("@ghichu", txtGhiChu.Text);
                    cmd.Connection = conn;
                    if ((int)cmd.ExecuteScalar() == 0) MessageBox.Show("Mã đĩa " + txtMaDia.Text + " đã tồn tại!!!");
                    else MessageBox.Show("Thêm thành công");

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadDataGridView();
            ResetValues();
            txtMaDia.Focus();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            ResetValues();
            txtMaDia.Enabled = true;
            txtMaDia.Focus();
            Disable_Button_ThemSuaXoa();
            btnLuu.Enabled = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (isEmpty()) return;
            try
            {
                if (MessageBox.Show("Bạn có chắc chắn muốn sửa không", "Thông báo", MessageBoxButtons.YesNoCancel) == DialogResult.Yes)
                    using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "usp_KhoDia_Update";
                        cmd.Parameters.AddWithValue("@madia", txtMaDia.Text);
                        cmd.Parameters.AddWithValue("@tendia", txtTenDia.Text);
                        cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text);
                        cmd.Parameters.AddWithValue("@dongianhap", txtDonGiaNhap.Text);
                        cmd.Parameters.AddWithValue("@dongiaban", txtDonGiaBan.Text);
                        cmd.Parameters.AddWithValue("@mansx", txtMaNSX.Text);
                        cmd.Parameters.AddWithValue("@matl", cboTenTheLoai.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@ghichu", txtGhiChu.Text);
                        cmd.Parameters.AddWithValue("@anh", txtAnh.Text);
                        cmd.Connection = conn;
                        if ((int)cmd.ExecuteScalar() == 3)
                            MessageBox.Show("Sửa thành công", "Thông báo");
                        else
                            MessageBox.Show("Sửa thất bại", "Thông báo");

                    }
                else
                    return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadDataGridView();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (isEmpty()) return;
            try
            {
                if (MessageBox.Show("Bạn có chắc chắn muốn xoá không?", "Thông báo", MessageBoxButtons.YesNoCancel) == DialogResult.Yes)
                    using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "usp_KhoDia_Delete";
                        cmd.Parameters.AddWithValue("@madia", txtMaDia.Text);
                        cmd.Connection = conn;
                        if ((int)cmd.ExecuteScalar() == 1)
                            MessageBox.Show("Xoá thành công", "Thông báo");
                        else
                            MessageBox.Show("Xoá thất bại. Mã đĩa không tồn tại.", "Thông báo");
                    }
                else
                    return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadDataGridView();
            ResetValues();
        }

        private void dgvKhoDia_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string MaTheLoai;
            string sql;
            txtMaDia.Text = dgvKhoDia.CurrentRow.Cells[0].Value.ToString();
            txtTenDia.Text = dgvKhoDia.CurrentRow.Cells[1].Value.ToString();
            txtSoLuong.Text = dgvKhoDia.CurrentRow.Cells[2].Value.ToString();
            txtDonGiaBan.Text = dgvKhoDia.CurrentRow.Cells[3].Value.ToString();
            txtDonGiaNhap.Text = dgvKhoDia.CurrentRow.Cells[4].Value.ToString();
            txtMaNSX.Text = dgvKhoDia.CurrentRow.Cells[5].Value.ToString();
            txtGhiChu.Text = dgvKhoDia.CurrentRow.Cells[7].Value.ToString();
            MaTheLoai = dgvKhoDia.CurrentRow.Cells[6].Value.ToString();
            sql = "SELECT TenTL FROM TheLoai WHERE MaTL=N'" + MaTheLoai + "'";
            cboTenTheLoai.Text = Functions.GetFieldValues(sql);
            Enable_Button_ThemSuaXoa();
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaDia.Enabled = false;
            Disable_Button_ThemSuaXoa();
            LoadDataGridView();
            ResetValues();
        }

        private void frmKhoDia_FormClosing(object sender, FormClosingEventArgs e)
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
