<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="QLThongKe.aspx.cs" Inherits="QuanLyWebNhacCu.QLThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="out-table-main">
        <div class="tieude">
            <h3>QUẢN LÝ ĐƠN HÀNG</h3>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <div>
                            <h4>Thống kê theo ngày</h4>
                        </div>
                    </td>
                    <td>
                        <div>
                            <h4>Thống kê theo tháng</h4>
                            <asp:DropDownList ID="DropDownList1" runat="server">

                                <asp:ListItem Text="1"></asp:ListItem>
                                <asp:ListItem Text="2"></asp:ListItem>
                                <asp:ListItem Text="3"></asp:ListItem>
                                <asp:ListItem Text="4"></asp:ListItem>
                                <asp:ListItem Text="5"></asp:ListItem>
                                <asp:ListItem Text="6"></asp:ListItem>
                                <asp:ListItem Text="7"></asp:ListItem>
                                <asp:ListItem Text="8"></asp:ListItem>
                                <asp:ListItem Text="9"></asp:ListItem>
                                <asp:ListItem Text="10"></asp:ListItem>
                                <asp:ListItem Text="11"></asp:ListItem>
                                <asp:ListItem Text="12"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </td>
                   <td>
                       <asp:Button ID="btn_thongke" runat="server" Text="Count" />
                   </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="grid_sanpham" runat="server" CssClass="grid-giohang" AutoGenerateColumns="False" Width="100%">
            <Columns>
                <asp:BoundField DataField="MaDH" HeaderText="MaDH" />
                <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" />
                <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                <asp:BoundField DataField="MaSP" Visible="false" />
                <asp:BoundField DataField="SoLuongSPM" HeaderText="Số Lượng" />
                <asp:BoundField DataField="DonGia" HeaderText="Giá" DataFormatString="{0:N0} vnđ" HtmlEncode="false" />
                <asp:BoundField DataField="NgDatHang" HeaderText="Ngày Đặt Hàng" />
                <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0} vnđ" HtmlEncode="false" />
            </Columns>
        </asp:GridView>
        <div>
            <h4>Tổng doanh thu</h4>
            <asp:Label ID="lb_doanhthu" runat="server" Text=""></asp:Label>
        </div>
    </div>--%>
</asp:Content>
