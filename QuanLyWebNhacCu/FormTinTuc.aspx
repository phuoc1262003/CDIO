<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormTinTuc.aspx.cs" Inherits="QuanLyWebNhacCu.FormTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h2 {
            text-align: center;
            font-weight: bold;
            color: #1e272e;
            margin-top:20px;
        }

        .tintuc {
            width: 100%;
            height: auto;
        }

        .list {
            width: 100%;
            display: flex;
        }

            .list .khoi {
                width: 25%;
                margin-right: 25px;
            }

        .khoi img {
            width: 100%;
        }

            .khoi img:hover {
                cursor: pointer;
            }

        .khoi a {
            display: inline-block;
            width: 100%;
            text-align: justify;
            text-decoration: none;
            color: #1e272e;
        }

            .khoi a:hover {
                color: #e67e22;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>TIN TỨC</h2>
    <div class="tintuc">
        <h3>TƯ VẤN PIANO</h3>
        <div class="list">
            <div class="khoi">
                <img src="./images/tvp01.jpg" alt="" />
                <a href="#">Thông tin chi tiết các sản phẩm thuộc Casio AP new series</a>
            </div>
            <div class="khoi">
                <img src="./images/tvp02.jpg" alt="" />
                <a href="#">Những điểm ưu việt của piano Kawai ND-21 trong phân khúc 100
              triệu</a>
            </div>
            <div class="khoi">
                <img src="./images/tvp03.jpg" alt="" />
                <a href="#">Casio CELVIANO AP-S450, AP-550</a>
            </div>
            <div class="khoi">
                <img src="./images/tvp04.jpg" alt="" />
                <a href="#">Tất cả những gì bạn cần biết về Casio PX-S7000</a>
            </div>
        </div>
        <h3>TƯ VẤN GUITAR</h3>
        <div class="list">
            <div class="khoi">
                <img src="./images/tvg01.jpg" alt="" />
                <a href="#">Top đàn guitar acoustic chất lượng tốt dưới 3 triệu</a>
            </div>
            <div class="khoi">
                <img src="./images/tvg02.jpg" alt="" />
                <a href="#">Fender kỷ niệm 70 năm Stratocaster với các mẫu phiên bản giới hạnvà màu sắc mới</a>
            </div>
            <div class="khoi">
                <img src="./images/tvg03.jpg" alt="" />
                <a href="#">Cây guitar Fender Stratocaster màu đen của David Gilmour</a>
            </div>
            <div class="khoi">
                <img src="./images/tvg04.jpg" alt="" />
                <a href="#">Guitar là sự tinh tế và kết nối</a>
            </div>
        </div>
        <h3>TƯ VẤN DRUM</h3>
        <div class="list">
            <div class="khoi">
                <img src="./images/tvd01.png" alt="" />
                <a href="#">Alesis Debut Kit có mọi thứ mà một đứa trẻ mới bắt đầu chơi trống
              cần</a>
            </div>
            <div class="khoi">
                <img src="./images/tvd02.jpg" alt="" />
                <a href="#">Thương hiệu Alesis trên thị trường trống điện tử</a>
            </div>
            <div class="khoi">
                <img src="./images/tvd03.jpg" alt="" />
                <a href="#">Alesis Strata Prime: Bộ trống điện tử mười mảnh với module trống
              màn hình cảm ứng</a>
            </div>
            <div class="khoi">
                <img src="./images/tvd04.jpg" alt="" />
                <a href="#">Meinl MCAJ300BK - Trống cajon được nhiều người chơi ưa chuộng</a>
            </div>
        </div>
    </div>
</asp:Content>
