using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class Default : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string sql;
            sql = "select * from LoaiSanPham";
            dl_nhaccu.DataSource = ketnoi.ReadData(sql);
            dl_nhaccu.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string maloai = ((ImageButton)sender).CommandArgument;
            Response.Redirect("FormSanPham.aspx?ml=" + maloai);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string maloai = ((LinkButton)sender).CommandArgument;
            Response.Redirect("FormSanPham.aspx?ml=" + maloai);
        }
    }
}