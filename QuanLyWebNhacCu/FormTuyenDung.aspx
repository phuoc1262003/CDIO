<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormTuyenDung.aspx.cs" Inherits="QuanLyWebNhacCu.FormTuyenDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h2 {
            text-align: center;
            font-weight: bold;
            color: #1e272e;
            margin-top:20px;
        }

        .tv {
            width: 100%;
            height: auto;
        }

        .tieude h3 {
            color: #ff9f1a;
            padding-left: 10px;
        }

        .noidung {
            text-align: center;
        }

            .noidung a {
                width: 95%;
                font-size: 20px;
                padding-left: 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                color: #1e272e;
                margin-bottom: 15px;
            }

                .noidung a:hover {
                    color: #e67e22;
                }

            .noidung img {
                padding-left: 10px;
            }

                .noidung img:hover {
                    cursor: pointer;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>TUYỂN DỤNG</h2>
    <div class="tv">
        <div class="tieude">
            <h3>NHÂN VIÊN TƯ VẤN ÂM THANH</h3>
        </div>
        <div class="noidung">
            <img src="images/tdung01.jpg" alt="" />
            <a href="#">Nhân viên âm thanh tư vấn và đưa ra các giải pháp âm thanh</a>
        </div>
    </div>
    <div class="tv">
        <div class="tieude">
            <h3>NHÂN VIÊN TƯ VẤN BÁN HÀNG</h3>
        </div>
        <div class="noidung">
            <img src="images/tdung02.jpg" alt="" />
            <a href="#">Nhân viên bán hàng tư vấn bán nhạc cụ</a>
        </div>
    </div>
</asp:Content>
