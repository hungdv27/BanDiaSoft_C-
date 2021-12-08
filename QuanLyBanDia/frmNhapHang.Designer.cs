
namespace QuanLyBanDia
{
    partial class frmNhapHang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmNhapHang));
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel10 = new System.Windows.Forms.Panel();
            this.lbDate = new System.Windows.Forms.Label();
            this.lbTimer = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.txtMaHoaDon = new System.Windows.Forms.TextBox();
            this.lbNhanVienLap = new System.Windows.Forms.Label();
            this.lbSoHoaDon = new System.Windows.Forms.Label();
            this.cmbNhanVien = new System.Windows.Forms.ComboBox();
            this.lbMaSanPham = new System.Windows.Forms.Label();
            this.lbTenSanPham = new System.Windows.Forms.Label();
            this.lbTenloaiSP = new System.Windows.Forms.Label();
            this.lbDongia = new System.Windows.Forms.Label();
            this.lbThanhTien = new System.Windows.Forms.Label();
            this.txtMaSanPham = new System.Windows.Forms.TextBox();
            this.txtTenSanPham = new System.Windows.Forms.TextBox();
            this.txtThanhTien = new System.Windows.Forms.TextBox();
            this.txtDongia = new System.Windows.Forms.TextBox();
            this.lbvnd = new System.Windows.Forms.Label();
            this.lbVNĐ = new System.Windows.Forms.Label();
            this.cmbTheLoai = new System.Windows.Forms.ComboBox();
            this.cmbNhaCungCap = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.grbThongTinMuaHang = new System.Windows.Forms.GroupBox();
            this.nudSoLuong = new System.Windows.Forms.NumericUpDown();
            this.lbDonvitinh = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.lbSoLuong = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lstvHoaDon = new System.Windows.Forms.ListView();
            this.panel3 = new System.Windows.Forms.Panel();
            this.btnThanhToan = new System.Windows.Forms.Button();
            this.btnHuyHoaDon = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.txtTongTien = new System.Windows.Forms.TextBox();
            this.lbTongTien = new System.Windows.Forms.Label();
            this.timerDongHo = new System.Windows.Forms.Timer(this.components);
            this.btnLamMoi = new System.Windows.Forms.Button();
            this.btnXoaSanPham = new System.Windows.Forms.Button();
            this.btnThemSanPham = new System.Windows.Forms.Button();
            this.btnTimKiemMaSP = new System.Windows.Forms.Button();
            this.btnThemNCC = new System.Windows.Forms.Button();
            this.btnThoat = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.panel10.SuspendLayout();
            this.grbThongTinMuaHang.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudSoLuong)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(117)))), ((int)(((byte)(214)))));
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.panel10);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.ForeColor = System.Drawing.Color.White;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1469, 73);
            this.panel1.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(564, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(361, 35);
            this.label1.TabIndex = 0;
            this.label1.Text = "HOÁ ĐƠN NHẬP HÀNG";
            // 
            // panel10
            // 
            this.panel10.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.panel10.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel10.Controls.Add(this.lbDate);
            this.panel10.Controls.Add(this.lbTimer);
            this.panel10.Location = new System.Drawing.Point(1288, 26);
            this.panel10.Name = "panel10";
            this.panel10.Size = new System.Drawing.Size(158, 35);
            this.panel10.TabIndex = 7;
            // 
            // lbDate
            // 
            this.lbDate.BackColor = System.Drawing.Color.White;
            this.lbDate.ForeColor = System.Drawing.Color.Blue;
            this.lbDate.Location = new System.Drawing.Point(72, 0);
            this.lbDate.Name = "lbDate";
            this.lbDate.Size = new System.Drawing.Size(85, 32);
            this.lbDate.TabIndex = 5;
            this.lbDate.Text = "Ngày";
            this.lbDate.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lbTimer
            // 
            this.lbTimer.BackColor = System.Drawing.Color.White;
            this.lbTimer.ForeColor = System.Drawing.Color.Blue;
            this.lbTimer.Location = new System.Drawing.Point(-4, 0);
            this.lbTimer.Name = "lbTimer";
            this.lbTimer.Size = new System.Drawing.Size(78, 32);
            this.lbTimer.TabIndex = 5;
            this.lbTimer.Text = "Giờ";
            this.lbTimer.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // panel2
            // 
            this.panel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel2.Location = new System.Drawing.Point(0, 73);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(23, 524);
            this.panel2.TabIndex = 3;
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Right;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(1446, 73);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(23, 524);
            this.flowLayoutPanel1.TabIndex = 0;
            // 
            // txtMaHoaDon
            // 
            this.txtMaHoaDon.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.txtMaHoaDon.Location = new System.Drawing.Point(293, 47);
            this.txtMaHoaDon.Name = "txtMaHoaDon";
            this.txtMaHoaDon.ReadOnly = true;
            this.txtMaHoaDon.Size = new System.Drawing.Size(202, 22);
            this.txtMaHoaDon.TabIndex = 1;
            // 
            // lbNhanVienLap
            // 
            this.lbNhanVienLap.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbNhanVienLap.AutoSize = true;
            this.lbNhanVienLap.Location = new System.Drawing.Point(982, 50);
            this.lbNhanVienLap.Name = "lbNhanVienLap";
            this.lbNhanVienLap.Size = new System.Drawing.Size(96, 16);
            this.lbNhanVienLap.TabIndex = 4;
            this.lbNhanVienLap.Text = "Nhân Viên Lập";
            // 
            // lbSoHoaDon
            // 
            this.lbSoHoaDon.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbSoHoaDon.AutoSize = true;
            this.lbSoHoaDon.Location = new System.Drawing.Point(195, 50);
            this.lbSoHoaDon.Name = "lbSoHoaDon";
            this.lbSoHoaDon.Size = new System.Drawing.Size(81, 16);
            this.lbSoHoaDon.TabIndex = 8;
            this.lbSoHoaDon.Text = "Số Hóa Đơn";
            // 
            // cmbNhanVien
            // 
            this.cmbNhanVien.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cmbNhanVien.ForeColor = System.Drawing.SystemColors.WindowText;
            this.cmbNhanVien.FormattingEnabled = true;
            this.cmbNhanVien.Location = new System.Drawing.Point(1104, 47);
            this.cmbNhanVien.Name = "cmbNhanVien";
            this.cmbNhanVien.Size = new System.Drawing.Size(173, 24);
            this.cmbNhanVien.TabIndex = 10;
            this.cmbNhanVien.Text = "Hãy chọn nhân viên";
            // 
            // lbMaSanPham
            // 
            this.lbMaSanPham.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbMaSanPham.AutoSize = true;
            this.lbMaSanPham.Location = new System.Drawing.Point(194, 87);
            this.lbMaSanPham.Name = "lbMaSanPham";
            this.lbMaSanPham.Size = new System.Drawing.Size(92, 16);
            this.lbMaSanPham.TabIndex = 22;
            this.lbMaSanPham.Text = "Mã Sản Phẩm";
            // 
            // lbTenSanPham
            // 
            this.lbTenSanPham.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbTenSanPham.AutoSize = true;
            this.lbTenSanPham.Location = new System.Drawing.Point(571, 88);
            this.lbTenSanPham.Name = "lbTenSanPham";
            this.lbTenSanPham.Size = new System.Drawing.Size(97, 16);
            this.lbTenSanPham.TabIndex = 23;
            this.lbTenSanPham.Text = "Tên Sản Phẩm";
            // 
            // lbTenloaiSP
            // 
            this.lbTenloaiSP.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbTenloaiSP.AutoSize = true;
            this.lbTenloaiSP.Location = new System.Drawing.Point(981, 92);
            this.lbTenloaiSP.Name = "lbTenloaiSP";
            this.lbTenloaiSP.Size = new System.Drawing.Size(78, 16);
            this.lbTenloaiSP.TabIndex = 25;
            this.lbTenloaiSP.Text = "Tên loại SP";
            // 
            // lbDongia
            // 
            this.lbDongia.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbDongia.AutoSize = true;
            this.lbDongia.Location = new System.Drawing.Point(571, 126);
            this.lbDongia.Name = "lbDongia";
            this.lbDongia.Size = new System.Drawing.Size(87, 16);
            this.lbDongia.TabIndex = 26;
            this.lbDongia.Text = "Đơn giá nhập";
            // 
            // lbThanhTien
            // 
            this.lbThanhTien.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbThanhTien.AutoSize = true;
            this.lbThanhTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbThanhTien.Location = new System.Drawing.Point(981, 127);
            this.lbThanhTien.Name = "lbThanhTien";
            this.lbThanhTien.Size = new System.Drawing.Size(91, 18);
            this.lbThanhTien.TabIndex = 28;
            this.lbThanhTien.Text = "Thành Tiền";
            // 
            // txtMaSanPham
            // 
            this.txtMaSanPham.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.txtMaSanPham.Location = new System.Drawing.Point(292, 85);
            this.txtMaSanPham.Name = "txtMaSanPham";
            this.txtMaSanPham.Size = new System.Drawing.Size(151, 22);
            this.txtMaSanPham.TabIndex = 29;
            // 
            // txtTenSanPham
            // 
            this.txtTenSanPham.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.txtTenSanPham.Location = new System.Drawing.Point(689, 87);
            this.txtTenSanPham.Name = "txtTenSanPham";
            this.txtTenSanPham.Size = new System.Drawing.Size(186, 22);
            this.txtTenSanPham.TabIndex = 30;
            // 
            // txtThanhTien
            // 
            this.txtThanhTien.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.txtThanhTien.Location = new System.Drawing.Point(1103, 125);
            this.txtThanhTien.Name = "txtThanhTien";
            this.txtThanhTien.ReadOnly = true;
            this.txtThanhTien.Size = new System.Drawing.Size(174, 22);
            this.txtThanhTien.TabIndex = 33;
            this.txtThanhTien.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // txtDongia
            // 
            this.txtDongia.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.txtDongia.Location = new System.Drawing.Point(689, 123);
            this.txtDongia.Name = "txtDongia";
            this.txtDongia.Size = new System.Drawing.Size(142, 22);
            this.txtDongia.TabIndex = 35;
            this.txtDongia.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtDongia.TextChanged += new System.EventHandler(this.txtDongia_TextChanged);
            // 
            // lbvnd
            // 
            this.lbvnd.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbvnd.AutoSize = true;
            this.lbvnd.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbvnd.Location = new System.Drawing.Point(838, 124);
            this.lbvnd.Name = "lbvnd";
            this.lbvnd.Size = new System.Drawing.Size(39, 18);
            this.lbvnd.TabIndex = 37;
            this.lbvnd.Text = "VNĐ";
            // 
            // lbVNĐ
            // 
            this.lbVNĐ.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbVNĐ.AutoSize = true;
            this.lbVNĐ.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbVNĐ.Location = new System.Drawing.Point(1283, 126);
            this.lbVNĐ.Name = "lbVNĐ";
            this.lbVNĐ.Size = new System.Drawing.Size(42, 18);
            this.lbVNĐ.TabIndex = 39;
            this.lbVNĐ.Text = "VNĐ";
            // 
            // cmbTheLoai
            // 
            this.cmbTheLoai.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cmbTheLoai.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTheLoai.FormattingEnabled = true;
            this.cmbTheLoai.Location = new System.Drawing.Point(1103, 84);
            this.cmbTheLoai.Name = "cmbTheLoai";
            this.cmbTheLoai.Size = new System.Drawing.Size(174, 24);
            this.cmbTheLoai.TabIndex = 41;
            // 
            // cmbNhaCungCap
            // 
            this.cmbNhaCungCap.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cmbNhaCungCap.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbNhaCungCap.FormattingEnabled = true;
            this.cmbNhaCungCap.Location = new System.Drawing.Point(689, 47);
            this.cmbNhaCungCap.Name = "cmbNhaCungCap";
            this.cmbNhaCungCap.Size = new System.Drawing.Size(142, 24);
            this.cmbNhaCungCap.TabIndex = 41;
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(573, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(95, 16);
            this.label2.TabIndex = 43;
            this.label2.Text = "Nhà Cung Cấp";
            // 
            // grbThongTinMuaHang
            // 
            this.grbThongTinMuaHang.Controls.Add(this.nudSoLuong);
            this.grbThongTinMuaHang.Controls.Add(this.lbDonvitinh);
            this.grbThongTinMuaHang.Controls.Add(this.textBox2);
            this.grbThongTinMuaHang.Controls.Add(this.lbSoLuong);
            this.grbThongTinMuaHang.Controls.Add(this.btnLamMoi);
            this.grbThongTinMuaHang.Controls.Add(this.btnXoaSanPham);
            this.grbThongTinMuaHang.Controls.Add(this.btnThemSanPham);
            this.grbThongTinMuaHang.Controls.Add(this.label2);
            this.grbThongTinMuaHang.Controls.Add(this.btnTimKiemMaSP);
            this.grbThongTinMuaHang.Controls.Add(this.btnThemNCC);
            this.grbThongTinMuaHang.Controls.Add(this.cmbNhaCungCap);
            this.grbThongTinMuaHang.Controls.Add(this.cmbTheLoai);
            this.grbThongTinMuaHang.Controls.Add(this.lbVNĐ);
            this.grbThongTinMuaHang.Controls.Add(this.lbvnd);
            this.grbThongTinMuaHang.Controls.Add(this.txtDongia);
            this.grbThongTinMuaHang.Controls.Add(this.txtThanhTien);
            this.grbThongTinMuaHang.Controls.Add(this.txtTenSanPham);
            this.grbThongTinMuaHang.Controls.Add(this.txtMaSanPham);
            this.grbThongTinMuaHang.Controls.Add(this.lbThanhTien);
            this.grbThongTinMuaHang.Controls.Add(this.lbDongia);
            this.grbThongTinMuaHang.Controls.Add(this.lbTenloaiSP);
            this.grbThongTinMuaHang.Controls.Add(this.lbTenSanPham);
            this.grbThongTinMuaHang.Controls.Add(this.lbMaSanPham);
            this.grbThongTinMuaHang.Controls.Add(this.cmbNhanVien);
            this.grbThongTinMuaHang.Controls.Add(this.lbSoHoaDon);
            this.grbThongTinMuaHang.Controls.Add(this.lbNhanVienLap);
            this.grbThongTinMuaHang.Controls.Add(this.txtMaHoaDon);
            this.grbThongTinMuaHang.Dock = System.Windows.Forms.DockStyle.Top;
            this.grbThongTinMuaHang.Location = new System.Drawing.Point(23, 73);
            this.grbThongTinMuaHang.Name = "grbThongTinMuaHang";
            this.grbThongTinMuaHang.Size = new System.Drawing.Size(1423, 228);
            this.grbThongTinMuaHang.TabIndex = 4;
            this.grbThongTinMuaHang.TabStop = false;
            this.grbThongTinMuaHang.Text = "Thông Tin Nhập Hàng";
            // 
            // nudSoLuong
            // 
            this.nudSoLuong.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.nudSoLuong.Location = new System.Drawing.Point(292, 122);
            this.nudSoLuong.Name = "nudSoLuong";
            this.nudSoLuong.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.nudSoLuong.Size = new System.Drawing.Size(98, 22);
            this.nudSoLuong.TabIndex = 48;
            this.nudSoLuong.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.nudSoLuong.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudSoLuong.ValueChanged += new System.EventHandler(this.nudSoLuong_ValueChanged_1);
            // 
            // lbDonvitinh
            // 
            this.lbDonvitinh.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbDonvitinh.AutoSize = true;
            this.lbDonvitinh.Location = new System.Drawing.Point(396, 124);
            this.lbDonvitinh.Name = "lbDonvitinh";
            this.lbDonvitinh.Size = new System.Drawing.Size(45, 16);
            this.lbDonvitinh.TabIndex = 47;
            this.lbDonvitinh.Text = "Đơn vị";
            // 
            // textBox2
            // 
            this.textBox2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.textBox2.Location = new System.Drawing.Point(456, 121);
            this.textBox2.Name = "textBox2";
            this.textBox2.ReadOnly = true;
            this.textBox2.Size = new System.Drawing.Size(39, 22);
            this.textBox2.TabIndex = 46;
            this.textBox2.Text = "đĩa";
            this.textBox2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lbSoLuong
            // 
            this.lbSoLuong.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbSoLuong.AutoSize = true;
            this.lbSoLuong.Location = new System.Drawing.Point(194, 123);
            this.lbSoLuong.Name = "lbSoLuong";
            this.lbSoLuong.Size = new System.Drawing.Size(65, 16);
            this.lbSoLuong.TabIndex = 45;
            this.lbSoLuong.Text = "Số Lượng";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lstvHoaDon);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(23, 301);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1423, 296);
            this.groupBox1.TabIndex = 6;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Chi Tiết Nhập Hàng";
            // 
            // lstvHoaDon
            // 
            this.lstvHoaDon.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstvHoaDon.HideSelection = false;
            this.lstvHoaDon.Location = new System.Drawing.Point(3, 18);
            this.lstvHoaDon.Name = "lstvHoaDon";
            this.lstvHoaDon.Size = new System.Drawing.Size(1417, 275);
            this.lstvHoaDon.TabIndex = 7;
            this.lstvHoaDon.UseCompatibleStateImageBehavior = false;
            this.lstvHoaDon.View = System.Windows.Forms.View.Details;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.btnThoat);
            this.panel3.Controls.Add(this.btnThanhToan);
            this.panel3.Controls.Add(this.btnHuyHoaDon);
            this.panel3.Controls.Add(this.label5);
            this.panel3.Controls.Add(this.txtTongTien);
            this.panel3.Controls.Add(this.lbTongTien);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel3.Location = new System.Drawing.Point(23, 537);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1423, 60);
            this.panel3.TabIndex = 7;
            // 
            // btnThanhToan
            // 
            this.btnThanhToan.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnThanhToan.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThanhToan.Location = new System.Drawing.Point(809, 12);
            this.btnThanhToan.Name = "btnThanhToan";
            this.btnThanhToan.Size = new System.Drawing.Size(188, 34);
            this.btnThanhToan.TabIndex = 13;
            this.btnThanhToan.Text = "Thanh Toán";
            this.btnThanhToan.UseVisualStyleBackColor = true;
            this.btnThanhToan.Click += new System.EventHandler(this.btnThanhToan_Click);
            // 
            // btnHuyHoaDon
            // 
            this.btnHuyHoaDon.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnHuyHoaDon.Location = new System.Drawing.Point(528, 12);
            this.btnHuyHoaDon.Name = "btnHuyHoaDon";
            this.btnHuyHoaDon.Size = new System.Drawing.Size(188, 34);
            this.btnHuyHoaDon.TabIndex = 12;
            this.btnHuyHoaDon.Text = "Hủy Hóa Đơn";
            this.btnHuyHoaDon.UseVisualStyleBackColor = true;
            this.btnHuyHoaDon.Click += new System.EventHandler(this.btnHuyHoaDon_Click);
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label5.ForeColor = System.Drawing.Color.Red;
            this.label5.Location = new System.Drawing.Point(1369, 20);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(46, 20);
            this.label5.TabIndex = 11;
            this.label5.Text = "VNĐ";
            // 
            // txtTongTien
            // 
            this.txtTongTien.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTongTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTongTien.ForeColor = System.Drawing.Color.Red;
            this.txtTongTien.Location = new System.Drawing.Point(1185, 17);
            this.txtTongTien.Name = "txtTongTien";
            this.txtTongTien.ReadOnly = true;
            this.txtTongTien.Size = new System.Drawing.Size(178, 26);
            this.txtTongTien.TabIndex = 10;
            this.txtTongTien.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // lbTongTien
            // 
            this.lbTongTien.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.lbTongTien.AutoSize = true;
            this.lbTongTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbTongTien.ForeColor = System.Drawing.Color.Red;
            this.lbTongTien.Location = new System.Drawing.Point(1091, 20);
            this.lbTongTien.Name = "lbTongTien";
            this.lbTongTien.Size = new System.Drawing.Size(88, 20);
            this.lbTongTien.TabIndex = 9;
            this.lbTongTien.Text = "Tổng Tiền";
            // 
            // timerDongHo
            // 
            this.timerDongHo.Tick += new System.EventHandler(this.timerDongHo_Tick);
            // 
            // btnLamMoi
            // 
            this.btnLamMoi.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnLamMoi.Image = global::QuanLyBanDia.Properties.Resources.làm_mới_2;
            this.btnLamMoi.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnLamMoi.Location = new System.Drawing.Point(881, 178);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(144, 34);
            this.btnLamMoi.TabIndex = 44;
            this.btnLamMoi.Text = "         Làm mới";
            this.btnLamMoi.UseVisualStyleBackColor = true;
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // btnXoaSanPham
            // 
            this.btnXoaSanPham.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnXoaSanPham.Image = global::QuanLyBanDia.Properties.Resources.xoá_4;
            this.btnXoaSanPham.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnXoaSanPham.Location = new System.Drawing.Point(655, 178);
            this.btnXoaSanPham.Name = "btnXoaSanPham";
            this.btnXoaSanPham.Size = new System.Drawing.Size(144, 34);
            this.btnXoaSanPham.TabIndex = 44;
            this.btnXoaSanPham.Text = "    Xoá";
            this.btnXoaSanPham.UseVisualStyleBackColor = true;
            this.btnXoaSanPham.Click += new System.EventHandler(this.btnXoaSanPham_Click);
            // 
            // btnThemSanPham
            // 
            this.btnThemSanPham.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btnThemSanPham.Image = global::QuanLyBanDia.Properties.Resources.thêm4;
            this.btnThemSanPham.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnThemSanPham.Location = new System.Drawing.Point(417, 178);
            this.btnThemSanPham.Name = "btnThemSanPham";
            this.btnThemSanPham.Size = new System.Drawing.Size(144, 34);
            this.btnThemSanPham.TabIndex = 44;
            this.btnThemSanPham.Text = "    Thêm";
            this.btnThemSanPham.UseVisualStyleBackColor = true;
            this.btnThemSanPham.Click += new System.EventHandler(this.btnThemSanPham_Click);
            // 
            // btnTimKiemMaSP
            // 
            this.btnTimKiemMaSP.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnTimKiemMaSP.BackColor = System.Drawing.Color.White;
            this.btnTimKiemMaSP.Image = global::QuanLyBanDia.Properties.Resources.search;
            this.btnTimKiemMaSP.Location = new System.Drawing.Point(456, 85);
            this.btnTimKiemMaSP.Name = "btnTimKiemMaSP";
            this.btnTimKiemMaSP.Size = new System.Drawing.Size(39, 24);
            this.btnTimKiemMaSP.TabIndex = 42;
            this.btnTimKiemMaSP.UseVisualStyleBackColor = false;
            // 
            // btnThemNCC
            // 
            this.btnThemNCC.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnThemNCC.BackColor = System.Drawing.Color.White;
            this.btnThemNCC.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btnThemNCC.Image = global::QuanLyBanDia.Properties.Resources.thêm_1;
            this.btnThemNCC.Location = new System.Drawing.Point(837, 47);
            this.btnThemNCC.Name = "btnThemNCC";
            this.btnThemNCC.Size = new System.Drawing.Size(39, 24);
            this.btnThemNCC.TabIndex = 42;
            this.btnThemNCC.UseVisualStyleBackColor = false;
            this.btnThemNCC.Click += new System.EventHandler(this.btnThemNCC_Click);
            // 
            // btnThoat
            // 
            this.btnThoat.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnThoat.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnThoat.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.ForeColor = System.Drawing.Color.Gray;
            this.btnThoat.Image = global::QuanLyBanDia.Properties.Resources.exit;
            this.btnThoat.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnThoat.Location = new System.Drawing.Point(19, 10);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(115, 40);
            this.btnThoat.TabIndex = 14;
            this.btnThoat.Text = "   Thoát";
            this.btnThoat.UseVisualStyleBackColor = false;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // frmNhapHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1469, 597);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.grbThongTinMuaHang);
            this.Controls.Add(this.flowLayoutPanel1);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmNhapHang";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Nhập hàng";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmNhapHang_FormClosing);
            this.Load += new System.EventHandler(this.frmNhapHang_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel10.ResumeLayout(false);
            this.grbThongTinMuaHang.ResumeLayout(false);
            this.grbThongTinMuaHang.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudSoLuong)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel10;
        private System.Windows.Forms.Label lbDate;
        private System.Windows.Forms.Label lbTimer;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.TextBox txtMaHoaDon;
        private System.Windows.Forms.Label lbNhanVienLap;
        private System.Windows.Forms.Label lbSoHoaDon;
        private System.Windows.Forms.ComboBox cmbNhanVien;
        private System.Windows.Forms.Label lbMaSanPham;
        private System.Windows.Forms.Label lbTenSanPham;
        private System.Windows.Forms.Label lbTenloaiSP;
        private System.Windows.Forms.Label lbDongia;
        private System.Windows.Forms.Label lbThanhTien;
        private System.Windows.Forms.TextBox txtMaSanPham;
        private System.Windows.Forms.TextBox txtTenSanPham;
        private System.Windows.Forms.TextBox txtThanhTien;
        private System.Windows.Forms.TextBox txtDongia;
        private System.Windows.Forms.Label lbvnd;
        private System.Windows.Forms.Label lbVNĐ;
        private System.Windows.Forms.ComboBox cmbTheLoai;
        private System.Windows.Forms.ComboBox cmbNhaCungCap;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox grbThongTinMuaHang;
        private System.Windows.Forms.Button btnThemNCC;
        private System.Windows.Forms.Button btnTimKiemMaSP;
        private System.Windows.Forms.Button btnLamMoi;
        private System.Windows.Forms.Button btnXoaSanPham;
        private System.Windows.Forms.Button btnThemSanPham;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ListView lstvHoaDon;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btnThanhToan;
        private System.Windows.Forms.Button btnHuyHoaDon;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtTongTien;
        private System.Windows.Forms.Label lbTongTien;
        private System.Windows.Forms.Timer timerDongHo;
        private System.Windows.Forms.NumericUpDown nudSoLuong;
        private System.Windows.Forms.Label lbDonvitinh;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label lbSoLuong;
        private System.Windows.Forms.Button btnThoat;
    }
}