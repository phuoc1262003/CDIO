using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyWebNhacCu
{
    public partial class FormLogin : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string username = Login1.UserName;
            string password = Login1.Password;
            string sql = "select * from TaiKhoan where UserName='" + username + "' and MatKhau= '" + password + "'";
            DataTable dt = ketnoi.ReadData(sql);
            if(dt.Rows.Count > 0)
            {
                Session["UserName"] = username;
                // Đặt cờ IsLoggedIn thành true khi đăng nhập thành công
                Session["IsLoggedIn"] = true;
                int idQuyen = Convert.ToInt32(dt.Rows[0]["IDQuyen"]);
                if (idQuyen == 111)
                {
                    Response.Redirect("FormAdmin.aspx");
                }
                
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Login1.FailureText = "Sai tên đăng nhập hoặc mật khẩu";
            }

        }

        protected void bntdangky_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormDangKi.aspx");
        }
    }
}