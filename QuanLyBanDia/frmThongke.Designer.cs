
namespace QuanLyBanDia
{
    partial class frmThongke
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
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rdbNCC = new System.Windows.Forms.RadioButton();
            this.rdbKhachHang = new System.Windows.Forms.RadioButton();
            this.rdbNhapHang = new System.Windows.Forms.RadioButton();
            this.rdbSanPham = new System.Windows.Forms.RadioButton();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btnThoat = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.button1.BackColor = System.Drawing.Color.Salmon;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.Black;
            this.button1.Location = new System.Drawing.Point(481, 662);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(165, 49);
            this.button1.TabIndex = 3;
            this.button1.Text = "Xuất báo cáo";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.groupBox1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.groupBox1.Controls.Add(this.rdbNCC);
            this.groupBox1.Controls.Add(this.rdbKhachHang);
            this.groupBox1.Controls.Add(this.rdbNhapHang);
            this.groupBox1.Controls.Add(this.rdbSanPham);
            this.groupBox1.Location = new System.Drawing.Point(207, 177);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(752, 439);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Lựa chọn xuất báo cáo";
            // 
            // rdbNCC
            // 
            this.rdbNCC.AutoSize = true;
            this.rdbNCC.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdbNCC.Location = new System.Drawing.Point(65, 361);
            this.rdbNCC.Name = "rdbNCC";
            this.rdbNCC.Size = new System.Drawing.Size(612, 28);
            this.rdbNCC.TabIndex = 1;
            this.rdbNCC.TabStop = true;
            this.rdbNCC.Text = "Báo cáo danh sách 5 NCC giao nhiều hàng nhất theo năm chọn trước";
            this.rdbNCC.UseVisualStyleBackColor = true;
            // 
            // rdbKhachHang
            // 
            this.rdbKhachHang.AutoSize = true;
            this.rdbKhachHang.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdbKhachHang.Location = new System.Drawing.Point(65, 264);
            this.rdbKhachHang.Name = "rdbKhachHang";
            this.rdbKhachHang.Size = new System.Drawing.Size(622, 28);
            this.rdbKhachHang.TabIndex = 2;
            this.rdbKhachHang.TabStop = true;
            this.rdbKhachHang.Text = "Báo cáo danh sách hoá đơn và tổng tiền mua hàng từ một khách hàng ";
            this.rdbKhachHang.UseVisualStyleBackColor = true;
            // 
            // rdbNhapHang
            // 
            this.rdbNhapHang.AutoSize = true;
            this.rdbNhapHang.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdbNhapHang.Location = new System.Drawing.Point(65, 157);
            this.rdbNhapHang.Name = "rdbNhapHang";
            this.rdbNhapHang.Size = new System.Drawing.Size(557, 28);
            this.rdbNhapHang.TabIndex = 3;
            this.rdbNhapHang.TabStop = true;
            this.rdbNhapHang.Text = "Báo cáo danh sách hoá đơn và tổng tiền nhập hàng theo tháng";
            this.rdbNhapHang.UseVisualStyleBackColor = true;
            // 
            // rdbSanPham
            // 
            this.rdbSanPham.AutoSize = true;
            this.rdbSanPham.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rdbSanPham.Location = new System.Drawing.Point(65, 50);
            this.rdbSanPham.Name = "rdbSanPham";
            this.rdbSanPham.Size = new System.Drawing.Size(540, 28);
            this.rdbSanPham.TabIndex = 4;
            this.rdbSanPham.TabStop = true;
            this.rdbSanPham.Text = "Báo cáo danh sách các sản phẩm không bán được  theo quý";
            this.rdbSanPham.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(117)))), ((int)(((byte)(214)))));
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1137, 107);
            this.panel1.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.Image = global::QuanLyBanDia.Properties.Resources.logo_2;
            this.label4.Location = new System.Drawing.Point(30, 7);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(96, 75);
            this.label4.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Open Sans", 27.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(419, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(336, 51);
            this.label2.TabIndex = 1;
            this.label2.Text = "Quản lý thống kê";
            // 
            // btnThoat
            // 
            this.btnThoat.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnThoat.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnThoat.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.ForeColor = System.Drawing.Color.Black;
            this.btnThoat.Image = global::QuanLyBanDia.Properties.Resources.exit;
            this.btnThoat.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnThoat.Location = new System.Drawing.Point(1009, 662);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(115, 52);
            this.btnThoat.TabIndex = 6;
            this.btnThoat.Text = "   Thoát";
            this.btnThoat.UseVisualStyleBackColor = false;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // frmThongke
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(1137, 732);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmThongke";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thống kê";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmThongke_FormClosing);
            this.Load += new System.EventHandler(this.Form2_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rdbNCC;
        private System.Windows.Forms.RadioButton rdbKhachHang;
        private System.Windows.Forms.RadioButton rdbNhapHang;
        private System.Windows.Forms.RadioButton rdbSanPham;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnThoat;
    }
}