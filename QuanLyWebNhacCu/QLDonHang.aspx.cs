using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class QLDonHang : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddonhang();
        }
        private void loaddonhang()
        {
            string sql;
            sql = "select DonHang.MaDH, DonHang.MaSP, KhachHang.UserName, KhachHang.TenKH, KhachHang.SoDT, KhachHang.DiaChi, NgDatHang, SoLuongSPM, TrangThai, SanPham.TenSP, SanPham.DonGia, SanPham.HinhAnh, (DonGia*SoLuongSPM) as TongTien  from DonHang, SanPham, KhachHang where DonHang.MaSP = SanPham.MaSP and DonHang.UserName = KhachHang.UserName";
            grid_sanpham.DataSource = ketnoi.ReadData(sql);
            grid_sanpham.DataBind();
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string madh = ((Button)sender).CommandArgument;
            string sql;
            sql = "delete from DonHang where MaDH=" + madh + "";
            int ketqua = ketnoi.ExecNonQuery(sql);
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa đánh đơn hàng này thành công');", true);
                loaddonhang();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa đánh thất bại');", true);
            }
        }

        

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string madh = ((Button)sender).CommandArgument;
            Button btnsua = ((Button)sender);
            GridViewRow item = (GridViewRow)btnsua.Parent.Parent;
            string SDT = ((TextBox)item.FindControl("txt_sdt")).Text;
            string Diachi = ((TextBox)item.FindControl("txt_diachi")).Text;
            string sql;
            sql = "update DonHang Set SoDT='" + SDT + "', DiaChi=N'" + Diachi + "'where MaDH=" + madh + " ";
            int ketqua = ketnoi.ExecNonQuery(sql);
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sửa thông tin thành công');", true);
                loaddonhang();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sửa thông tin thất bại');", true);
            }
        }

        protected void btn_capnhat_Click(object sender, EventArgs e)
        {
            
            string madh = ((Button)sender).CommandArgument;

            
            Button btnCapNhat = (Button)sender;
            GridViewRow item = (GridViewRow)btnCapNhat.Parent.Parent;

            // Lấy giá trị trạng thái mới từ DropDownList
            DropDownList ddlTrangThai = (DropDownList)item.FindControl("DropDownList1");
            string trangThaiMoi = ddlTrangThai.SelectedValue;

            // Câu lệnh SQL để cập nhật trường TrangThai
            string sql = "UPDATE DonHang SET TrangThai = N'" + trangThaiMoi + "' WHERE MaDH = " + madh + " ";

            // Thực thi câu lệnh SQL
            int ketqua = ketnoi.ExecNonQuery(sql);

            // Kiểm tra kết quả và thông báo cho người dùng
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật trạng thái thành công');", true);
                loaddonhang(); 
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật trạng thái thất bại');", true);
            }
        }
    }
}