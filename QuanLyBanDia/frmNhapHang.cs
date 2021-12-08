using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyBanDia.Class;
using System.Data.SqlClient;

namespace QuanLyBanDia
{
    public partial class frmNhapHang : Form
    {

        public frmNhapHang()
        {
            InitializeComponent();
        }

        private void frmNhapHang_Load(object sender, EventArgs e)
        {
            LoadDongHo();
            LoadComboBox();
            LoadThongTinMuaHang();
            LoadListView();

        }

        private void LoadThongTinMuaHang()
        {
            txtMaHoaDon.Enabled = false;
            txtMaHoaDon.Text = Increment_MaHoaDon();

        }
        private void LoadListView()
        {
            lstvHoaDon.View = View.Details;
            lstvHoaDon.GridLines = true;
            lstvHoaDon.FullRowSelect = true;
            lstvHoaDon.MultiSelect = false;

            lstvHoaDon.Columns.Add("Mã sản phẩm", 120);//item.text
            lstvHoaDon.Columns.Add("Tên sản phẩm", 250);//subitem[1]
            lstvHoaDon.Columns.Add("Thể loại", 120);//subitem[2]
            lstvHoaDon.Columns.Add("Nhà cung cấp", 200);//subitem[3]
            lstvHoaDon.Columns.Add("Số Lượng", 80);//subitem[4]
            lstvHoaDon.Columns.Add("Đơn vị", 90);//subitem[5]
            lstvHoaDon.Columns.Add("Đơn giá", 100);//subitem[6]
            lstvHoaDon.Columns.Add("Thành tiền", 120);//subitem[7]

        }


        private void ResetValue()
        {
            txtMaHoaDon.Text = "";
            txtMaSanPham.Text = "";
            txtTenSanPham.Text = "";
            cmbNhaCungCap.SelectedItem = -1;
            cmbTheLoai.SelectedIndex = -1;
            nudSoLuong.Value = 1;
            txtDongia.Text = "";
            txtMaHoaDon.Text = "";
            txtMaHoaDon.Text = "";
            txtThanhTien.Text = "";
        }

        private bool Checkvalue()
        {
            if (txtMaHoaDon.TextLength == 0 || txtTenSanPham.TextLength == 0 || txtDongia.TextLength == 0 || cmbNhaCungCap.SelectedIndex == -1 || cmbTheLoai.SelectedIndex == -1)
            {
                MessageBox.Show("Bạn cần bổ sung thông tin sản phẩm", "Thông báo");
                return false;
            }

            if (cmbNhanVien.SelectedIndex == -1)
            {
                MessageBox.Show("Chọn nhân viên nhập hàng", "Thông báo");
                return false;
            }
            return true;
        }

        private string Increment_MaHoaDon()
        {
            string maHDB_CuoiCung = Functions.GetLastIdTable("HoaDonNhap", "MaHDN");
            maHDB_CuoiCung = maHDB_CuoiCung.Substring(3);
            int temp = int.Parse(maHDB_CuoiCung);
            temp++;
            string maHDB = String.Format("{0:HDN00000}", temp);
            return maHDB;
        }

        private void LoadComboBox()
        {
            String sql_TheLoai = "Select * from TheLoai";
            String sql_NhanVien = "Select MaNV, TenNV from NhanVien";
            String sql_NhaCungCap = "Select MaNCC, TenNCC from NhaCungCap";
            Functions.FillCombo(sql_TheLoai, cmbTheLoai, "MaTL", "TenTL");
            Functions.FillCombo(sql_NhanVien, cmbNhanVien, "MaNV", "TenNV");
            Functions.FillCombo(sql_NhaCungCap, cmbNhaCungCap, "MaNCC", "TenNCC");
            this.cmbNhanVien.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbTheLoai.DropDownStyle = ComboBoxStyle.DropDownList;
            cmbTheLoai.SelectedIndex = -1;
            cmbNhanVien.SelectedIndex = -1;
            cmbNhaCungCap.SelectedIndex = -1;
        }

        private void LoadDongHo()
        {
            timerDongHo.Start();
        }

        private void btnThemSanPham_Click(object sender, EventArgs e)
        {
            if (!Checkvalue())
            {
                return;
            }

            ListViewItem item = new ListViewItem();
            item.Text = txtMaSanPham.Text;
            item.SubItems.Add(txtTenSanPham.Text);
            item.SubItems.Add(cmbTheLoai.Text);
            item.SubItems.Add(cmbNhaCungCap.Text);
            item.SubItems.Add(nudSoLuong.Value.ToString());
            item.SubItems.Add("Đĩa");
            item.SubItems.Add(txtDongia.Text);
            item.SubItems.Add(txtThanhTien.Text);


            //kiểm tra sản phẩm đã có trong danh sách mua hàng 
            foreach (ListViewItem i in lstvHoaDon.Items)
            {
                if (item.Text == i.Text)
                {
                    MessageBox.Show("Sản phẩm này bạn đã chọn.", "Thông báo");
                    return;
                }
            }
            lstvHoaDon.Items.Add(item);

            TinhTongTien();


        }
        private void TinhTongTien()
        {
            double tongTien = 0;
            if (lstvHoaDon.Items.Count != 0)
                foreach (ListViewItem i in lstvHoaDon.Items)
                {
                    double thanhTien = double.Parse(i.SubItems[7].Text.ToString());
                    tongTien += thanhTien;
                }
            txtTongTien.Text = tongTien.ToString();
        }

        private void btnXoaSanPham_Click(object sender, EventArgs e)
        {
            if (lstvHoaDon.SelectedItems.Count > 0)
            {
                if (MessageBox.Show("Bạn có muốn xoá không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    foreach (ListViewItem x in lstvHoaDon.SelectedItems)
                        lstvHoaDon.Items.Remove(x);
                }
            }
            else
                MessageBox.Show("Bạn cần chọn một dòng");
            TinhTongTien();
        }

        //private bool Insert_KhachHang()
        //{
        //    if (txtMaKH.TextLength == 0)
        //    {
        //        MessageBox.Show("Lỗi mã khách hàng", "Thông báo");
        //        return false;
        //    }
        //    try
        //    {
        //        using (SqlConnection conn = new SqlConnection(ConnectSQL.stringConn))
        //        {
        //            conn.Open();
        //            SqlCommand cmd = new SqlCommand();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "usp_KhachHang_Insert";
        //            cmd.Parameters.AddWithValue("@makh", txtMaKH.Text);
        //            cmd.Parameters.AddWithValue("@tenkh", txtMaKH.Text);
        //            cmd.Parameters.AddWithValue("@dienthoai", txtMaKH.Text);
        //            cmd.Parameters.AddWithValue("@diachi", txtMaKH.Text);
        //            cmd.Connection = conn;
        //            if ((int)cmd.ExecuteScalar() != 1)
        //            {
        //                MessageBox.Show("Khách hàng đã tồn tại", "Thông báo");
        //                return false;
        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        MessageBox.Show("Lỗi thêm khách hàng" + e.Message, "Thông báo");
        //        return false;
        //    }
        //    return true;
        //}

        private bool Insert_HoaDonNhap()
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
                    cmd.CommandText = "usp_HoaDonNhap_Insert";
                    cmd.Parameters.AddWithValue("@mahdn", txtMaHoaDon.Text.Trim());
                    cmd.Parameters.AddWithValue("@manv", cmbNhanVien.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@ngaynhap", DateTime.Now.ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@mancc", cmbNhaCungCap.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@thanhtien", txtTongTien.Text);
                    cmd.Connection = conn;


                    if ((int)cmd.ExecuteScalar() != 3)
                    {
                        MessageBox.Show("Lỗi thêm hoá đơn bán", "Thông báo");
                        return false;
                    }
                    return true;
                }
            }
            catch (Exception e)
            {
                MessageBox.Show("Lỗi thêm hoá đơn bán" + e.Message, "Thông báo");
                return false;
            }
            return false;

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
                        cmd.CommandText = "usp_ChiTietHDN_Insert";
                        cmd.Connection = conn;


                        cmd.Parameters.AddWithValue("@mahdn", txtMaHoaDon.Text);
                        cmd.Parameters.AddWithValue("@madia", i.Text.Trim());
                        cmd.Parameters.AddWithValue("@soluong", int.Parse(i.SubItems[4].Text));
                        cmd.Parameters.AddWithValue("@dongia", int.Parse(i.SubItems[6].Text));
                        cmd.Parameters.AddWithValue("@thanhtien", double.Parse(i.SubItems[7].Text));




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
                MessageBox.Show("Lỗi thêm sản phẩm vào hoá đơn :" + e.Message, "Thông báo");
                return false;
            }

            return true;
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            ResetValue();
            LoadThongTinMuaHang();
        }

        private void btnHuyHoaDon_Click(object sender, EventArgs e)
        {
            ResetValue();
            LoadThongTinMuaHang();
            lstvHoaDon.Items.Clear();
            TinhTongTien();

        }

        private void timerDongHo_Tick(object sender, EventArgs e)
        {
            lbTimer.Text = DateTime.Now.ToLongTimeString();
            lbDate.Text = DateTime.Now.ToShortDateString();
        }

        private void txtDongia_TextChanged(object sender, EventArgs e)
        {
            int donGia = 0;
            int.TryParse(this.txtDongia.Text, out donGia);
            int thanhTien = donGia * int.Parse(nudSoLuong.Value.ToString());
            txtThanhTien.Text = thanhTien.ToString();
        }



        private void nudSoLuong_ValueChanged_1(object sender, EventArgs e)
        {
            int donGia = 0;
            int.TryParse(txtDongia.Text, out donGia);
            int thanhTien = donGia * int.Parse(nudSoLuong.Value.ToString());
            txtThanhTien.Text = thanhTien.ToString();
        }

        private void btnThemNCC_Click(object sender, EventArgs e)
        {
            Form f = new frmNCC();
            f.ShowDialog();
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (Insert_HoaDonNhap() || lstvHoaDon.Items.Count > 0)
            {
                if (Insert_ChiTietHDB())
                {
                    MessageBox.Show("Thanh toán thành công", "Thông báo");
                    LoadThongTinMuaHang();
                    ResetValue();
                    TinhTongTien();
                }
            }
            else MessageBox.Show("Không có sản phẩm nào trong danh sách", "Thông báo");
        }

        private void frmNhapHang_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc muốn thoát không?",
                 "Error", MessageBoxButtons.YesNoCancel))
            {
                frmMenu form = new frmMenu();
                form.Show();
                this.Hide();
            }
            else
                return;
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
    }
}
