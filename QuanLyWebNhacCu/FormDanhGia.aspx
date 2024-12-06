<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormDanhGia.aspx.cs" Inherits="QuanLyWebNhacCu.FormDanhGia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 90%;
            margin: 40px auto;
            border-radius: 12px;
            padding: 20px;
        }

        .box_main {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        .table-main {
            width: 40%;
        }

        .td-hinh {
            text-align: center;
        }

        .img-sp {
            max-width: 100%;
            border-radius: 8px;
            transition: box-shadow 0.3s ease, filter 0.3s ease;
        }

        .img-sp:hover {
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
            filter: brightness(1.1); /* Tăng độ sáng mà không thay đổi kích thước */
        }


        .name-sp {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .right {
            width: 55%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .in-form-danhgia {
            width: 90%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            height: 150px;
            resize: none;
            margin-bottom: 20px;
        }

        .in-form-danhgia:focus {
            border-color: #ffc107;
            outline: none;
            box-shadow: 0 0 8px rgba(255, 193, 7, 0.5);
        }

        .btn-danhgia {
            text-align: center;
        }

        .in-btn-danhgia {
            background-color: #ffc107;
            color: black;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .in-btn-danhgia:hover {
            background-color: #e0a800;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <asp:DataList ID="dl_sanphamdanhgia" CssClass="dl-sp" runat="server">
            <ItemTemplate>
                <div class="box_main">
                    <table class="table-main">
                        <tr>
                            <td>
                                <asp:Label ID="lb_tensp" CssClass="name-sp" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>(Mã SP:
                               
                                <asp:Label ID="lb_masp" runat="server" Text='<%# Eval("MaSP") %>'></asp:Label>)
                            </td>
                        </tr>
                        <tr>
                            <td class="td-hinh">
                                <asp:Image ID="Image1" CssClass="img-sp" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                            </td>
                        </tr>
                    </table>
                    <div class="right">
                        <div class="in-right">
                            <div class="form-danhgia">
                                <asp:TextBox ID="txt_formdanhgia" CssClass="in-form-danhgia" placeholder="Nhập đánh giá của bạn ..." runat="server" Rows="10" Columns="60" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
                            </div>
                            <div class="btn-danhgia">
                                <asp:LinkButton ID="btn_danhgia" CssClass="in-btn-danhgia" CommandArgument='<%# Eval("MaSP") %>' runat="server" OnClick="btn_danhgia_Click">Đánh Giá</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
        <%--<div class="main">
            <asp:DataList ID="dl_sanphamdanhgia" CssClass="dl-sp" runat="server">
                <ItemTemplate>
                    <table class="table-main">
                        <tr>
                            <td>
                                <asp:Label ID="lb_tensp" CssClass="name-sp" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>(Mã SP:
                                <asp:Label ID="lb_masp" runat="server" Text='<%# Eval("MaSP") %>'></asp:Label>)
                            </td>
                        </tr>
                        <tr>
                            <td class="td-hinh">
                                <asp:Image ID="Image1" CssClass="img-sp" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                            </td>
                        </tr>
                    </table>
                    <div class="right">
                        <div class="in-right">
                            <div class="form-danhgia">
                                <asp:TextBox ID="txt_formdanhgia" CssClass="in-form-danhgia" placeholder="Nhập đánh giá của bạn ..." runat="server" Rows="10" Columns="60" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
                            </div>
                            <div class="btn-danhgia">
                                <asp:LinkButton ID="btn_danhgia" CssClass="in-btn-danhgia" CommandArgument='<%# Eval("MaSP") %>' runat="server" OnClick="btn_danhgia_Click">Đánh Giá</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>--%>
</asp:Content>
