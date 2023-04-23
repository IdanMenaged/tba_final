<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PHome.aspx.cs" Inherits="final_proj.PHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .banner {
            width: 100%;
            height: 100%;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>רשומים</p>
    <h2><% =usersCount %></h2>
    <p>משתמשים לאתר</p>
    <img class="banner" src="res/home-page-banner.jpg" />
</asp:Content>
