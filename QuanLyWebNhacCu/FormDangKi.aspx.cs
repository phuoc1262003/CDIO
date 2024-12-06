using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class FormDangKi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormLogin.aspx");
        }

        protected void btndk_sdt_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormDkSDT.aspx");
        }

        protected void btndk_email_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormDkEmail.aspx");
        }

        protected void btnTiepTuc_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormDkUserName.aspx");
        }
    }
}