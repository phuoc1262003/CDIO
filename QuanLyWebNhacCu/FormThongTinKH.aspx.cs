using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class FormThongTinKH : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadthongtin();
           
            
        }

        private void loadthongtin()
        {
            string matk = Session["UserName"] + "";

            if (matk != "")
            {
                int idquyen = 999;
                string sql;
                sql = "select TaiKhoan.UserName, TaiKhoan.MatKhau, TenKH, SoDT, Email, DiaChi from TaiKhoan, KhachHang where TaiKhoan.UserName = KhachHang.UserName and TaiKhoan.UserName ='" + matk + "' and TaiKhoan.IDQuyen=" + idquyen + "";

                dl_infokhachhang.DataSource = ketnoi.ReadData(sql);
                dl_infokhachhang.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormLogin.aspx';", true);
            }
        }

        protected void btn_capnhat_Click(object sender, EventArgs e)
        {
            string username = ((Button)sender).CommandArgument;
            Button btnsua = ((Button)sender);
            DataListItem item = (DataListItem)btnsua.Parent;
            string matkhau = ((TextBox)item.FindControl("txt_matkhau")).Text;
            string hoten = ((TextBox)item.FindControl("txt_hoten")).Text;
            string diachi = ((TextBox)item.FindControl("txt_diachi")).Text;
            string sodt = ((TextBox)item.FindControl("txt_sdt")).Text;
            string email = ((TextBox)item.FindControl("txt_email")).Text;
            
            if (matkhau != "" && hoten !="" && diachi !="" && sodt!="" && email !="")
            {
                string sqlTaiKhoan = "update TaiKhoan set MatKhau ='"+matkhau+"' where UserName='"+username+"'";
                int ketquaTaiKhoan = ketnoi.ExecNonQuery(sqlTaiKhoan);
                //string sqlKhachHang = "update KhachHang set TenKH=N'" + hoten + "', '" + sodt + "','" + email + "',N'" + diachi + "' where UserName='" + username + "'";
                string sqlKhachHang = "update KhachHang set TenKH=N'" + hoten + "', SoDT='" + sodt + "', Email='" + email + "', DiaChi=N'" + diachi + "' where UserName='" + username + "'";
                int ketquaKhachHang = ketnoi.ExecNonQuery(sqlKhachHang);
                if (ketquaTaiKhoan > 0 && ketquaKhachHang > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông tin thành công')", true);
                    loadthongtin();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông tin không thành công')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn không được để trống các thông tin cá nhân của bạn')", true);
            }
        }
    }
}