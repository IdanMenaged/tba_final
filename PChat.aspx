<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PChat.aspx.cs" Inherits="final_proj.PChat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            max-width: 300px;
            max-height: 500px;
            background-image: url(res/post_it_note.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }

        .card > header {
            position: relative;
            top: 10px;
            direction: ltr;
        }

        .flex-container {
            display: flex;
            gap: 20px;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% =notLoggedInMsg %>

    <div class="flex-container">
        <% =content %>
    </div>
</asp:Content>
