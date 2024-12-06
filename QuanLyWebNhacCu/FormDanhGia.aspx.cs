using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyWebNhacCu
{
    public partial class FormDanhGia : System.Web.UI.Page
    {
        LopketNoi ketnoi = new LopketNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddanhgia();
        }
        private void loaddanhgia()
        {
            string masp = Request.QueryString["MaSP"] + "";
            string sql;
            if (masp != "")
            {
                sql = "select * from SanPham where MaSP= '" + masp + "' ";
                dl_sanphamdanhgia.DataSource = ketnoi.ReadData(sql);
                dl_sanphamdanhgia.DataBind();
            }
        }

        protected void btn_danhgia_Click(object sender, EventArgs e)
        {
            string matk = Session["UserName"] + "";
            if (matk != "")
            {
                string masp = ((LinkButton)sender).CommandArgument;
                LinkButton btdanhgia = (LinkButton)sender;
                DataListItem item = (DataListItem)btdanhgia.Parent;
                string txtdanhgia = ((TextBox)item.FindControl("txt_formdanhgia")).Text;               
                if (txtdanhgia == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa nhập đánh giá');", true);
                }
                else
                {
                    string sql = "insert into DANHGIA values('" + matk + "','" + masp + "',N'" + txtdanhgia + "')";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đánh giá thành công');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đánh giá thất bại');", true);
                    }
                }
            }

        }
    }
}