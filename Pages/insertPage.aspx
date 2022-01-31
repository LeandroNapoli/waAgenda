﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Principal.Master" AutoEventWireup="true" CodeBehind="insertPage.aspx.cs" Inherits="waAgenda.Pages.insertPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <h3>Insira aqui os dados </h3>
        <br />
    </div>

    <div class="col-md-12">
        <asp:Label ID="nameNewUser" runat="server" Text="Nome: " CssClass="col-md-1"></asp:Label>
        <asp:TextBox ID="nameBox" runat="server" Width="20%" CssClass="col-md-11"></asp:TextBox>
    </div>
    <br />
    <br />

    <div class="col-md-12">
        <asp:Label ID="emailNewUser" runat="server" Text="E-mail: " CssClass="col-md-1"></asp:Label>
        <asp:TextBox ID="emailBox" runat="server" Width="20%" CssClass="col-md-11"></asp:TextBox>
    </div>
    <br />
    <br />

    <div class="col-md-12">
        <asp:Label ID="phoneLabel" runat="server" Text="Telefone: " CssClass="col-md-1"></asp:Label>
        <asp:TextBox ID="phoneBox" runat="server" Width="20%" TextMode="Phone" CssClass="col-md-11"></asp:TextBox>
    </div>
    <br />
    <br />

    <div>

        <asp:Button ID="btnInsert" runat="server" Text="Inserir Contato" OnClick="btnInsert_Click1" CssClass="btn btn-info" />

    </div>

</asp:Content>

<asp:Content ID="Scripts" runat="server" ContentPlaceHolderID="JavaScriptContent">
    <script src="../Content/CustomJs/InsertPage.js"></script>
</asp:Content>
