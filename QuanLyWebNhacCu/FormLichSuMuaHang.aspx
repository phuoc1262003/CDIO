<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormLichSuMuaHang.aspx.cs" Inherits="QuanLyWebNhacCu.FormLichSuMuaHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .out-table-main {
            max-width: 1500px;
            margin: 20px auto;
            border: 1px solid #ddd;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
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
        .grid-giohang {
            width: 100%;
            margin-top: 20px;
        }

            .grid-giohang th, .grid-giohang td {
                padding: 3px;
                border: 1px solid #ddd;
                text-align: center;
            }

            .grid-giohang th {
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: center;
                font-size: 15px;
            }

        .in-img {
            max-width: 100px;
            object-fit: cover;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .sodt{
            width: 80px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
            justify-content: center;
        }
        .sodt:focus{
            outline:none;
        }
        .diachi {
            width: 90px;
            height:100px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
            justify-content: center;
        }
        .diachi:focus{
            outline:none;
        }

        .out-table-main .Columns {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

            .out-table-main .Columns .grid-giohang {
                flex: 1;
            }

        .btnXoa, .btnSua {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px 0;
            border-radius: 5px;
            cursor: pointer;
        }

            .btnXoa:hover, .btnSua:hover {
                background-color: #f35c5c;
            }

        .btn_Capnhat {
            background-color: #fbc531;
            color: black;
            border: none;
            margin: 5px 0;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

            .btn_Capnhat:hover {
                background-color: #f5d06d;
            }
        .droplist:focus{
            outline:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-table-main">
        <div class="head">
            <div class="tieude">
                <div><i class="fa-solid fa-cart-shopping"></i>Đơn hàng đã mua</div>
            </div>
            <div class="out-button">
                <asp:LinkButton ID="btn_dong" CssClass="in-button-close" runat="server" OnClick="btn_dong_Click"><i class="fa-solid fa-xmark"></i></asp:LinkButton>
            </div>
        </div>
        <asp:GridView ID="grid_sanpham" runat="server" CssClass="grid-giohang" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <asp:BoundField DataField="MaDH" HeaderText="MaDH" />
            <asp:TemplateField HeaderText="Ảnh SP">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" CssClass="in-img" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
            <asp:BoundField DataField="MaSP" Visible="false" />
            <asp:BoundField DataField="DonGia" HeaderText="Giá" DataFormatString="{0:N0} vnđ" HtmlEncode="false" />
            <asp:BoundField DataField="SoLuongSPM" HeaderText="Số Lượng" />
            <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" />
            <asp:BoundField DataField="SoDT" HeaderText="Số DT" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" />
             <asp:BoundField DataField="NgDatHang" HeaderText="Ngày Đặt Hàng" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0} vnđ" HtmlEncode="false" />
             <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" />
            
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:Button ID="btn_xoa" CssClass="btnXoa" runat="server" Text="Hủy đơn" OnClick="btn_xoa_Click" CommandArgument='<%# Eval("MaSP") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
