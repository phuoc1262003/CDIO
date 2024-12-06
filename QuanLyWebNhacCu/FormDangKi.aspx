<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDangKi.aspx.cs" Inherits="QuanLyWebNhacCu.FormDangKi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Ký</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            top: 20%;
            left: 10%;
        }

        .out-dangky {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
        }

        .out-with-username {
            text-align: center;
            padding: 25px 0px;
        }

        .out-btn-tieptuc {
            text-align: center;
            padding: 0px 0px 25px 0px;
        }

        .btn-tieptuc {
            border: 1px solid #EED3E5;
            padding: 5px 15px;
            color: #B13A07;
            font-weight: bold;
            background-color: #EED3E5;
            border-radius: 10px;
        }

            .btn-tieptuc:hover {
                cursor: pointer;
                background-color: #F4B9E0;
                color: #A23A0D;
            }

        .out-btn-dangnhap {
            text-align: center;
            font-size: 13px;
        }

        .btn-dangnhap {
            color: red;
            text-decoration: underline;
        }

        .in-text-dangnhap {
        }

        .out-hoac {
            text-align: center;
            padding: 30px 0px 15px 0px;
        }

        .in-hoac {
            color: #898181;
        }

        .out-sdt {
        }

        .in-sodt {
            border: 1px solid #EED3E5;
            background-color: #EED3E5;
            padding: 5px 15px;
            border-radius: 10px;
            color: black;
        }
        .in-sodt:hover{
                background-color: #F4B9E0;
        }

            .in-sodt i {
                margin-right: 5px;
            }

        .out-email {
        }

        .in-email {
            border: 1px solid #EED3E5;
            background-color: #EED3E5;
            padding: 5px 15px;
            border-radius: 10px;
            color: black;
        }
        .in-email:hover{
             background-color: #F4B9E0;
        }
            .in-email i {
                margin-right: 5px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="signin">
            <tr>
                <td colspan="2" class="out-dangky">Đăng Ký</td> 
            </tr>
            <tr>
                <td colspan="2" class="out-with-username">Tạo tài khoản với tên người dùng!</td>
            </tr>
            <tr>
                <td colspan="2" class="out-btn-tieptuc">
                    <asp:LinkButton ID="btnTiepTuc" CssClass="btn-tieptuc" runat="server" OnClick="btnTiepTuc_Click">Tiếp tục</asp:LinkButton>
                </td>
            </tr>
             <tr>
                <td colspan="2" class="out-btn-dangnhap">
                    <div class="in-text-dangnhap">Bạn đã có tài khoản? <asp:LinkButton ID="btnDangNhap" CssClass="btn-dangnhap" runat="server" OnClick="btnDangNhap_Click">Đăng nhập ngay</asp:LinkButton></div>
                </td>
            </tr>
             <tr>
                <td colspan="2" class="out-hoac">
                    <div class="in-hoac">Hoặc</div>
                </td>
            </tr>
             <tr>
                <td class="out-sdt">
                    <asp:LinkButton ID="btndk_sdt" CssClass="in-sodt" runat="server" OnClick="btndk_sdt_Click"><i class="fa-solid fa-square-phone"></i>Số điện thoại</asp:LinkButton>
                </td>
                 <td class="out-email">
                    <asp:LinkButton ID="btndk_email" CssClass="in-email" runat="server" OnClick="btndk_email_Click"><i class="fa-solid fa-square-envelope"></i>Email</asp:LinkButton>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
