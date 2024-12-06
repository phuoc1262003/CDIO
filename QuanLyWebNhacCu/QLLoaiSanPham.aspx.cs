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
    public partial class QLLoaiSanPham : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;


            loadloaisanpham();
        }
        private void loadloaisanpham()
        {
            string sql;
            sql = "select * from LoaiSanPham";
            grid_loaisanpham.DataSource = ketnoi.ReadData(sql);
            grid_loaisanpham.DataBind();
        }
        private void XoaForm()
        {
            txt_MaLSP.Text = "";
            txt_TenLSP.Text = "";
            images.ImageUrl = "";
        }
        protected void grid_loaisanpham_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grid_loaisanpham.SelectedRow;
            txt_MaLSP.Text = row.Cells[1].Text;
            txt_TenLSP.Text = row.Cells[2].Text;
            string imageUrl = ((Image)row.FindControl("Image1")).ImageUrl;
            images.ImageUrl = imageUrl;
            
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            string maloai = txt_MaLSP.Text;
            string tenloai = txt_TenLSP.Text;
            // chú ý phải thêm using system.Io để dùng được Path 
            string upload = Path.GetFileName(FileUpload.FileName);
            string location = Server.MapPath("~/images/") + upload;
            FileUpload.SaveAs(location);
            string sqlkiemtra = "select * from LoaiSanPham where MaLSP='" + maloai + "'";
            DataTable dt = ketnoi.ReadData(sqlkiemtra);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mã loại sản phẩm này đã tồn tại vui lòng đặt tên khác');", true);
            }
            else
            {
                string sql = "Insert into LoaiSanPham values ('" + maloai + "',N'" + tenloai + "', '" + upload + "')";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm loại sản phẩm mới thành công');", true);
                    loadloaisanpham();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm  thất bại');", true);
                }
            }

        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string maLSP = txt_MaLSP.Text;
            string sqlKiemtra = "select * from LoaiSanPham where MaLSP = '" + maLSP + "'   ";
            DataTable dt1 = ketnoi.ReadData(sqlKiemtra);

            if (dt1.Rows.Count > 0)
            {
                // Lấy tên file hình ảnh
                string fileName = dt1.Rows[0]["HinhAnh"].ToString();
                string filePath = Server.MapPath("~/images/") + fileName;
                string sql = "delete from LoaiSanPham where MaLSP='" + maLSP + "'";
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
                        loadloaisanpham();
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
            string maLSP = txt_MaLSP.Text;
            string tenlsp = txt_TenLSP.Text;
            string upload = Path.GetFileName(FileUpload.FileName);
            string location = Server.MapPath("~/images/") + upload;
            FileUpload.SaveAs(location);
            string sqlKiemtra = "select * from LoaiSanPham where MaLSP = '" + maLSP + "'   ";
            DataTable dt1 = ketnoi.ReadData(sqlKiemtra);
            
            if (dt1.Rows.Count > 0 )
            {
                string sqlUpKH = "update LoaiSanPham set MaLSP = N'" + maLSP + "', TenLoai =N'" + tenlsp + "', HinhAnh= '" + upload + "' where MaLSP='" + maLSP + "' ";
                int ketqua = ketnoi.ExecNonQuery(sqlUpKH);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật loại sản phẩm này thành công');", true);
                    XoaForm();
                    loadloaisanpham();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại');", true);
                }
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy loại sản phẩm nào. Vui lòng kiểm tra lại!');", true);
            }
        }

        

        protected void btn_lammoi_Click(object sender, EventArgs e)
        {
            loadloaisanpham();
            XoaForm();
        }

    }
}