using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyWebNhacCu
{
    public partial class FormGioHang : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgiohang();
        }

        protected void btn_thanhtoan_Click(object sender, EventArgs e)
        {
            string masp = ((LinkButton)sender).CommandArgument;
            Response.Redirect("FormThanhToan.aspx?masp="+masp);
        }

        protected void btn_dong_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string matk = Session["UserName"] + "";
            string masp = ((Button)sender).CommandArgument;
            string sql = "delete from GioHang where MaSP='" + masp + "' and UserName ='" + matk + "'";
            int ketqua = ketnoi.ExecNonQuery(sql);
            if (ketqua > 0)
            {
                
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa sản phẩm khỏi giỏ hàng thành công');", true);
                loadgiohang();  
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa sản phẩm khỏi giỏ hàng không thành công');", true);
            }
        }
        private void loadgiohang()
        {
            string matk = Session["UserName"] + "";
            if (matk != "")
            {
                string sql;
                sql = "select SanPham.MaSP, SanPham.TenSP, SanPham.HinhAnh, GioHang.SoLuongMua, SanPham.DonGia ,(SanPham.DonGia * GioHang.SoLuongMua)AS TongTien  from SanPham, GioHang where GioHang.MaSP = SanPham.MaSP and UserName = '" + matk + "'";

                DataTable dt = ketnoi.ReadData(sql);

                dl_giohang.DataSource = dt;
                dl_giohang.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormLogin.aspx';", true);
            }
        }

        protected void btn_lichsu_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormLichSuMuaHang.aspx");
        }
    }
}