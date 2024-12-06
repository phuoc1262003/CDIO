<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="FormAdmin.aspx.cs" Inherits="QuanLyWebNhacCu.FormAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .hinhnen {
    position: relative;
    width: 100%;
    height: 90vh;
    overflow: hidden;
}

.hinhnen img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
}

.hinhnen::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.7));
    z-index: 1;
}

.hinhnen h2 {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%); /*căn giưa dọc ngang*/
    color: white;
    font-size: 48px;
    font-weight: bold;
    z-index: 2;
    text-align: center;
    text-transform: uppercase;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hinhnen">
        <img alt="" src="./images/anhnendep.jpg" />
    </div>
</asp:Content>
