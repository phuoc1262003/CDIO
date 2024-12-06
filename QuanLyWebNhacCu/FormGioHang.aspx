<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormGioHang.aspx.cs" Inherits="QuanLyWebNhacCu.FormGioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .out-table-main {
            max-width: 1200px;
            margin: 20px auto;
            border: 1px solid #ddd;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .table-main {
        }

        .tieude {
            font-size: 24px;
            padding-bottom: 20px;
            font-weight: bold;
            color: #333;
            display:flex;
        }

            .tieude i {
                margin-right: 10px;
            }
        .btn-history{
            font-size:12px;
            color:#333;
            margin-left:20px;
            text-decoration:underline;
        }
        .grid-giohang {
            width: 100%;
            margin-top: 20px;
        }

            
            .grid-giohang th, .grid-giohang td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }

            
            .grid-giohang th {
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: center;
            }


       

        
        .in-lb-soluong {
            font-size: 16px;
            color: #333;
        }

        
        .in-btn-soluong {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 7px 10px 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }

            .in-btn-soluong:hover {
                background-color: #c0392b; 
            }


        .in-button-thanhtoan {
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }

            .in-button-thanhtoan:hover {
                background-color: #27ae60;
            }

        
        

        .in-img {
            max-width: 120px;
            object-fit: cover; /* Đảm bảo hình ảnh được cắt theo kích thước khung */
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .in-button-close {
            padding: 3px 5px;
            border-radius: 50%;
            font-size: 16px;
            cursor: pointer;
            border: 1px solid black;
            background-color: black;
            color: white;
            font-weight: bold;
        }
        .in-button-close:hover{
           border: 1px solid red;
            background-color: red;
            color: black;
        }

        .head {
            display: flex;
            justify-content: space-between;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-table-main">
        <div class="head">
            <div class="tieude">
                <div><i class="fa-solid fa-cart-shopping"></i>Giỏ Hàng</div>
                <div><asp:LinkButton ID="btn_lichsu" CssClass="btn-history" runat="server" OnClick="btn_lichsu_Click">Lịch sử mua hàng</asp:LinkButton></div>
            </div>
            <div class="out-button">
                <asp:LinkButton ID="btn_dong" CssClass="in-button-close" runat="server" OnClick="btn_dong_Click"><i class="fa-solid fa-xmark"></i></asp:LinkButton>
            </div>
        </div>
        <asp:GridView ID="dl_giohang" CssClass="grid-giohang" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Ảnh Sản Phẩm">
                    <ItemTemplate>
                        <asp:Image ID="img_hinhanh" CssClass="in-img" runat="server" ImageUrl='<%# "images/" + Eval("HinhAnh") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField HeaderText="Mã Sản Phẩm" DataField="MaSP" />--%>
                <asp:BoundField DataField="MaSP" Visible="false" />
                <asp:BoundField HeaderText="Tên Sản Phẩm" DataField="TenSP" />
                <asp:BoundField HeaderText="Giá" DataField="DonGia" DataFormatString="{0:N0} VNĐ" HtmlEncode="false" />
                <asp:BoundField HeaderText="Số Lượng" DataField="SoLuongMua" />
                <asp:BoundField HeaderText="Tổng Tiền" DataField="TongTien" DataFormatString="{0:N0} VNĐ" HtmlEncode="false" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Button ID="btn_xoa" CssClass="in-btn-soluong" Text="Xóa" runat="server" CommandArgument='<%# Eval("MaSP") %>'  OnClick="btn_xoa_Click"/>
                        <asp:LinkButton ID="btn_thanhtoan" CssClass="in-button-thanhtoan" runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="btn_thanhtoan_Click">Thanh Toán</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
