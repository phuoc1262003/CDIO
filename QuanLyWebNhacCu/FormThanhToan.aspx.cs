using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace QuanLyWebNhacCu
{
    public partial class FormThanhToan : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadthanhtoan();
           
        }
        private void loadthanhtoan()
        {
            string masp = Request.QueryString["masp"] + "";
            string username = Session["UserName"] + "";
            if (username != "")
            {
                string sql = "SELECT SanPham.MaSP, SanPham.TenSP, GioHang.SoLuongMua, SanPham.DonGia, (SanPham.DonGia * GioHang.SoLuongMua) AS TongTien " +
                             "FROM SanPham, GioHang " +
                             "WHERE GioHang.MaSP = SanPham.MaSP AND UserName = '" + username + "' AND SanPham.MaSP = '" + masp + "'";
                DataTable dt = ketnoi.ReadData(sql);
                if (dt != null && dt.Rows.Count > 0)
                {
                    dl_thanhtoan.DataSource = dt;
                    dl_thanhtoan.DataBind();
                    // Gán ngày hiện tại cho lb_ngaydathang
                    foreach (DataListItem item in dl_thanhtoan.Items)
                    {
                        Label lb_ngaydathang = (Label)item.FindControl("lb_ngaydathang");
                        if (lb_ngaydathang != null)
                        {
                            lb_ngaydathang.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        }
                    }


                }
                else
                {
                    Response.Write("<script>alert('Không có dữ liệu để hiển thị!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Bạn chưa đăng nhập!'); window.location='FormLogin.aspx';</script>");
            }
        }

        protected void btn_dathang_Click(object sender, EventArgs e)
        {
            
            string matk = Session["UserName"] + "";
            if (matk != "")
            {
                string masp = ((Button)sender).CommandArgument;
                Button btgiohang = (Button)sender;
                DataListItem item = (DataListItem)btgiohang.Parent;
                string soluong = ((Label)item.FindControl("lb_soluong")).Text;
                string ngaymua = ((Label)item.FindControl("lb_ngaydathang")).Text;
                //string ngaymua; //= DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                //DateTime ngaymua = DateTime.Now;

                // Kiểm tra biến số lượng, int.TryParse để kiểm tra txt là một số nguyên và kiểm tra số lượng phải lớn hơn 0 
                if (int.TryParse(soluong, out int soLuongMua) && soLuongMua > 0)
                {
                    // Kiểm tra số lượng sản phẩm có trong kho
                    string sqlKiemTT = "SELECT SoLuongSP FROM SanPham WHERE MaSP ='" + masp + "'";
                    DataTable dtSanPham = ketnoi.ReadData(sqlKiemTT);
                    if (dtSanPham != null && dtSanPham.Rows.Count > 0)
                    {
                        //
                        int soLuongCoTrongKho = Convert.ToInt32(dtSanPham.Rows[0]["SoLuongSP"]);

                        // Kiểm tra xem số lượng sản phẩm trong kho có lớn hơn 0 không và số lượng mua có lớn hơn số lượng trong kho không thì mới được mua
                        if (soLuongCoTrongKho > 0)
                        {
                            if (soLuongMua <= soLuongCoTrongKho)
                            {

                                ////Thêm mới vào đơn hàng
                                string trangthai = "Chờ phê duyệt";

                                string sqlThem = "INSERT INTO DonHang (UserName, MaSP, NgDatHang, SoLuongSPM, TrangThai) " +
                                                 "VALUES ('" + matk + "','" + masp + "','" + ngaymua + "','" + soLuongMua + "', N'" + trangthai + "')";

                                int ketqua = ketnoi.ExecNonQuery(sqlThem);
                                if (ketqua > 0)
                                {
                                    // Cập nhật số lượng sản phẩm trong kho
                                    string sqlCapNhatSL = "UPDATE SanPham SET SoLuongSP = SoLuongSP - '" + soLuongMua + "' WHERE MaSP = '" + masp + "'";
                                    ketnoi.ExecNonQuery(sqlCapNhatSL);
                                    string sqlXoaGH = "delete from GioHang where MaSP='" + masp + "' and UserName ='" + matk + "'";
                                    ketnoi.ExecNonQuery(sqlXoaGH);
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đặt hàng thành công'); window.location='FormLichSuMuaHang.aspx';", true);
                                }
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Số lượng mua vượt quá số lượng sản phẩm có trong kho');", true);
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sản phẩm đã hết hàng');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sản phẩm không tồn tại trong kho.');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Số lượng không hợp lệ!');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để thêm hàng vào giỏ.'); window.location='FormLogin.aspx';", true);
            }
        }
    }
}