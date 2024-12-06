﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class AdminHome : System.Web.UI.MasterPage
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            // Kiểm tra xem người dùng đã đăng nhập chưa
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                btnlogin.Text = "Logout"; // Đã đăng nhập
            }
            else
            {
                btnlogin.Text = "Login"; // Chưa đăng nhập
            }
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            //Response.Redirect("FormLogin.aspx");
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                // Nếu đã đăng nhập, thực hiện đăng xuất
                Session["IsLoggedIn"] = false;
                Session["UserName"] = null;
                btnlogin.Text = "Login"; // Đổi lại thành Login
                Response.Redirect("FormLogin.aspx");
            }
            else
            {
                // Chuyển hướng đến trang đăng nhập
                Response.Redirect("FormLogin.aspx");
            }


        }


    }
}