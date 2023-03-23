<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PFinalVid.aspx.cs" Inherits="final_proj.PFinalVid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .error {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% =content %>
</asp:Content>
