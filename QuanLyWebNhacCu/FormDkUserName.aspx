<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDkUserName.aspx.cs" Inherits="QuanLyWebNhacCu.FormDkUserName" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Ký</title>
    <style>
         * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            font-family: "Nunito Sans", sans-serif;
        }

        html,
        body {
            width: 100%;
            height: 100%;
        }

        #form1 {
            width: 100%;
            height: 100%;
            background-image: url(./images/backLogin.jpg);
            background-position: center center;
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        .signin {
            position: absolute;
            top: 5%;
            left: 10%;
        }
       /* .signin tr{
            padding:15px 0px;
        }*/
        .out-dangky {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
        }
        .info{
            font-size:20px;
            padding: 15px 30px 10px 0px;
        }
        .out-txt{
            padding:15px 0px 10px 0px;
        }
        .txt-info{
            font-size:20px;
            background-color: #F7F3F3;
            border: 1px solid #ddd;
            padding: 5px 15px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
            .txt-info:focus {
                outline: none;
            }
        
        .lb-tb{

        }
        .in-lb-tb{

        }
        .out-btndky {
            padding: 20px 0px;
        }
        .in-btnDK{
            padding: 5px 15px;
            background-color: #EED3E5;
            color: #B13A07;
            font-weight: bold;
            font-size: 18px;
            border: none;
            border-radius: 10px;
        }
        .in-btnDK:hover{
            cursor:pointer;
            background-color:#F4B9E0;
            color:#A23A0D;
        }
        
        .validation{
            font-size:30px;
            color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="signin">
            <tr>
                <td colspan="2" class="out-dangky" align="center">Đăng Ký</td>
            </tr>
            <tr>
                <td class="info">Tên đăng nhập</td>
                <td class="out-txt">
                    <asp:TextBox ID="txt_tenDN" CssClass="txt-info" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation" runat="server" ControlToValidate="txt_tenDN" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ToolTip="Vui lòng nhập tên đăng nhập" >*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="info">Mật khẩu</td>
                <td class="out-txt">
                    <asp:TextBox ID="txt_Pass" CssClass="txt-info" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="validation" ControlToValidate="txt_Pass" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ToolTip="Vui lòng nhập mật khẩu">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="info">Nhập lại mật khẩu</td>
                <td class="out-txt">
                    <asp:TextBox ID="txt_Pass_1" CssClass="txt-info" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="validation" runat="server" ControlToValidate="txt_Pass_1" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ToolTip="Vui lòng xác nhận mật khẩu">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" CssClass="validation" runat="server" ControlToCompare="txt_Pass" ControlToValidate="txt_Pass_1" Display="Dynamic" ErrorMessage="CompareValidator" ToolTip="Mật khẩu xác nhận không đúng">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="info">Họ và tên</td>
                <td class="out-txt">
                    <asp:TextBox ID="txt_hoten" CssClass="txt-info" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="info">Số điện thoại</td>
                <td class="out-txt">
                    <asp:TextBox ID="txt_sdt" CssClass="txt-info" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="validation" runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ControlToValidate="txt_sdt" ValidationExpression="^0[3-9]\d{8}$" ToolTip="Sai định dạng SDT">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="info">Emai</td>
                <td class="out-txt">
                    <asp:TextBox ID="txt_email" CssClass="txt-info" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="validation" Display="Dynamic" runat="server" ControlToValidate="txt_email" ValidationExpression="^[a-z0-9]+@gmail\.com$" ErrorMessage="Email không hợp lệ" ToolTip="Email không hợp lệ">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="info">Địa chỉ</td>
                <td class="out-txt">
                    <asp:TextBox ID="txt_diachi" CssClass="txt-info" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="lb-tb" align="center" colspan="2">
                    <asp:Label ID="lb_tbao" CssClass="in-lb-tb" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>              
                <td class="out-btndky" colspan="2" align="center">
                    <asp:Button ID="btn_dangky" CssClass="in-btnDK" runat="server" Text="Đăng Ký" OnClick="btn_dangky_Click" />
                </td>
            </tr>
            
        </table>
    </form>
</body>
</html>
