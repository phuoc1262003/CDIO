<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="QLTaiKhoan.aspx.cs" Inherits="QuanLyWebNhacCu.QLTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .out-table-main {
            max-width: 1300px;
            margin: 20px auto;
            border: 1px solid #ddd;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .tieude {
            padding: 20px;
            text-align: center;
        }

            .tieude h3 {
            }

        .out-main {
            width:100%;
        }



        .table-left {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 16px;
        }

            .table-left td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }

        .info {
            font-weight: bold;
            width: 20%;
            text-align: right;
            padding-right: 10px;
        }

        .out-txt, .out-droplist, .out-upfile {
            width: 30%;
        }

        .in-txt, .in-droplist, .in-upfile {
            width: 90%;
            padding: 8px;
            font-size: 14px;
        }

        .out-btn {
            text-align: center !important;
        }

        .in-btn {
            background-color: #fbc531;
            color: black;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
            margin: 5px;
        }

            .in-btn:hover {
                background-color: #ddbc64;
            }

        .in-timkiem {
            width: 60%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .btn-timkiem {
            background-color: #fbc531;
            color: black;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
        }

            .btn-timkiem:hover {
                background-color: #0b7dda;
            }

        .rigth {
        }

        .gridview {
            width: 100%;
            margin-top: 20px;
            font-size: 14px;
        }

            .gridview th, .gridview td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }

            .gridview th {
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: center;
            }
        .user-btn i{
            color:black;
            cursor:pointer;
        }
        .user-btn i:hover{
            color:#fbc531;
            cursor:pointer;
        }
        .validation{
            font-size:30px;
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-table-main">
        <div class="tieude">
            <h3>QUẢN LÝ TÀI KHOẢN</h3>
        </div>
        <div class="out-main">
            <div class="left">
                        <table class="table-left">
                    <tr>
                        <td class="info">Tên tài khoản</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_taikhoan" CssClass="in-txt" runat="server" Text='<%# Eval("UserName") %>'></asp:TextBox>
                        </td>
                        <td rowspan="2" class="info">Quyền</td>
                        <td rowspan="2" class="out-droplist">
                            <asp:DropDownList ID="DropDownList" CssClass="in-droplist" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Mật khẩu</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txtpass" CssClass="in-txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Họ và tên</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_tenKH" CssClass="in-txt" runat="server"></asp:TextBox>
                        </td>
                        <td class="info">Số điện thoại</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_sdt" CssClass="in-txt" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="validation" runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ControlToValidate="txt_sdt" ValidationExpression="^0[3-9]\d{8}$" ToolTip="Sai định dạng SDT">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="info">Email</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_email" CssClass="in-txt" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="validation" Display="Dynamic" runat="server" ControlToValidate="txt_email" ValidationExpression="^[a-z0-9]+@gmail\.com$" ErrorMessage="Email không hợp lệ" ToolTip="Email không hợp lệ">*</asp:RegularExpressionValidator>
                        </td>
                        <td class="info">Địa chỉ</td>
                        <td class="out-upfile">
                            <asp:TextBox ID="txt_diachi" CssClass="in-txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="out-btn">
                            <asp:Button ID="btn_them" CssClass="in-btn" runat="server" Text="Thêm" OnClick="btn_them_Click" />
                        </td>
                        <td class="out-btn">
                            <asp:Button ID="btn_xoa" CssClass="in-btn" runat="server" Text="Xóa" OnClick="btn_xoa_Click" />
                        </td>
                        <td class="out-btn">
                            <asp:Button ID="btn_sua" CssClass="in-btn" runat="server" Text="Sửa" OnClick="btn_sua_Click"/>
                        </td>
                        <td class="out-btn">
                            <asp:Button ID="btn_lammoi" CssClass="in-btn" runat="server" Text="Làm Mới" OnClick="btn_lammoi_Click" />
                        </td>
                    </tr>                    
                </table>
            </div>
            <div class="right">
                <asp:GridView ID="grid_taikhoan" runat="server" CssClass="gridview" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_taikhoan_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-user-pen"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserName" HeaderText="Tên tài khoản" />
                        <asp:BoundField DataField="IDQuyen" HeaderText="Quyền" />
                        <asp:BoundField DataField="TenKH" HeaderText="Họ và tên" />
                        <asp:BoundField DataField="SoDT" HeaderText="SoDT" HtmlEncode="false" DataFormatString="{0}" NullDisplayText="" />
                        <asp:BoundField DataField="Email" HeaderText="Email" HtmlEncode="false" DataFormatString="{0}" NullDisplayText="" />
                        <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" HtmlEncode="false" DataFormatString="{0}" NullDisplayText="" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
