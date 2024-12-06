<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="QLDonHang.aspx.cs" Inherits="QuanLyWebNhacCu.QLDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .out-table-main {
            max-width: 1500px;
            margin: 20px auto;
            border: 1px solid #ddd;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .tieude {
            padding: 20px;
            text-align: center;
        }

            .tieude h3 {
                font-size: 24px;
                font-weight: bold;
                color: #333;
            }

        .grid-giohang {
            width: 100%;
            margin-top: 20px;
        }

            .grid-giohang th, .grid-giohang td {
                padding: 3px;
                border: 1px solid #ddd;
                text-align: center;
            }

            .grid-giohang th {
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: center;
                font-size: 15px;
            }

        .in-img {
            max-width: 100px;
            object-fit: cover;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .sodt{
            width: 80px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
            justify-content: center;
        }
        .sodt:focus{
            outline:none;
        }
        .diachi {
            width: 90px;
            height:100px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
            justify-content: center;
        }
        .diachi:focus{
            outline:none;
        }

        .out-table-main .Columns {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

            .out-table-main .Columns .grid-giohang {
                flex: 1;
            }

        .btnXoa, .btnSua {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px 0;
            border-radius: 5px;
            cursor: pointer;
        }

            .btnXoa:hover, .btnSua:hover {
                background-color: #f35c5c;
            }

        .btn_Capnhat {
            background-color: #fbc531;
            color: black;
            border: none;
            margin: 5px 0;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

            .btn_Capnhat:hover {
                background-color: #f5d06d;
            }
        .droplist:focus{
            outline:none;
        }
         .validation{
            font-size:10px;
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-table-main">
        <div class="tieude">
            <h3>QUẢN LÝ ĐƠN HÀNG</h3>
        </div>
        <asp:GridView ID="grid_sanpham" runat="server" CssClass="grid-giohang" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <asp:BoundField DataField="MaDH" HeaderText="MaDH" />
            <asp:TemplateField HeaderText="Ảnh SP">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" CssClass="in-img" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
            <asp:BoundField DataField="MaSP" Visible="false" />
            <asp:BoundField DataField="DonGia" HeaderText="Giá" DataFormatString="{0:N0} vnđ" HtmlEncode="false" />
            <asp:BoundField DataField="SoLuongSPM" HeaderText="Số Lượng" />
            <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" />
            <asp:TemplateField HeaderText="SDT">
                <ItemTemplate>
                    <asp:TextBox ID="txt_sdt" CssClass="sodt" runat="server" Text='<%# Eval("SoDT") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="validation" runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ControlToValidate="txt_sdt" ValidationExpression="^0[3-9]\d{8}$" ToolTip="Sai định dạng SDT">*Error</asp:RegularExpressionValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa Chỉ">
                <ItemTemplate>
                    <asp:TextBox ID="txt_diachi" CssClass="diachi" runat="server" TextMode="MultiLine" MaxLength="500" Rows="5" Text='<%# Eval("DiaChi") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation" runat="server" Display="Dynamic" ControlToValidate="txt_diachi" ErrorMessage="RequiredFieldValidator" ToolTip="Không được để trống">*Error</asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="NgDatHang" HeaderText="Ngày Đặt Hàng" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0} vnđ" HtmlEncode="false" />
             <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" />
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:DropDownList CssClass="droplist" ID="DropDownList1" runat="server">
                        <asp:ListItem Text="Chờ phê duyệt"></asp:ListItem>
                        <asp:ListItem Text="Đang giao hàng"></asp:ListItem>
                        <asp:ListItem Text="Đã giao"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btn_capnhat" CssClass="btn_Capnhat" runat="server" Text="Cập Nhật" OnClick="btn_capnhat_Click" CommandArgument='<%# Eval("MaDH") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:Button ID="btn_xoa" CssClass="btnXoa" runat="server" Text="Xóa" CommandArgument='<%# Eval("MaDH") %>' OnClick="btn_xoa_Click" />
                    <asp:Button ID="btn_sua" CssClass="btnSua" runat="server" Text="Sửa" CommandArgument='<%# Eval("MaDH") %>' OnClick="btn_sua_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
