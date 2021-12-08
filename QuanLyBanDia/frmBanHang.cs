using QuanLyBanDia.Class;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace QuanLyBanDia
{
    public partial class frmBanHang : Form
    {
        DataTable tblDanhSachSP;//đổ dữ liệu từ sql vào datatable sau đó đổ vào datagridview

        double tongTien = 0;//tổng tiền hoá đơn

        public frmBanHang()
        {
            InitializeComponent();
        }

        private void frmBanHang_Load(object sender, EventArgs e)
        {
            LoadDongHo();
            LoadComboBox();
            LoadDataGridView();//Load combobox trước và chọn index trước khi load datagridview
            LoadListView();
            LoadThongTinMuaHang();
        }

        private void ResetValue_ALL()
        {
            txtMaHoaDon.Text = "";
            txtMaKH.Text = "";
            txtTenKhach.Text = "";
            txtSoDienThoai.Text = "";
            txtSoDienThoai.Text = "";
            txtMaSanPham.Text = "";
            txtTenSanPham.Text = "";
            txtTenLoaiSP.Text = "";
            nudSoLuong.Value = 1;
            txtDongia.Text = "";
            txtGiamgia.Text = "";
            txtThanhTien.Text = "";
            tongTien = 0;
            txtTongTien.Text = tongTien.ToString();
            lstvHoaDon.Clear();
        }

        private void ResetValue_SanPham()
        {

            txtMaSanPham.Text = "";
            txtTenSanPham.Text = "";
            txtTenLoaiSP.Text = "";
            nudSoLuong.Value = 1;
            txtDongia.Text = "";
            txtGiamgia.Text = "";
            txtTongTien.Text = tongTien.ToString();

        }

        private void LoadDataGridView()
        {
            string sql = "Select MaDia, TenDia, TheLoai.TenTL,SoLuong, DonGiaBan, GiamGia  from KhoDia join TheLoai on TheLoai.MaTL = KhoDia.MaTL";
            tblDanhSachSP = Functions.GetDataTotable(sql);
            dgvKho.DataSource = tblDanhSachSP;
            dgvKho.Columns[0].HeaderText = "Mã Đĩa";
            dgvKho.Columns[1].HeaderText = "Tên Đĩa";
            dgvKho.Columns[2].HeaderText = "Tên Thể Loại";
            dgvKho.Columns[3].HeaderText = "Số Lượng Tồn";
            dgvKho.Columns[4].HeaderText = "Đơn Giá Bán";
            dgvKho.Columns[5].HeaderText = "Giảm Giá (%)";
            dgvKho.Columns[4].DefaultCellStyle.Format = "#";//ép kiểu định dạng money từ sql(bỏ đi số 0 sau dấu ,)
            this.dgvKho.Columns[3].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;//căn lề phải
            this.dgvKho.Columns[4].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;//căn lề phải
            dgvKho.AllowUserToAddRows = false; //Không cho người dùng thêm dữ liệu trực tiếp
            dgvKho.EditMode = DataGridViewEditMode.EditProgrammatically; //Không cho sửa dữ liệu trực tiếp
            this.dgvKho.DefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
            this.dgvKho.AutoResizeRows();
            this.dgvKho.ColumnHeadersDefaultCellStyle.Font = new Font("Microsoft Sans Serif", 12);
        }

        private void LoadDataGridView(string maTheLoai)
        {
            string sql = "Select MaDia, TenDia, TheLoai.TenTL,SoLuong, DonGiaBan,GiamGia  from KhoDia join TheLoai on TheLoai.MaTL = KhoDia.MaTL where TheLoai.MaTL = N'" + maTheLoai + "'";
            tblDanhSachSP = Functions.GetDataTotable(sql);
            dgvKho.DataSource = tblDanhSachSP;
            dgvKho.Columns[0].HeaderText = "Mã Đĩa";
            dgvKho.Columns[1].HeaderText = "Tên Đĩa";
            dgvKho.Columns[2].HeaderText = "Tên Thể Loại";
            dgvKho.Columns[3].HeaderText = "Số Lượng Tồn";
            dgvKho.Columns[4].HeaderText = "Đơn Giá Bán";
            dgvKho.Columns[5].HeaderText = "Giảm Giá";
        }

        private void LoadListView()
        {
            lstvHoaDon.View = View.Details;
            lstvHoaDon.GridLines = true;
            lstvHoaDon.FullRowSelect = true;

            lstvHoaDon.Columns.Add("Mã sản phẩm", 110);//item.text
            lstvHoaDon.Columns.Add("Tên sản phẩm", 180);//subitem[1]
            lstvHoaDon.Columns.Add("Thể loại", 80);//subitem[2]
            lstvHoaDon.Columns.Add("SL", 50);//subitem[3]
            lstvHoaDon.Columns.Add("Đơn giá", 70);//subitem[4]
            lstvHoaDon.Columns.Add("Giảm (%)", 75);//subitem[5]
            lstvHoaDon.Columns.Add("Thành tiền", 90);//subitem[6]
        }

        private void LoadComboBox()
        {
            String sql_TheLoai = "Select * from TheLoai";
            String sql_NhanVien = "Select MaNV, TenNV from NhanVien";
            Functions.FillCombo(sql_TheLoai, cmbTheLoai, "MaTL", "TenTL");
            Functions.FillCombo(sql_NhanVien, cmbNhanVien, "MaNV", "TenNV");
            this.cmbNhanVien.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbTheLoai.DropDownStyle = ComboBoxStyle.DropDownList;
            cmbTheLoai.SelectedIndex = -1;
            cmbNhanVien.SelectedIndex = -1;
        }

        private void LoadDongHo()
        {
            timer_DongHo.Start();
        }

        private void LoadThongTinMuaHang()
        {
            txtMaHoaDon.Enabled = false;
            txtMaHoaDon.Text = Increment_MaHoaDon();
            txtMaKH.Enabled = false;
            txtMaKH.Text = Increment_MaKhachHang();
        }

        private string Increment_MaHoaDon()
        {
            string maHDB_CuoiCung = Functions.GetLastIdTable("HoaDonBan", "MaHDB");
            maHDB_CuoiCung = maHDB_CuoiCung.Substring(3);
            int temp = int.Parse(maHDB_CuoiCung);
            temp++;
            string maHDB = String.Format("{0:HDB00000}", temp);
            return maHDB;
        }

        private string Increment_MaKhachHang()
        {
            string maKH_CuoiCung = Functions.GetLastIdTable("KhachHang", "MaKH");
            maKH_CuoiCung = maKH_CuoiCung.Substring(3);
            int temp = int.Parse(maKH_CuoiCung);
            temp++;
            string maKH = String.Format("{0:KH00000}", temp);
            return maKH;
        }

        private void TinhTongTien()
        {
            tongTien = 0;
            if (lstvHoaDon.Items.Count != 0)
                foreach (ListViewItem i in lstvHoaDon.Items)
                {
                    double thanhTien = double.Parse(i.SubItems[6].Text.ToString());
                    tongTien += thanhTien;
                }
            txtTongTien.Text = tongTien.ToString();
        }

        private bool Insert_KhachHang()
        {
            if (txtMaKH.TextLength == 0)
            {
                MessageBox.Show("Lỗi mã khách hàng", "Thông báo");
                return false;
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_KhachHang_Insert";
                    cmd.Parameters.AddWithValue("@makh", txtMaKH.Text);
                    cmd.Parameters.AddWithValue("@tenkh", txtMaKH.Text);
                    cmd.Parameters.AddWithValue("@dienthoai", txtMaKH.Text);
                    cmd.Parameters.AddWithValue("@diachi", txtMaKH.Text);
                    cmd.Connection = conn;
                    if ((int)cmd.ExecuteScalar() != 1)
                    {
                        MessageBox.Show("Khách hàng đã tồn tại", "Thông báo");
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                MessageBox.Show("Lỗi thêm khách hàng" + e.Message, "Thông báo");
                return false;
            }
            return true;
        }

        private bool Insert_HoaDonBan()
        {
            if (txtMaHoaDon.TextLength == 0 || cmbNhanVien.Text.Length == 0)
            {
                MessageBox.Show("Kiểm tra lại mã hoá đơn và nhân viên lập", "Thông báo");
                return false;
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_HoaDonBan_Insert";
                    cmd.Parameters.AddWithValue("@mahdb", txtMaHoaDon.Text);
                    cmd.Parameters.AddWithValue("@manv", cmbNhanVien.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@ngayban", DateTime.Now.ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@makh", txtMaKH.Text);
                    cmd.Parameters.AddWithValue("@thanhtien", txtTongTien.Text);
                    cmd.Connection = conn;
                    string s = " ";
                    s += txtMaHoaDon.Text;
                    s += cmbNhanVien.Text;
                    s += DateTime.Now.ToString("yyyy-MM-dd");
                    s += txtMaKH.Text;
                    s += txtTongTien.Text;

                    if ((int)cmd.ExecuteScalar() != 3)
                    {
                        MessageBox.Show("Lỗi thêm hoá đơn bán", "Thông báo");
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                MessageBox.Show("Lỗi thêm hoá đơn bán" + e.Message, "Thông báo");
                return false;
            }
            return true;
        }

        private bool Insert_ChiTietHDB()
        {
            if (lstvHoaDon.Items.Count == 0)
            {
                MessageBox.Show("Chưa thêm sản phẩm nào trong giỏ hàng", "Thông báo");
                return false;
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
                {
                    conn.Open();
                    foreach (ListViewItem i in lstvHoaDon.Items)
                    {

                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "usp_ChiTietHDB_Insert";
                        cmd.Connection = conn;


                        cmd.Parameters.AddWithValue("@mahdb", txtMaHoaDon.Text);
                        cmd.Parameters.AddWithValue("@madia", i.Text);
                        cmd.Parameters.AddWithValue("@soluong", i.SubItems[3].Text);
                        cmd.Parameters.AddWithValue("@giamgia", i.SubItems[5].Text);
                        cmd.Parameters.AddWithValue("@thanhtien", i.SubItems[6].Text);

                        if ((int)cmd.ExecuteScalar() != 3)
                        {
                            MessageBox.Show("Lỗi thêm sản phẩm " + i.Text + " vào hoá đơn", "Thông báo");
                            cmd.Dispose();
                            return false;
                        }
                        cmd.Dispose();
                    }
                }

            }
            catch (Exception e)
            {
                MessageBox.Show("Lỗi thêm sản phẩm vào hoá đơn" + e.Message, "Thông báo");
            }

            return true;
        }

        private void cmbTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cmbTheLoai.SelectedIndex != -1)
            {
                string maTheLoai = this.cmbTheLoai.SelectedValue.ToString();
                LoadDataGridView(maTheLoai);
            }
        }

        private void dgvKho_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (cmbNhanVien.SelectedIndex == -1)
            {
                MessageBox.Show("Vui lòng chọn tên nhân viên", "Thông báo");
                return;
            }
            double thanhTien;
            int soLuong;
            int giamGia;
            double donGia;
            txtMaSanPham.Text = dgvKho.CurrentRow.Cells[0].Value.ToString();
            txtTenSanPham.Text = dgvKho.CurrentRow.Cells[1].Value.ToString();
            txtTenLoaiSP.Text = dgvKho.CurrentRow.Cells[2].Value.ToString();
            txtDongia.Text = dgvKho.CurrentRow.Cells[4].FormattedValue.ToString();
            int.TryParse(dgvKho.CurrentRow.Cells[5].Value.ToString(), out giamGia);
            txtGiamgia.Text = giamGia.ToString();
            donGia = double.Parse(dgvKho.CurrentRow.Cells[4].FormattedValue.ToString());
            soLuong = int.Parse(nudSoLuong.Value.ToString());
            thanhTien = soLuong * donGia * (100 - giamGia) / 100;
            txtThanhTien.Text = thanhTien.ToString();
        }

        private void nudSoLuong_ValueChanged(object sender, EventArgs e)
        {
            double thanhTien;
            int soLuong;
            int giamGia;
            double donGia;
            donGia = double.Parse(dgvKho.CurrentRow.Cells[4].FormattedValue.ToString());
            soLuong = int.Parse(nudSoLuong.Value.ToString());
            int.TryParse(txtGiamgia.Text, out giamGia);
            txtGiamgia.Text = giamGia.ToString();
            thanhTien = soLuong * donGia * (100 - giamGia) / 100;
            txtThanhTien.Text = thanhTien.ToString();
        }

        private void timerDongHo_Tick(object sender, EventArgs e)
        {
            lbTimer.Text = DateTime.Now.ToLongTimeString();
            lbDate.Text = DateTime.Now.ToShortDateString();
        }

        private void btnHuyHoaDon_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn huỷ đơn hàng không", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                ResetValue_ALL();
                cmbTheLoai.SelectedIndex = -1;
                LoadDataGridView();//Load combobox trước và chọn index trước khi load datagridview
                LoadListView();
                LoadThongTinMuaHang();
                nudSoLuong.Value = 1;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (txtMaSanPham.TextLength == 0)
            {
                MessageBox.Show("Vui lòng chọn sản phẩm.", "Thông báo");
                return;
            }

            ListViewItem item = new ListViewItem();
            item.Text = txtMaSanPham.Text;
            item.SubItems.Add(txtTenSanPham.Text);
            item.SubItems.Add(txtTenLoaiSP.Text);
            item.SubItems.Add(nudSoLuong.Value.ToString());
            item.SubItems.Add(txtDongia.Text);
            item.SubItems.Add(txtGiamgia.Text);
            item.SubItems.Add(txtThanhTien.Text);

            //kiểm tra sản phẩm đã có trong danh sách mua hàng 
            foreach (ListViewItem i in lstvHoaDon.Items)
            {
                if (item.Text == i.Text)
                {
                    MessageBox.Show("Sản phẩm này bạn đã chọn.", "Thông báo");
                    ResetValue_SanPham();
                    return;
                }
            }
            lstvHoaDon.Items.Add(item);

            //Tính Tổng tiền
            TinhTongTien();

            ResetValue_SanPham();
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            cmbTheLoai.SelectedIndex = -1;
            LoadDataGridView();
        }

        private void btnXoaSanPham_Click(object sender, EventArgs e)
        {
            if (lstvHoaDon.SelectedItems.Count > 0)
            {
                if (MessageBox.Show("Bạn muốn xóa sản phẩm?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    lstvHoaDon.Items.Remove(lstvHoaDon.SelectedItems[0]);
                    TinhTongTien();
                }
            }
            else MessageBox.Show("Bạn cần chọn sản phẩm để xoá!", "Lưu ý");
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (Insert_KhachHang())
                if (Insert_HoaDonBan())
                    if (Insert_ChiTietHDB())
                    {
                        MessageBox.Show("Thanh toán thành công", "Thông báo");
                        cmbTheLoai.SelectedIndex = -1;
                        LoadDataGridView();
                        lstvHoaDon.Items.Clear();
                    }
            LoadThongTinMuaHang();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form frm = new frmBanHang_TimKiem();
            frm.ShowDialog();

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc muốn thoát không?",
                 "Error", MessageBoxButtons.YesNoCancel))
            {
                this.Close();
                frmMenu form = new frmMenu();
                form.Show();

            }
        }
    }
}
