using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyWebNhacCu
{
    public partial class CustomerHome : System.Web.UI.MasterPage
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
            }
            else
            {
                // Chuyển hướng đến trang đăng nhập
                Response.Redirect("FormLogin.aspx");
            }


        }

        protected void bnttaikhoan_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("FormThongTinKH.aspx");
        }

        protected void btngiohang_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormGioHang.aspx");
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string searchText = txttimkiem.Text.Trim().ToUpper();
            if (string.IsNullOrEmpty(searchText))
            {
                
                return;

            }

            string sqlmaSP = "SELECT * FROM SanPham WHERE MaSP ='" + searchText + "'";
            DataTable dtmaSP = ketnoi.ReadData(sqlmaSP);

            if (dtmaSP != null && dtmaSP.Rows.Count == 1)
            {

                Response.Redirect("FormSanPham.aspx?masp=" + searchText);
                return;
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy sản phẩm nào');", true);
            }
            string sqlTenSP = "SELECT * FROM SanPham WHERE TenSP Like '%" + searchText + "%'";
            DataTable dtTenSP = ketnoi.ReadData(sqlTenSP);

            if (dtTenSP != null && dtTenSP.Rows.Count > 0)
            {
                
                Response.Redirect("FormSanPham.aspx?tensp=" + searchText);
                return;
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy sản phẩm nào');", true);
            }
        }
    }
}