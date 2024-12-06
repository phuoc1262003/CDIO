using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyWebNhacCu
{
    public partial class FormLichSuMuaHang : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadlichsu();
        }
        private void loadlichsu()
        {
            string username = Session["UserName"] + "";
            string sql;
            if(username != "")
            {
                sql = "select DonHang.MaDH, DonHang.MaSP, KhachHang.UserName, KhachHang.TenKH, KhachHang.SoDT, KhachHang.DiaChi, NgDatHang, SoLuongSPM, TrangThai, SanPham.TenSP, SanPham.DonGia, SanPham.HinhAnh, (DonGia*SoLuongSPM) as TongTien  from DonHang, SanPham, KhachHang where DonHang.MaSP = SanPham.MaSP and DonHang.UserName = KhachHang.UserName and KhachHang.UserName ='" + username + "'";
                grid_sanpham.DataSource = ketnoi.ReadData(sql);
                grid_sanpham.DataBind();
            }
            
        }

        protected void btn_dong_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormGioHang.aspx");
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string matk = Session["UserName"] + "";
            string xoa = ((Button)sender).CommandArgument;
            Button btnxoa = ((Button)sender);
            GridViewRow item = (GridViewRow)btnxoa.Parent.Parent;

            //string sql = "delete from DonHang where MaSP='" + xoa + "' and UserName ='" + matk + "' and TrangThai ='Chờ phê duyệt'";
            //int ketqua = ketnoi.ExecNonQuery(sql);
            //if (ketqua > 0)
            //{

            //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa sản phẩm khỏi giỏ hàng thành công');", true);
            //    loadlichsu();
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa sản phẩm khỏi giỏ hàng không thành công');", true);
            //}
            // Kiểm tra trạng thái
            string sqlTrangThai = "SELECT TrangThai, SoLuongSPM FROM DonHang WHERE MaSP='" + xoa + "' AND UserName='" + matk + "'";
            DataTable dt = ketnoi.ReadData(sqlTrangThai);

            //// Kiểm tra xem có kết quả không
            //if (dt.Rows.Count == 0)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy đơn hàng để xóa.');", true);
            //    return; // Thoát nếu không có đơn hàng
            //}

            string trangThai = dt.Rows[0]["TrangThai"].ToString();
            int soLuongMua = Convert.ToInt32(dt.Rows[0]["SoLuongSPM"]);
            // Nếu trạng thái là "Chờ phê duyệt" thì cho phép xóa
            if (trangThai == "Chờ phê duyệt")
            {
                // Tăng lại số lượng sản phẩm trong kho
                string sqlCapNhatSL = "UPDATE SanPham SET SoLuongSP = SoLuongSP + " + soLuongMua + " WHERE MaSP = '" + xoa + "'";
                int ketqua1 = ketnoi.ExecNonQuery(sqlCapNhatSL);

                string sql = "DELETE FROM DonHang WHERE MaSP='" + xoa + "' AND UserName='" + matk + "' AND TrangThai=N'Chờ phê duyệt'";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0 && ketqua1 >0)
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Hủy đơn hàng thành công');", true);
                    loadlichsu(); 
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Hủy đơn hàng thất bại');", true);
                }
            }
            else
            {
                
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sản phẩm đang trên đường giao bạn không thể hủy đơn!');", true);
            }
        }
    }
}