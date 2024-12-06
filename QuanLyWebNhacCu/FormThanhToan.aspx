<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormThanhToan.aspx.cs" Inherits="QuanLyWebNhacCu.FormThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .out-table-main {
            width: 700px;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }


        .head {
            background-color: #f8f8f8;
            padding: 15px;
            border-bottom: 1px solid #ccc;
        }

            .head h3 {
                margin: 0;
                font-size: 24px;
                text-align: center;
            }

        .dl-thanhtoan {
            width: 100%;
        }

        .table-main {
            width: 100%;
            border-collapse: collapse;
        }

            .table-main tr {
                border-bottom: 1px solid #ddd;
            }

            .table-main td {
                padding: 12px;
                text-align: left;
                font-size: 16px;
            }

        .info {
            font-weight: bold;
            background-color: #f2f2f2;
        }

        .in-info {
            background-color: #fff;
        }


        .radio {
            text-align: center;
            margin-top: 15px;
        }


        .in-radiobtn {
            display: inline-block;
            margin: 5px 15px;
        }

        .out-button {
            text-align: center !important;
            margin-top: 20px;
        }

        .in-button {
            background-color: #fbc531;
            color: black;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .in-button:hover {
                background-color: #f2d27a;
            }

        .in-info .in-info-tien {
            color: #d9534f;
        }

        .in-info label {
            font-weight: normal;
        }


        .in-radiobtn input[type="radio"] {
            margin-right: 5px;
        }

        .in-radiobtn i {
            margin-left: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="out-table-main">
    <div class="head">
        <h3>Đơn Hàng của bạn</h3>
    </div>
    <asp:DataList ID="dl_thanhtoan" CssClass="dl-thanhtoan" runat="server">
        <ItemTemplate>
            <table class="table-main">
                <tr>
                    <td class="info">Sản Phẩm</td>
                    <td class="info">Giá</td>
                    <td class="info">Số Lượng</td>
                    <td class="info">Tổng Tiền</td>
                </tr>
                <tr>
                    <td class="in-info">
                        <asp:Label ID="lb_tensp" CssClass="in-in-info" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>(Mã SP: <asp:Label ID="lb_masp" runat="server" Text='<%# Eval("MaSP") %>'></asp:Label>)
                    </td>
                    <td class="in-info">
                        <asp:Label ID="Label1" CssClass="in-in-info" runat="server" Text='<%# Convert.ToDecimal(Eval("DonGia")).ToString("N0") + " vnđ" %>'></asp:Label>
                    </td>
                    <td class="in-info">
                        <asp:Label ID="lb_soluong" CssClass="in-in-info" runat="server" Text='<%# Eval("SoLuongMua") %>'></asp:Label>
                    </td>
                    <td class="in-info">
                        <asp:Label ID="lb_tongtien" CssClass="in-info-tien" runat="server" Text='<%# Convert.ToDecimal(Eval("TongTien")).ToString("N0") + " vnđ" %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="in-info" colspan="4">
                        <div>
                            Ngày đặt hàng:  <asp:Label ID="lb_ngaydathang" CssClass="lb-date" runat="server" ></asp:Label>
                        </div>
                       
                    </td>
                </tr>
                <tr>
                    <td class="cash" colspan="4">Chọn phương thức thanh toán</td>
                </tr>
                <tr>
                    <td class="radio" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList1" CssClass="in-radiobtn" runat="server">
                          
                            <asp:ListItem Text="Tiền mặt" Value="cash">Thanh toán khi nhận hàng<i class="fa-solid fa-money-check-dollar"></i></asp:ListItem>
                            <asp:ListItem Text="ATM" Value="atm">Thanh toán bằng ví điện tử<i class="fa-solid fa-wallet"></i></asp:ListItem>
                            <asp:ListItem Text="Ví điện tử" Value="ewallet">Thanh toán tài khoản ngân hàng<i class="fa-regular fa-credit-card"></i></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="out-button" colspan="4">
                        <asp:Button ID="btn_dathang" CssClass="in-button" runat="server" Text="ĐẶT HÀNG" CommandArgument='<%# Eval("MaSP") %>' OnClick="btn_dathang_Click" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</div>
</asp:Content>
