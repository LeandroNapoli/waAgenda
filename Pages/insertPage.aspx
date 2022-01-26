<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Principal.Master" AutoEventWireup="true" CodeBehind="insertPage.aspx.cs" Inherits="waAgenda.Pages.insertPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Insira aqui os dados </h1>

    <div>
        <asp:Label ID="nameNewUser" runat="server" Text="Nome: "></asp:Label>
        <asp:TextBox ID="nameBox" runat="server" Width="20%" CssClass="col-sm-1"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Label ID="emailNewUser" runat="server" Text="E-mail: "></asp:Label>
        <asp:TextBox ID="emailBox" runat="server" Width="20%" CssClass="col-sm-1"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Label ID="phoneLabel" runat="server" Text="Telefone: "></asp:Label>
        <asp:TextBox ID="phoneBox" runat="server" Width="20%" TextMode="Phone" CssClass="col-sm-1"></asp:TextBox>
    </div>
    <br />
    <div>

        <asp:Button ID="btnInsert" runat="server" Text="Inserir Contato" OnClick="btnInsert_Click1" CssClass="btn btn-info" />

    </div>

</asp:Content>
