<%@ Page Title="Hỗ Trợ Khách Hàng" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormHoTro.aspx.cs" Inherits="QuanLyWebNhacCu.FormHoTro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main {
            background-color: #f7f7f7;
        }

        /* Căn chỉnh chung cho tiêu đề */
        h2 {
            text-align: center;
            font-weight: bold;
            color: #1e272e;
            padding-top: 20px;
            font-size: 28px;
            text-transform: uppercase;
        }

        .noidung {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .thongtin {
            width: 80%;
            background-color: #ffffff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

            .thongtin h3 {
                color: #ff9f1a;
                font-size: 22px;
                margin-top: 30px;
                margin-bottom: 10px;
                text-align: left;
                font-weight: bold;
                text-transform: uppercase;
            }

            .thongtin pre {
                color: #2f3640;
                font-size: 16px;
                background-color: #f1f2f6;
                padding: 15px;
                border-radius: 8px;
                white-space: pre-wrap;
                line-height: 1.6;
                margin: 10px 0 30px;
            }

                .thongtin pre span {
                    font-weight: bold;
                    color: #3498db;
                }

            .thongtin h3:hover {
                color: #e67e22;
                cursor: pointer;
                transition: 0.3s;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <h2>Hỗ Trợ</h2>
        <div class="noidung">
            <div class="thongtin">
                <h3>Hỗ Trợ Sửa Đàn Guitar</h3>
                <pre>
                * Các bạn có thể liên hệ qua SDT hoặc đem trực tiếp đến cửa hàng:
                * <span>Email:</span> info@huynhphuoc.vn
                * <span>Facebook:</span> hphuuoc.1203
                * <span>Địa chỉ:</span> 344 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng
            </pre>
                <h3>Hỗ Trợ Bảo Hành</h3>
                <pre>
                * Các bạn có thể liên hệ qua SDT hoặc đem trực tiếp đến cửa hàng:
                * <span>Email:</span> info@huynhphuoc.vn
                * <span>Facebook:</span> hphuc.www
                * <span>Địa chỉ:</span> 344 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng
            </pre>
                <h3>Hỗ Trợ Đổi Trả</h3>
                <pre>
                * Các bạn có thể liên hệ qua SDT hoặc đem trực tiếp đến cửa hàng nếu đàn có vấn đề gì cần đổi trả:
                * <span>Email:</span> info@huynhphuoc.vn
                * <span>Facebook:</span> hphuoc.1203
                * <span>Địa chỉ:</span> 344 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng
            </pre>
            </div>
        </div>
    </div>
</asp:Content>
