using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class FormSanPham : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            
            LoadData();

        }
        protected void ListView1_PagePropertiesChanged(object sender, EventArgs e)
        {
            LoadData(); // Ràng buộc lại dữ liệu khi trang thay đổi
        }
        private void LoadData()
        {
            string maloai = Request.QueryString["ml"] + ""; // load san pham theo loai san pham
            
            string masanpham = Request.QueryString["masp"] + ""; // tim kiem theo ma san pham
            string tensanpham = Request.QueryString["tensp"] + ""; // tim kiem theo ten san pham
            string sql;
            if (maloai == "" && masanpham == ""  && tensanpham == "")
            {
                sql = "select * from SanPham";

            }
            else
            {
                if(masanpham != "") // tim kiem ma san pham
                {
                    sql = "select * from SanPham where MaSP ='"+masanpham+"'";
                }
                else if(tensanpham != "") // tim kiem ten san pham
                {
                    sql = "select * from SanPham where TenSP Like '%" + tensanpham + "%'";
                }
                
                else // hien thi cac san pham theo loai da chon o trang chu
                {
                    sql = "select * from SanPham where MaLSP= '" + maloai + "' ";
                }                
            }
            ListView1.DataSource = ketnoi.ReadData(sql);
            ListView1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string mahang = ((ImageButton)sender).CommandArgument;
            Response.Redirect("FormChiTietSanPham.aspx?masp=" + mahang);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string mahang = ((LinkButton)sender).CommandArgument;
            Response.Redirect("FormChiTietSanPham.aspx?masp=" + mahang);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string mahang = ((LinkButton)sender).CommandArgument;
            Response.Redirect("FormChiTietSanPham.aspx?masp=" + mahang);
        }
    }
}