<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="QLDanhGia.aspx.cs" Inherits="QuanLyWebNhacCu.QLDanhGia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .out-table-main {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .tieude h3 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }


        .grid-giohang {
            width: 80%;
            margin: 0 auto;
            border-radius: 5px;
        }

            .grid-giohang th {
                width: 150px;
                background-color: #f2f2f2;
                text-align: center;
                color: black;
                padding: 20px;
            }

            .grid-giohang td {
                padding: 10px;
                text-align: center;
            }

            .grid-giohang tr:hover {
                background-color: darkgray;
            }

        .in-img {
            max-width: 100px;
            max-height: 100px;
            border-radius: 5px;
        }


        .btnXoa {
            background-color: #e84118;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .btnXoa:hover {
                background-color: #c0392b;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-table-main">
        <div class="tieude">
            <h3>QUẢN LÝ ĐÁNH GIÁ</h3>
        </div>
        <asp:GridView ID="grid_taikhoan" runat="server" CssClass="grid-giohang" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="MaDG" HeaderText="Mã Đánh Giá" />
                <asp:BoundField DataField="UserName" Visible="false" />
                <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" />
                <asp:BoundField DataField="MaSP" HeaderText="Mã SP" />
                <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                <asp:TemplateField HeaderText="Ảnh SP">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" CssClass="in-img" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DanhGia" HeaderText="Đánh Giá Của Khách" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Button ID="btn_xoa" CssClass="btnXoa" runat="server" Text="Xóa" OnClick="btn_xoa_Click" CommandArgument='<%# Eval("MaDG") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
