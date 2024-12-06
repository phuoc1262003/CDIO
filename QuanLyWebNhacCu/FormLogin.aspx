<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormLogin.aspx.cs" Inherits="QuanLyWebNhacCu.FormLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Nhập</title>
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
        .login {
            position: absolute;
            top: 20%;
            left: 10%;
        }
        .tieudeDN {
            padding-bottom: 30px;
            font-size: 40px;
            font-weight: bold;
        }
        .infoDN {
            font-size: 15px;
            padding: 10px 30px 10px 0px;
        }
        .in-infoDN {
            font-size: 20px;
            color: black;
        }
        .buttonDN {
            text-align: center;
            padding: 30px;
        }
        .textInput {
            background-color: #F7F3F3;
            border: 1px solid #ddd;
            padding: 5px 15px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }
        .textInput:focus{
            outline:none;
            
        }
        
        .in-buttonDN {
            padding: 5px 15px;
            background-color: #EED3E5;
            color: #B13A07;
            font-weight: bold;
            font-size: 18px;
            border: none;
            border-radius: 10px;
        }
        .in-buttonDN:hover{
            cursor:pointer;
            background-color:#F4B9E0;
            color:#A23A0D;
        }
        .buttonDK{
            text-align: center;
        }
        .in-buttonDK {
            margin-left: 5px;
            color: #2D88F3;
            text-decoration: underline;
        }
        .in-buttonDK:hover{
            cursor:pointer;
        }

        .in-infoDK{
            font-size: 15px;
        }
        .lb-tbloi{
            font-size:30px;
            color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Login ID="Login1" CssClass="login" runat="server"  Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="Login1_Authenticate">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LayoutTemplate>
                <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0">
                                <tr>
                                    <td class="tieudeDN" align="center" colspan="2">Đăng Nhập</td>
                                </tr>
                                <tr>
                                    <td class="infoDN" align="right">
                                        <asp:Label ID="UserNameLabel" CssClass="in-infoDN" runat="server" AssociatedControlID="UserName">Tên đăng nhập</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" CssClass="textInput" runat="server" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" CssClass="lb-tbloi" Display="Dynamic" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="Phải Nhập UserName" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoDN" align="right">
                                        <asp:Label ID="PasswordLabel" CssClass="in-infoDN" runat="server" AssociatedControlID="Password" >Mật khẩu</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" CssClass="textInput" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" CssClass="lb-tbloi" Display="Dynamic" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Phải Nhập Password" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Label ID="lb_thongbao" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="buttonDN" colspan="2">
                                        <asp:Button ID="LoginButton" CssClass="in-buttonDN" runat="server" CommandName="Login" Text="Đăng Nhập" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="buttonDK" align="right" colspan="2">
                                        <div class="in-infoDK">Bạn đã có tài khoản chưa?<asp:LinkButton CssClass="in-buttonDK" ID="bntdangky" runat="server" OnClick="bntdangky_Click">Đăng ký</asp:LinkButton></div>                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
    </form>
</body>
</html>
