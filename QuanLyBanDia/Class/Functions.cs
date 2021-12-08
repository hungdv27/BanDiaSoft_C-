using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QuanLyBanDia.Class
{
    class Functions
    {
        public static SqlConnection sqlConnection;  //Khai báo đối tượng kết nối        
        public static String stringConnection = ConnectSQL.stringConn;

        public static void Connect()
        {
            sqlConnection = new SqlConnection();//Khởi tạo đối tượng
            sqlConnection.ConnectionString = stringConnection;
            sqlConnection.Open();//Mở kết nối
            //Kiểm tra kết nối
            if (sqlConnection.State != ConnectionState.Open)
                MessageBox.Show("Không thể kết nối với dữ liệu");
        }
        public static void Disconnect()
        {
            if (sqlConnection != null && sqlConnection.State == ConnectionState.Open)
            {
                sqlConnection.Close();   	//Đóng kết nối
                sqlConnection.Dispose(); 	//Giải phóng tài nguyên
                sqlConnection = null;
            }
        }
        public static DataTable GetDataTotable(string sql)
        {
            DataTable dtBang = new DataTable();
            Connect();
            SqlDataAdapter sqldataAdapte = new SqlDataAdapter(sql, sqlConnection);
            sqldataAdapte.Fill(dtBang);
            Disconnect();
            return dtBang;
        }
        public static void CapNhatDuLieu(string sql)
        {
            Connect();
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlConnection;
            sqlcommand.CommandText = sql;
            sqlcommand.ExecuteNonQuery();
            Disconnect();
        }
        public static void FillCombo(string sql, ComboBox cbo, string ma, string ten)
        {
            Connect();
            SqlDataAdapter dap = new SqlDataAdapter(sql, sqlConnection);
            DataTable table = new DataTable();
            dap.Fill(table);
            cbo.DataSource = table;
            cbo.ValueMember = ma; //Trường giá trị
            cbo.DisplayMember = ten; //Trường hiển thị
            Disconnect();
        }
        public static string GetFieldValues(string sql)
        {
            Connect();
            string ma = "";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, sqlConnection);
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                    ma = reader.GetValue(0).ToString();
                reader.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
            Disconnect();
            return ma;
        }
        public static string GetLastIdTable(string tenBang, string tenCot)
        {
            Connect();
            string id = "";
            string sql = "Select Top 1 " + tenCot + " From " + tenBang + " order by " + tenCot + " desc;";
            try
            {
                SqlCommand sqlCommand = new SqlCommand(sql, sqlConnection);
                sqlCommand.CommandType = CommandType.Text;

                id = (string)sqlCommand.ExecuteScalar();
            }
            catch (Exception e)
            {
                MessageBox.Show("Lỗi lấy ID." + e.Message, "Lỗi");
            }
            return id;
        }

    }
}
