<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormThongTinKH.aspx.cs" Inherits="QuanLyWebNhacCu.FormThongTinKH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .out-table-main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top:20px;
        }

        .table-main {
            margin: auto;
            border: 1px solid #ddd;
            padding: 10px 50px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .tieude {
            font-size: 24px;
            font-weight: bold;
            padding: 15px;
            color: #333;
            text-transform: uppercase;
            border-bottom: 2px solid #ddd;
        }

        .info {
            font-size: 20px;
            padding: 15px 30px 10px 0px;
            color: #555;
        }

        .lb-info {
            font-size: 20px;
            padding: 5px 15px;
        }

        .out-txt {
            padding: 15px 0px 10px 0px;
        }

        .txt-info {
            font-size: 18px;
            padding: 10px 15px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-sizing: border-box;
        }

            .txt-info:focus {
                border-color: #007bff;
                outline: none;
            }

        .out-btn {
            padding: 20px 0px;
        }

        .in-btn {
            background-color: #fbc531;
            color: black;
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .in-btn:hover {
                background-color: #fbd56d
            }
        .validation{
            font-size:30px;
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-table-main">
        <asp:DataList ID="dl_infokhachhang" runat="server">
            <ItemTemplate>
                <table class="table-main">
                    <tr>
                        <td class="tieude" align="center" colspan="2">QUẢN LÝ THÔNG TIN CÁ NHÂN</td>
                    </tr>
                    <tr>
                        <td class="info">Tên tài khoản</td>
                        <td class="out-txt">
                            <asp:Label ID="lb_tenttaikhoan" CssClass="lb-info" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Mật khẩu</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_matkhau" CssClass="txt-info" runat="server" Text='<%# Eval("MatKhau") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Họ tên</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_hoten" CssClass="txt-info" runat="server" Text='<%# Eval("TenKH") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Địa chỉ</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_diachi" CssClass="txt-info" placeholder="*Cập nhật địa chỉ" runat="server" Text='<%# Eval("DiaChi") %>' TextMode="MultiLine" Rows="3" MaxLength="500"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Số điện thoại</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_sdt" CssClass="txt-info" runat="server" placeholder="*Cập nhật số điện thoại" Text='<%# Eval("SoDT") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="validation" runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ControlToValidate="txt_sdt" ValidationExpression="^0[3-9]\d{8}$" ToolTip="Sai định dạng SDT">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Email</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_email" CssClass="txt-info" runat="server" placeholder="*Cập nhật email" Text='<%# Eval("Email") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="validation" Display="Dynamic" runat="server" ControlToValidate="txt_email" ValidationExpression="^[a-z0-9]+@gmail\.com$" ErrorMessage="Email không hợp lệ" ToolTip="Email không hợp lệ">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="out-btn" colspan="2" align="center">
                            <asp:Button ID="btn_capnhat" CssClass="in-btn" runat="server" Text="Cập Nhật" OnClick="btn_capnhat_Click" CommandArgument='<%# Eval("UserName") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
