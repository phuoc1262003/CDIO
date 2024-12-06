<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="QuanLyWebNhacCu.QLSanPham" %>
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

        .tieude{
                padding: 20px;
    text-align: center;
        }
        .tieude h3{

        }
        .out-main{
            width:100%;
        }
        
            
        
       .table-left{
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

      
       

            
        /*grid view*/
         .rigth{

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



            .gridview .image-column {
                max-width: 100px;
                object-fit: cover; /* Đảm bảo hình ảnh được cắt theo kích thước khung */
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            .img-table{
                max-width: 120px;
                object-fit: cover; 
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            .user-btn i{
            color:black;
            cursor:pointer;
        }
        .user-btn i:hover{
            color:#fbc531;
            cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-table-main">
        <div class="tieude">
            <h3>QUẢN LÝ SẢN PHẨM</h3>
        </div>
        <div class="out-main">
            <div class="left">
                <table class="table-left">
                    <tr>
                        <td class="info">Mã SP</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_masp" CssClass="in-txt" runat="server"></asp:TextBox>
                        </td>
                         <td class="info">Loại SP</td>
                        <td class="out-droplist">
                            <asp:DropDownList ID="DropDownList" CssClass="in-droplist" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="info">Tên SP</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_tensp" CssClass="in-txt" runat="server"></asp:TextBox>
                        </td>
                        <td class="info">Số Lượng</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txt_soluong" CssClass="in-txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="info">Mô Tả</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txtmota" CssClass="in-txt" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </td>
                        <td class="info">Giá Sản Phẩm</td>
                        <td class="out-txt">
                            <asp:TextBox ID="txtgia" CssClass="in-txt" runat="server"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="info" colspan="2" style="text-align:right!important;">Hình Ảnh Sản Phẩm</td>
                        <td class="out-upfile" colspan="2">
                            <asp:Image ID="images" CssClass="img-table" runat="server" />
                            <asp:FileUpload ID="FileUpload1" CssClass="in-upfile" runat="server" />
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
                            <asp:Button ID="btn_sua" CssClass="in-btn" runat="server" Text="Sửa" OnClick="btn_sua_Click" />
                        </td>
                        <td class="out-btn">
                            <asp:Button ID="btn_lammoi" CssClass="in-btn" runat="server" Text="Làm Mới" OnClick="btn_lammoi_Click" />
                        </td>
                    </tr>
                    
                </table>
            </div>
            <div class="right">
                <asp:GridView ID="grid_sanpham" runat="server" CssClass="gridview" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_sanpham_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-pen-to-square"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã SP" HtmlEncode="false" />
                        <asp:BoundField DataField="MaLSP" HeaderText="Loại SP" HtmlEncode="false" />
                        <asp:BoundField DataField="TenSP" HeaderText="Tên SP" HtmlEncode="false" />
                        <asp:BoundField DataField="DonGia" HeaderText="Giá" DataFormatString="{0:N0} vnđ" />
                        <asp:BoundField DataField="SoLuongSP" HeaderText="Số Lượng" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" HtmlEncode="false" />
                        <asp:TemplateField HeaderText="Ảnh SP">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" CssClass="image-column" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
