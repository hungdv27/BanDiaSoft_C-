
namespace QuanLyBanDia
{
    partial class Form1
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
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.QUANLIBANDIADataSet3 = new QuanLyBanDia.QUANLIBANDIADataSet3();
            this.NhaCungCapBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.NhaCungCapTableAdapter = new QuanLyBanDia.QUANLIBANDIADataSet3TableAdapters.NhaCungCapTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.QUANLIBANDIADataSet3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NhaCungCapBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            reportDataSource1.Name = "DataSet3";
            reportDataSource1.Value = this.NhaCungCapBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "QuanLyBanDia.rptNCC.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(12, 12);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(944, 450);
            this.reportViewer1.TabIndex = 0;
            // 
            // QUANLIBANDIADataSet3
            // 
            this.QUANLIBANDIADataSet3.DataSetName = "QUANLIBANDIADataSet3";
            this.QUANLIBANDIADataSet3.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // NhaCungCapBindingSource
            // 
            this.NhaCungCapBindingSource.DataMember = "NhaCungCap";
            this.NhaCungCapBindingSource.DataSource = this.QUANLIBANDIADataSet3;
            // 
            // NhaCungCapTableAdapter
            // 
            this.NhaCungCapTableAdapter.ClearBeforeFill = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1130, 545);
            this.Controls.Add(this.reportViewer1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.QUANLIBANDIADataSet3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NhaCungCapBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource NhaCungCapBindingSource;
        private QUANLIBANDIADataSet3 QUANLIBANDIADataSet3;
        private QUANLIBANDIADataSet3TableAdapters.NhaCungCapTableAdapter NhaCungCapTableAdapter;
    }
}

