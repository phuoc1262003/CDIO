<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QuanLyWebNhacCu.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nhaccu {
            width: 100%;
            height: auto;
        }

        .tieude {
            font-size: 20px;
            margin-top: 20px;
            padding-left: 20px;
        }

        .dlnhaccu {
            width: 100%;
            height: auto;
            text-align: center;
        }

            .dlnhaccu td {
                width: 33%;
                padding-left: 50px;
            }

        .hinhanh {
            display: block;
            width: 90%;
            height: 300px;
            margin-top: 20px;
        }

        .tenloai {
            font-size: 17px;
            text-transform: uppercase;
            color: black;
            background-color: #fbc531;
            border-radius: 10px;
            padding: 5px 15px;
        }

        .slide {
            animation: bgslide 10s infinite;
            width: 100%;
            height: 300px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        @keyframes bgslide {
            0% {
                background-image: url(./images/hinh5.png);
            }

            20% {
                background-image: url(./images/hinh1.jpg);
            }

            40% {
                background-image: url(./images/hinh2.png);
            }

            60% {
                background-image: url(./images/hinh3.png);
            }

            80% {
                background-image: url(./images/hinh6.png);
            }

            100% {
                background-image: url(./images/hinh5.png);
            }
        }

        /*        footer {
            width: 100%;
            height: auto;
            background-color: #1e272e;
            margin-top: 15px;
        }

        .bottom {
            width: 80%;
            height: auto;
            padding: 10px 0;
            margin: auto;
            display: flex;
            border-bottom: 2px solid #f5f6fa;
        }

        .khoi {
            width: 20%;
            height: auto;
            color: #f5f6fa;
            margin-left: 100px;
            padding: 10px 0;
            gap: 20px;
        }

            .khoi .top {
                width: 100%;
                height: auto;
                text-transform: uppercase;
            }

            .khoi .bot {
                width: 100%;
                height: auto;
            }

        .top h4 {
            text-transform: uppercase;
            padding-bottom: 10px;
        }

        .bot ul li {
            list-style-type: none;
        }

            .bot ul li a {
                display: inline-block;
                padding-bottom: 10px;
                cursor: pointer;
                transition: 0.5s;
                font-size: 12px;
            }

                .bot ul li a:hover {
                    color: #f9ca24;
                    font-weight: bold;
                    font-size: 15px;
                }

        .info {
            width: 80%;
            height: auto;
            padding: 10px 0;
            margin: auto;
        }

            .info h4 {
                color: #f5f6fa;
                text-align: center;
            }*/
        /* Footer */
        footer {
            width: 100%;
            background-color: #1e272e;
            color: #f5f6fa;
            padding: 40px 0;
            margin-top: 50px;
            text-align: center;
        }

            footer .bottom {
                display: flex;
                justify-content: space-around;
                padding-bottom: 20px;
                border-bottom: 2px solid #f5f6fa;
            }

            footer .khoi {
                width: 20%;
            }

                footer .khoi h4 {
                    font-size: 18px;
                    text-transform: uppercase;
                    margin-bottom: 15px;
                }

                footer .khoi ul {
                    list-style-type: none;
                    padding: 0;
                }

                    footer .khoi ul li {
                        margin-bottom: 10px;
                    }

                        footer .khoi ul li a {
                            color: #f5f6fa;
                            text-decoration: none;
                            font-size: 14px;
                            transition: 0.3s;
                        }

                            footer .khoi ul li a:hover {
                                color: #fbc531;
                            }

            footer .info h4 {
                margin-top: 20px;
                font-size: 14px;
                text-transform: uppercase;
            }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="slide"></div>
    <div class="nhaccu">
        <div class="tieude">NHẠC CỤ</div>
        <asp:DataList ID="dl_nhaccu" CssClass="dlnhaccu" runat="server" RepeatColumns="3">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" CssClass="hinhanh" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' CommandArgument='<%# Eval("MaLSP") %>' OnClick="ImageButton1_Click" />
                <br />
                <asp:LinkButton ID="LinkButton1" CssClass="tenloai" runat="server" Text='<%# Eval("TenLoai") %>' CommandArgument='<%# Eval("MaLSP") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <footer>
        <div class="bottom">
            <div class="khoi">
                <div class="top">
                    <h4>Thông tin cửa hàngg</h4>
                </div>
                <div class="bot">
                    <ul>
                        <li>
                            <asp:HyperLink ID="HyperLink8" runat="server">Giới thiệu cửa hàng</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink9" runat="server">Hệ thống showroom, đại lý</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink10" runat="server">Liên hệ / Góp ý</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink11" runat="server">Điều khoản sử dụng website</asp:HyperLink></li>
                    </ul>
                </div>
            </div>
            <div class="khoi">
                <div class="top">
                    <h4>Hỗ trợ nhạc cụ</h4>
                </div>
                <div class="bot">
                    <ul>
                        <li>
                            <asp:HyperLink ID="HyperLink12" runat="server">Giao hàng - đổi trả</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink13" runat="server">Bảo trì đàn Piano</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink14" runat="server">Bảo trì đàn Guitar</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink15" runat="server">Kích hoạt bảo hành</asp:HyperLink></li>
                    </ul>
                </div>
            </div>
            <div class="khoi">
                <div class="top">
                    <h4>Hỗ trợ khách hàng</h4>
                </div>
                <div class="bot">
                    <ul>
                        <li>
                            <asp:HyperLink ID="HyperLink16" runat="server">Gọi mua hàng: 1800 6715 (Miễn Phí)</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink17" runat="server">Khiếu nại, Bảo hành:028710 88333</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink18" runat="server">Thời gian phục vụ: 8h-22h</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink19" runat="server">Emai: info@wp03music.vn</asp:HyperLink></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="info">
            <h4>NoCopyRight - Designed And Coded By HuynhPhuoc</h4>
        </div>
    </footer>
</asp:Content>
