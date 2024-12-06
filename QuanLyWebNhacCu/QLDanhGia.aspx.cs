using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class QLDanhGia : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddanhgia();
        }
        private void loaddanhgia()
        {
            string sql = "select DanhGia.MaDG, TaiKhoan.UserName, TenKH, SanPham.MaSP, SanPham.TenSP, SanPham.HinhAnh, DanhGia.DanhGia  from DanhGia, TaiKhoan, KhachHang, SanPham where TaiKhoan.UserName = KhachHang.UserName and TaiKhoan.UserName = DanhGia.UserName and DanhGia.MaSP = SanPham.MaSP";
            grid_taikhoan.DataSource = ketnoi.ReadData(sql);
            grid_taikhoan.DataBind();
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string madg = ((Button)sender).CommandArgument;
            string sql;
            sql = "delete from DanhGia where MaDG=" + madg + "";
            int ketqua = ketnoi.ExecNonQuery(sql);
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa đánh giá thành công');", true);
                loaddanhgia();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa đánh giá không thành công');", true);
            }
        }
    }
}