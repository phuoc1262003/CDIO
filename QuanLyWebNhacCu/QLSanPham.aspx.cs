using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace QuanLyWebNhacCu
{
    public partial class QLSanPham : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadDropDownList();
            loadsanpham();
            

        }
        private void loadsanpham()
        {
            string sqlgrid;
            sqlgrid = "select * from SanPham";
            grid_sanpham.DataSource = ketnoi.ReadData(sqlgrid);
            grid_sanpham.DataBind();
        }
        private void LoadDropDownList()
        {
            string sql = "SELECT * from LoaiSanPham";
            DropDownList.DataSource = ketnoi.ReadData(sql);
            DropDownList.DataTextField = "TenLoai";
            DropDownList.DataValueField = "MaLSP";
            DropDownList.DataBind();
        }
        private void XoaForm()
        {
            txt_masp.Text = "";
            txt_tensp.Text = "";
            txtmota.Text = "";
            txt_soluong.Text = "";
            txtgia.Text = "";
            images.ImageUrl = "";
            DropDownList.ClearSelection();

        }

        protected void grid_sanpham_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Lấy hàng được chọn
            GridViewRow row = grid_sanpham.SelectedRow;

            // Gán giá trị vào các TextBox tương ứng
            txt_masp.Text = row.Cells[1].Text; // Mã SP
            DropDownList.SelectedValue = row.Cells[2].Text;
            txt_tensp.Text = row.Cells[3].Text; // Tên SP
            txt_soluong.Text = row.Cells[5].Text; // Số Lượng
            txtgia.Text = row.Cells[4].Text; // Giá Sản Phẩm
            txtmota.Text = row.Cells[6].Text; // Mô Tả

            // Lấy và gán URL hình ảnh
            string imageUrl = ((Image)row.FindControl("Image1")).ImageUrl;
            images.ImageUrl = imageUrl;

        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            string masp = txt_masp.Text;
            string maLSP = DropDownList.SelectedValue;
            string tensp = txt_tensp.Text;
            string mota = txtmota.Text;
            string dongia = txtgia.Text;
            string soluong = txt_soluong.Text;
            // chú ý phải thêm using system.Io để dùng được Path 
            string upload = Path.GetFileName(FileUpload1.FileName);
            string location = Server.MapPath("~/images/") + upload;
            FileUpload1.SaveAs(location);
            string sqlkiemtra = "select * from SanPham where MaSP='" + masp + "'";
            DataTable dt = ketnoi.ReadData(sqlkiemtra);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã sản phẩm này đã tồn tại vui lòng đặt tên khác');", true);
            }
            else
            {
                string sql = sql = "INSERT INTO SanPham (MaSP, MaLSP, TenSP, DonGia, SoLuongSP, MoTa, HinhAnh) VALUES ('" + masp + "', '" + maLSP + "', N'" + tensp + "', '" + dongia + "', '" + soluong + "', N'" + mota + "', '" + upload + "')";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm sản phẩm mới thành công');", true);
                    loadsanpham();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thất bại');", true);
                }
            }
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string masp = txt_masp.Text;
            string sqlKiemtra = "select * from SanPham where MaSP = '" + masp + "'   ";
            DataTable dt1 = ketnoi.ReadData(sqlKiemtra);

            if (dt1.Rows.Count > 0)
            {
                // Lấy tên file hình ảnh
                string fileName = dt1.Rows[0]["HinhAnh"].ToString();
                string filePath = Server.MapPath("~/images/") + fileName;
                string sql = "delete from SanPham where MaSP='" + masp + "'";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    if (File.Exists(filePath))
                    {
                        try
                        {
                            File.Delete(filePath);
                            // Xóa file hình ảnh khỏi thư mục
                        }
                        catch (Exception ex)
                        {

                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không thể xóa hình ảnh: " + ex.Message + "');", true);
                            return;
                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa loại sản phẩm này thành công');", true);
                        loadsanpham();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa  thất bại');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy Mã loại nào như vậy. Vui lòng kiểm tra lại!');", true);
                }
            }
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string masp = txt_masp.Text;
            string maLSP = DropDownList.SelectedValue;
            string tensp = txt_tensp.Text;
            string mota = txtmota.Text;
            string dongia = txtgia.Text;
            string soluong = txt_soluong.Text;
            string upload = Path.GetFileName(FileUpload1.FileName);
            string location = Server.MapPath("~/images/") + upload;
            FileUpload1.SaveAs(location);
            string sqlKiemtra = "select * from SanPham where MaSP = '" + masp + "'   ";
            DataTable dt1 = ketnoi.ReadData(sqlKiemtra);

            if (dt1.Rows.Count > 0)
            {
                string sqlUpKH = "update SanPham set MaSP = '" + masp + "', MaLSP ='" + maLSP + "', TenSP= N'" + tensp + "', DonGia='"+dongia+"', SoLuongSP='"+soluong+"', MoTa=N'"+mota+"', HinhAnh='"+upload+"' where MaSP='" + masp + "' ";
                int ketqua = ketnoi.ExecNonQuery(sqlUpKH);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật  sản phẩm này thành công');", true);
                    XoaForm();
                    loadsanpham();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại');", true);
                }
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy  sản phẩm nào. Vui lòng kiểm tra lại!');", true);
            }
        }

        protected void btn_lammoi_Click(object sender, EventArgs e)
        {
            loadsanpham();
            XoaForm();
        }
    }
}