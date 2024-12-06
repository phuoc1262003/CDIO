using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyWebNhacCu
{
    public partial class FormChiTietSanPham : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string masp = Request.QueryString["masp"] + "";
            string sql;
            if( masp != "")
            {
                sql = "select * from SanPham where MaSP= '"+masp+"' ";
                dl_chitietsanpham.DataSource = ketnoi.ReadData(sql);
                dl_chitietsanpham.DataBind();
            }
            LoadDanhGia();
        }

        protected void btn_giam_Click(object sender, EventArgs e)
        {
            // Lấy đối tượng Button đã được nhấn
            Button btnGiam = (Button)sender;

            // Lấy DataListItem chứa Button này
            DataListItem item = (DataListItem)btnGiam.NamingContainer;

            // Tìm Label trong DataListItem đó
            TextBox lbSoLuongMua = (TextBox)item.FindControl("txt_soluongmua");

            // Lấy số lượng hiện tại từ textbox và giảm nếu lớn hơn 1
            int soLuong = int.Parse(lbSoLuongMua.Text);
            if (soLuong > 1)
            {
                soLuong--;
            }

            // Cập nhật lại số lượng trong Label
            lbSoLuongMua.Text = soLuong.ToString();
        }

        protected void btn_tang_Click(object sender, EventArgs e)
        {
            // Lấy đối tượng Button đã được nhấn
            Button btnTang = (Button)sender;

            // Lấy DataListItem chứa Button này
            DataListItem item = (DataListItem)btnTang.NamingContainer;

            // Tìm Label trong DataListItem đó
            TextBox lbSoLuongMua = (TextBox)item.FindControl("txt_soluongmua");

            // Lấy số lượng hiện tại từ Label và tăng
            int soLuong = int.Parse(lbSoLuongMua.Text);
            soLuong++;

            // Cập nhật lại số lượng trong Label
            lbSoLuongMua.Text = soLuong.ToString();
        }
        // phương thức đọc đánh giá
        private void LoadDanhGia()
        {
            string masp = Request.QueryString["masp"] + "";
            string sql;
            sql = "select KhachHang.TenKH, DanhGia from TaiKhoan, KhachHang, DanhGia  Where KhachHang.UserName = TaiKhoan.UserName and TaiKhoan.Username = DanhGia.UserName and DanhGia.MaSP='"+masp+"' ";
            dl_danhgia.DataSource = ketnoi.ReadData(sql);
            dl_danhgia.DataBind();
        }

        protected void btn_danhgia_Click(object sender, EventArgs e)
        {
            string masp = ((LinkButton)sender).CommandArgument;
            

            string matk = Session["username"] + "";
            
            string sqlKiemTra = "SELECT * FROM DonHang WHERE UserName = '" + matk + "' AND MaSP = '" + masp + "' ";
            DataTable dt = ketnoi.ReadData(sqlKiemTra);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("FormDanhGia.aspx?MaSP=" + masp);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn không thể đánh giá vì bạn chưa từng mua sản phẩm này');", true);
            }
        }

        protected void btnThemGioHang_Click(object sender, EventArgs e)
        {
            string matk = Session["UserName"] + "";
            if (matk != "")
            {
                string masp = ((LinkButton)sender).CommandArgument;
                LinkButton btgiohang = (LinkButton)sender;
                DataListItem item = (DataListItem)btgiohang.Parent;
                string soluong = ((TextBox)item.FindControl("txt_soluongmua")).Text;

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
                                string sqlKiemTra = "SELECT * FROM GioHang WHERE UserName = '" + matk + "' AND MaSP = '" + masp + "'";
                                DataTable dt = ketnoi.ReadData(sqlKiemTra);
                                if (dt.Rows.Count > 0)
                                {
                                    // Cập nhật số lượng mua
                                    string sqlUp = "UPDATE GioHang SET SoLuongMua = " + soLuongMua + " WHERE UserName = '" + matk + "' AND MaSP = '" + masp + "'";
                                    int ketqua = ketnoi.ExecNonQuery(sqlUp);
                                    if (ketqua > 0)
                                    {
                                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật số lượng sản phẩm thành công');", true);
                                    }
                                    else
                                    {
                                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật số lượng sản phẩm không thành công');", true);
                                    }
                                }
                                else
                                {
                                    // Thêm mới vào giỏ hàng
                                    string sqlThem = "INSERT INTO GioHang (UserName, MaSP, SoLuongMua) VALUES ('" + matk + "','" + masp + "'," + soLuongMua + ")";
                                    int ketqua = ketnoi.ExecNonQuery(sqlThem);
                                    if (ketqua > 0)
                                    {
                                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm vào giỏ hàng thành công');", true);
                                    }
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

        protected void btnMuaNgay_Click(object sender, EventArgs e)
        {
            string matk = Session["UserName"] + "";
            if (matk != "")
            {
                string masp = ((LinkButton)sender).CommandArgument;
                LinkButton btgiohang = (LinkButton)sender;
                DataListItem item = (DataListItem)btgiohang.Parent;
                string soluong = ((TextBox)item.FindControl("txt_soluongmua")).Text;

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
                                //string trangthai = "Chờ phê duyệt";
                                //string ngaymua = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                                //string sqlThem = "INSERT INTO DonHang (UserName, MaSP, NgDatHang, SoLuongSPM, TrangThai) " +
                                //                 "VALUES ('" + matk + "','" + masp + "','" + ngaymua + "'," + soLuongMua + ", N'" + trangthai + "')";
                                // thêm mới vào giỏ hàng
                                string sqlthem = "insert into giohang (username, masp, soluongmua) values ('" + matk + "','" + masp + "'," + soLuongMua + ")";
                                int ketqua = ketnoi.ExecNonQuery(sqlthem);
                                if (ketqua > 0)
                                {  
                                    Response.Redirect("FormThanhToan.aspx?masp=" + masp);
                                    
                                }
                                //}
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