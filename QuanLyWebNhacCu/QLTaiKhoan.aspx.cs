using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyWebNhacCu
{
    public partial class QLTaiKhoan : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadDropDownList();
            loadtaikhoan();
           
        }
        private void loadtaikhoan()
        {
            string sql;
            sql = "select TaiKhoan.UserName, TaiKhoan.IDQuyen, TenKH, SoDT, Email, DiaChi from TaiKhoan, KhachHang where TaiKhoan.UserName = KhachHang.UserName";
            grid_taikhoan.DataSource = ketnoi.ReadData(sql);
            grid_taikhoan.DataBind();
        }

       
        private void LoadDropDownList()
        {
            string sql = "SELECT * FROM PhanQuyen"; 
            DropDownList.DataSource = ketnoi.ReadData(sql);
            DropDownList.DataTextField = "TenQuyen";
            DropDownList.DataValueField = "IDQuyen";
            DropDownList.DataBind();
        }
        private void XoaForm()
        {
            txt_taikhoan.Text = "";
            txtpass.Text = "";
            txt_tenKH.Text = "";
            txt_sdt.Text = "";
            txt_email.Text = "";
            txt_diachi.Text = "";
            DropDownList.ClearSelection();
        }
       
       
        protected void btn_them_Click(object sender, EventArgs e)
        {
            string username = txt_taikhoan.Text;
            string pass = txtpass.Text;
            string quyen = DropDownList.SelectedValue;
            string hoten = txt_tenKH.Text;
            string sdt = txt_sdt.Text;
            string email = txt_email.Text;
            string diachi = txt_diachi.Text;
            //string diachi = HttpUtility.HtmlEncode(txt_diachi.Text);
            string sqlkiemtra = "select * from TaiKhoan where UserName='" + username + "' ";
            DataTable dt = ketnoi.ReadData(sqlkiemtra);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tài khoản đã tồn tại vui lòng đặt tên khác');", true);
            }
            else
            {
                string sqlTK;
                sqlTK = "insert into TaiKhoan values ('" + username + "','" + quyen + "', '" + pass + "')";
                int ketqua = ketnoi.ExecNonQuery(sqlTK);
                string sqlKH = "insert into KhachHang values ('" + username + "',N'" + hoten + "', '" + sdt + "', '" + email + "', N'" + diachi + "')";
                int ketqua1 = ketnoi.ExecNonQuery(sqlKH);
                if (ketqua > 0 && ketqua1 > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm tài khoản thành công');", true);
                    loadtaikhoan();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm tài khoản thất bại');", true);
                }
            }
        }
        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string maUser = txt_taikhoan.Text;
            string sqlKiemtra = "select * from KhachHang where UserName = '"+maUser+"'   ";
            DataTable dt1 = ketnoi.ReadData(sqlKiemtra);
            string sqlKiemtra1 = "select * from TaiKhoan where UserName = '" + maUser + "'   ";
            DataTable dt2 = ketnoi.ReadData(sqlKiemtra1);
            if( dt1.Rows.Count > 0 && dt2.Rows.Count > 0)
            {
                string sqlXoaKH = "delete from KhachHang where UserName='" + maUser + "'";
                int ketqua1 = ketnoi.ExecNonQuery(sqlXoaKH);
                string sqlXoaTK = "DELETE FROM TaiKhoan WHERE UserName='" + maUser + "'";
                int ketqua = ketnoi.ExecNonQuery(sqlXoaTK);
                if (ketqua1 > 0 && ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa tài khoản này thành công');", true);
                    XoaForm();
                    loadtaikhoan();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa tài khoản thất bại');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy UserName nào. Vui lòng kiểm tra lại!');", true);
            }
            
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string maUser = txt_taikhoan.Text;
            //string username = txt_taikhoan.Text;
            string pass = txtpass.Text;
            string quyen = DropDownList.SelectedValue;
            string hoten = txt_tenKH.Text;
            string sdt = txt_sdt.Text;
            string email = txt_email.Text;
            string diachi = txt_diachi.Text;
            string sqlKiemtra = "select * from KhachHang where UserName = '" + maUser + "'   ";
            DataTable dt1 = ketnoi.ReadData(sqlKiemtra);
            string sqlKiemtra1 = "select * from TaiKhoan where UserName = '" + maUser + "'   ";
            DataTable dt2 = ketnoi.ReadData(sqlKiemtra1);
            if (dt1.Rows.Count > 0 && dt2.Rows.Count > 0)
            {
                if (pass != "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không được phép thay đổi mật khẩu');", true);
                }
                else
                {
                    string sqlUpTK = " update TaiKhoan set IDQuyen ='" + quyen + "' where UserName='" + maUser + "' ";
                    int ketqua = ketnoi.ExecNonQuery(sqlUpTK);
                    string sqlUpKH = "update KhachHang set TenKH = N'" + hoten + "', SoDT ='" + sdt + "', Email= '" + email + "', DiaChi=N'" + diachi + "' where UserName='" + maUser + "' ";
                    int ketqua1 = ketnoi.ExecNonQuery(sqlUpKH);
                    if (ketqua > 0 && ketqua1 > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông tin tài khoản này thành công');", true);
                        XoaForm();
                        loadtaikhoan();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại');", true);
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy UserName nào. Vui lòng kiểm tra lại!');", true);
            }
            
            
        }
        protected void btn_lammoi_Click(object sender, EventArgs e)
        {
            loadtaikhoan();
            XoaForm();
        }
        protected void grid_taikhoan_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Lấy chỉ số dòng được chọn
            GridViewRow row = grid_taikhoan.SelectedRow;

            // Lấy dữ liệu từ các ô trong dòng được chọn và gán cho các TextBox và DropDownList
            txt_taikhoan.Text = row.Cells[1].Text; // Tên tài khoản
            DropDownList.SelectedValue = row.Cells[2].Text; // Quyền
            txt_tenKH.Text = row.Cells[3].Text; // Họ và tên
            // Kiểm tra và thay thế chuỗi &nbsp; nếu có
            txt_sdt.Text = row.Cells[4].Text == "&nbsp;" ? "" : row.Cells[4].Text; // Số điện thoại
            txt_email.Text = row.Cells[5].Text == "&nbsp;" ? "" : row.Cells[5].Text; // Email
            //txt_sdt.Text = row.Cells[4].Text; // Số điện thoại
            //txt_email.Text = row.Cells[5].Text; // Email
            txt_diachi.Text = row.Cells[6].Text == "&nbsp;" ? "" : row.Cells[6].Text;
            // // Giải mã chuỗi địa chỉ trước khi hiển thị lên TextBox
            //txt_diachi.Text = HttpUtility.HtmlDecode(row.Cells[6].Text); // Địa chỉ

        }

        
    }
}