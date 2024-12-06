<%@ Page Title="Sản Phẩm" Language="C#" MasterPageFile="~/CustomerHome.Master" AutoEventWireup="true" CodeBehind="FormSanPham.aspx.cs" Inherits="QuanLyWebNhacCu.FormSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .grid {
            background-color:white;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap; 
            
        }

        .product-item {
            width: calc(25% - 10px); 
            margin-top: 10px;
            margin-left:5px;
            margin-right: 5px;
            box-sizing: border-box; 
            border: 1px solid black;
            background-color: #fbc531;
            text-align:center;
        }     
            .product-item img {
                max-width: 100%;
            }
        .hinhanh {
            width: 100%;
            height:260px;
            
        }
        

        .tensp {
            font-size: 20px;
            color: black;
        }

        .buttonCT {
            color: black;
            font-size: 15px;
        }
        .dataPager-container {
            display: flex;
            justify-content: center;
            margin: 20px 0; 
            font-size:20px;
            color:black;
        }       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid">
        <asp:ListView ID="ListView1" runat="server" OnPagePropertiesChanged="ListView1_PagePropertiesChanged" >
            <LayoutTemplate>
                <div class="product-grid">
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <ItemTemplate>

                <div class="product-item">
                    <asp:ImageButton ID="ImageButton1" CssClass="hinhanh" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' CommandArgument='<%# Eval("MaSP") %>' OnClick="ImageButton1_Click" />
                    <asp:LinkButton ID="LinkButton2" CssClass="tensp" runat="server" Text='<%# Eval("TenSP") %>' CommandArgument='<%# Eval("MaSP") %>'  OnClick="LinkButton2_Click"></asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="LinkButton1" CssClass="buttonCT" runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="LinkButton1_Click">Chi tiết sản phẩm</asp:LinkButton>
                </div>

            </ItemTemplate>
        </asp:ListView>
        <div class="dataPager-container">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="16" PagedControlID="ListView1" RenderNonBreakingSpacesBetweenControls="true">
            <Fields>                
                    <asp:NumericPagerField ButtonCount="5"/>                
            </Fields>
        </asp:DataPager>
        </div>
    </div>
    
</asp:Content>
