<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormChiTietSanPham.aspx.cs" Inherits="QuanLyWebNhacCu.FormChiTietSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
       

        .dl-sp {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .table-main {
            width: 100%;
            max-width: 900px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: #fff;
            margin: 20px 0;
        }

        .name-sp {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .td-hinh {
            padding: 10px;
            vertical-align: middle;
        }

        .img-sp {
            max-width: 200px;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }

            .img-sp:hover {
                transform: scale(1.1);
            }

        .dongia-sp {
            font-size: 20px;
            color: #e60000;
            font-weight: bold;
        }

        .textsoluong {
            font-size: 18px;
            color: #333;
            margin-bottom: 5px;
            vertical-align: middle; 
        }

        .table-soluong {
            display: inline-block; 
            margin-left: 15px;
            vertical-align: middle; 
        }

        .btn-click {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }



            .btn-click:hover {
                background-color: #0056b3;
            }

        .textslmua {
            font-size: 16px;
            width: 40px;
            margin: 0 10px;
            text-align: center;
            display: inline-block;
            vertical-align: middle;
        }
        .textslmua:focus{
            outline:none;
        }

        .add-giohang {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .add-giohang i{
            margin-right:5px;
        }

            .add-giohang:hover {
                background-color: #218838;
            }

        .btn-muangay {
            background-color: #ffc107;
            color: black;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

            .btn-muangay:hover {
                background-color: #e0a800;
            }

        .textMota {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
        }

        /*css nút đánh giá*/
        .btn-danhgia {
            text-align: center;
            margin: auto;
            border-bottom: 2px solid #ffc107;
            width: 100%;
        }

        .in-btn-danhgia {
            font-weight: bold;
            margin-bottom: 15px;
            background-color: #ffc107;
            color: black;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        /*css form view đánh giá*/
        .dl-danhgia {
            width: 100%;
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        .tieude-danhgia {
            text-align: center;
            margin-top: 10px;
        }
        .tieude-danhgia h4{

        }

        .table-danhgia {
        }

        .table-tr {
            border-bottom: 1px solid black;
        }

        .out-name {
            padding: 10px 60px 10px 0px;
        }

        .in-name {
            font-weight: bold;
            font-size: 15px;
            color: #333;
        }

        .out-review {
            padding: 10px 0px 10px 0px;
            width: 350px;
            word-wrap: break-word;
            word-break: break-word;
        }

        .in-review {

        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:DataList ID="dl_chitietsanpham" CssClass="dl-sp" runat="server">
        <ItemTemplate>
            <table class="table-main">
                <tr>
                    <td></td>
                    <td colspan ="2">
                        <asp:Label ID="lb_tensp" CssClass="name-sp" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>(Mã SP: <asp:Label ID="lb_masp" runat="server" Text='<%# Eval("MaSP") %>'></asp:Label>)
                    </td>
                </tr>
                <tr>
                    <td class="td-hinh" rowspan ="4">
                        <asp:Image ID="Image1" CssClass="img-sp" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lb_giatien" CssClass="dongia-sp" runat="server" Text='<%# Convert.ToDecimal(Eval("DonGia")).ToString("N0") + " vnđ" %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                       <asp:Label ID="lb_soluong" CssClass="textsoluong" runat="server">Số Lượng</asp:Label>
                       <table class="table-soluong">
                           <tr>
                               <td>
                                   <asp:Button ID="btn_giam" CssClass="btn-click" runat="server" Text="-" OnClick="btn_giam_Click" /></td>
                               <td>
                                   <asp:TextBox ID="txt_soluongmua" CssClass="textslmua" runat="server" Text="1"></asp:TextBox>
                                   
                               </td>
                               <td>
                                   <asp:Button ID="btn_tang" CssClass="btn-click" runat="server" Text="+" OnClick="btn_tang_Click" />
                               </td>
                           </tr>
                       </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="btnThemGioHang" CssClass="add-giohang" runat="server" OnClick="btnThemGioHang_Click" CommandArgument='<%# Eval("MaSP") %>'><i class="fa-solid fa-cart-shopping"> </i>Thêm vào giỏ hàng</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnMuaNgay" CssClass="btn-muangay" runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnMuaNgay_Click">Mua ngay</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <asp:Label ID="Label3" CssClass="textMota" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                    </td>
                </tr>
            </table>
            <div class="btn-danhgia">
                <asp:LinkButton ID="btn_danhgia" CssClass="in-btn-danhgia" runat="server" OnClick="btn_danhgia_Click" CommandArgument='<%# Eval("MaSP") %>'>Đánh Giá</asp:LinkButton>
            </div>
        </ItemTemplate>
    </asp:DataList>
    
    <div class="tieude-danhgia">
        <h4>Tắt cả dánh giá</h4>
    </div>
    <asp:DataList ID="dl_danhgia" CssClass="dl-danhgia" runat="server" RepeatColumns="1">
        <ItemTemplate>
            <table class="table-danhgia">
                <tr class="table-tr">
                    <td class="out-name">
                        <asp:Label ID="lb_TenKH" CssClass="in-name" runat="server" Text='<%# Eval("TenKH") %>'></asp:Label>
                    </td>
                    <td class="out-review">
                        <asp:Label ID="lb_danhgia" CssClass="in-review" runat="server" Text='<%# Eval("DanhGia") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
