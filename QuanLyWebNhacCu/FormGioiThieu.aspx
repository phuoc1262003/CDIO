<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormGioiThieu.aspx.cs" Inherits="QuanLyWebNhacCu.FormGioiThieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h2 {
            text-align: center;
            padding-top: 10px;
            font-size: 32px;
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .giothieu {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

            .giothieu .tieude h3 {
                font-size: 28px;
                color: #1a73e8;
                text-align: center;
                margin-bottom: 20px;
                text-transform: uppercase;
                font-weight: bold;
            }

            .giothieu .noidung p {
                font-size: 18px;
                line-height: 1.8;
                color: #555;
                margin-bottom: 20px;
                text-align: justify;
            }

            .giothieu .noidung img {
                display: block;
                max-width: 100%;
                height: auto;
                margin: 20px auto;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>GIỚI THIỆU</h2>
    <div class="giothieu">
        <div class="tieude">
            <h3>TỔNG QUAN</h3>
        </div>
        <div class="noidung">
            <p>WP03 Music được ra đời vào năm 2020 và thành lập chính thức vào năm 2022 với khởi nguồn từ Trường Suối Nhạc trường tư thục âm nhạc đầu tiên tại Việt Nam. 
            </p>
            <p>Tương tự như hệ thống phân phối nhạc cụ, chúng tôi phát triển thương hiệu Suối Nhạc phủ rộng tại nhiều địa bàn trong cả nước để đáp ứng nhu cầu học nhạc.
               Danh mục sản phẩm đầu tiên của WP03 Music là những cây Đàn organ và Piano mới toanh của Casio và Kawai Nhật Bản được giới thiệu tại thị trường Việt Nam.
            </p>
            <img src="./images/4.jpg" alt="" />
            <p>Là một trong những công ty phân phối Nhạc cụ có mặt đầu tiên tại thị trường Việt Nam, Shop Music luôn nỗ lực phát triển bền vững và cùng Việt Nam “Tiến tới tương lai”. 
               Với nền tảng kiến thức âm nhạc, sự kết hợp làm việc của toàn thể nhân viên dựa trên phương châm Quyền lợi của Khách hàng là quan trọng nhất, WP03 Music đã, đang và sẽ 
               không ngừng cung cấp cho đối tác và người tiêu dùng giá trị đích thực với những Sản phẩm và Dịch vụ có chất lượng cao đạt tiêu chuẩn quốc tế với mứcgiá hợp lý nhất và 
               dịch vụ sau bán hàng hoàn hảo. Chúng tôi tin tưởng sẽ luôn mang đến sự hài lòng cao nhất cho khách hàng, cũng như đóng góp tích cực cho sự phát triển của ngành Âm nhạc Việt Nam.
            </p>
        </div>
    </div>
</asp:Content>
