<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PForgotPassword.aspx.cs" Inherits="final_proj.PForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" runat="server">
        <label>
            שם משתמש
            <input type="text" name="uName" required />
        </label>
        <input type="submit" name="submit" value="שלח.י" />
    </form>

    <% =msg %>
</asp:Content>
