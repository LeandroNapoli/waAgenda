<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Principal.Master" AutoEventWireup="true" CodeBehind="editUser.aspx.cs" Inherits="waAgenda.Pages.editContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Edite os dados aqui</h1>

    <div>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-offset-0">
                    <asp:Label runat="server" Text="Nome: "></asp:Label>
                    <asp:TextBox ID="NameUser" runat="server"></asp:TextBox>
                </div>
                    <br />
                <div>
                    <asp:Label runat="server" Text="E-mail: "></asp:Label>
                    <asp:TextBox ID="EmailUser" runat="server"></asp:TextBox>
                </div>
                    <br />
                <div>

                    <asp:Label runat="server" Text="Telefone: "></asp:Label>
                    <asp:TextBox ID="PhoneUser" runat="server"></asp:TextBox>
                </div>
                    <br />
                <br />
                <asp:Button ID="btnSalvaUsuario" runat="server" type="submit" CssClass="btn btn-success" Text="Salvar Alterações" OnClick="btnSalvaUsuario_Click"/>

            </div>
        </div>
    </div>
</asp:Content>
