using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyWebNhacCu
{
    public partial class FormDkEmail : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void btn_dangky_Click(object sender, EventArgs e)
        {
            string email = txt_email.Text;
            string pass = txt_Pass.Text;
            string pass1 = txt_Pass_1.Text;
            string hoten = txt_hoten.Text;
            string diachi = txt_diachi.Text;
            string sqlkiemtra = "select * from TaiKhoan where UserName='" + email + "' ";
            DataTable dt = ketnoi.ReadData(sqlkiemtra);
            if (dt.Rows.Count > 0)
            {
                string script = "alert('Tài khoản đã tồn tại, vui lòng nhập lại.');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", script, true);
            }
            else
            {
                string sdt = "";
                string id = "999";
                int idquyen = int.Parse(id);
                string sqlTK;
                sqlTK = "insert into TaiKhoan values ('" + email + "','" + idquyen + "', '" + pass + "')";
                int ketqua = ketnoi.ExecNonQuery(sqlTK);
                string sqlKH = "insert into KhachHang values ('" + email + "',N'" + hoten + "', '" + sdt + "', '" + email + "', N'" + diachi + "')";
                int ketqua1 = ketnoi.ExecNonQuery(sqlKH);

                if (ketqua > 0 && ketqua1 > 0)
                {
                    // Chuyển sang trang đăng nhập nếu đăng ký thành công
                    Response.Redirect("FormLogin.aspx");
                }
                else
                {
                    // Thông báo nếu có lỗi xảy ra trong quá trình chèn dữ liệu
                    string script = "alert('Có lỗi xảy ra, vui lòng thử lại sau.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "InsertErrorAlert", script, true);
                }

            }
        }
    }
}