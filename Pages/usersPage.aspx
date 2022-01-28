<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Principal.Master" AutoEventWireup="true" CodeBehind="usersPage.aspx.cs" Inherits="waAgenda.Pages.contactsPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="col-md-12">
            <div class="col-md-offset-0">
                <div class="row">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ItemType="waAgenda.Models.User" CssClass="table table-bordered table-hover">

                        <Columns>
                            <%--<asp:BoundField DataField="Name" HeaderText="Nome" />--%>
                            <%--<asp:BoundField DataField="Email" HeaderText="Email" />--%>
                            <asp:TemplateField SortExpression="Nome">
                                <HeaderTemplate>
                                    <div class="text-center">
                                        Nome
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server">
                                            <%# Item.Name %> 
                                        </asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <div class="text-center">
                                        Email 
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="col-sm-6">
                                        <asp:Label runat="server">
                                    <%# Item.Email %>
                                        </asp:Label>
                                    </div>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="Phone" HeaderText="Telefone" />--%>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <div class="text-center">
                                        Telefone
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server">
                                            <%# Item.Phone %>
                                        </asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Opções 
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-3">
                                                <asp:LinkButton ID="lkbEditarUsuario" ClientIDMode="Static" runat="server" OnClick="lkbEditarUsuario_Click" CssClass="btn btn-primary" CommandArgument="<%# Item.IdUser %>" Text="Editar"></asp:LinkButton>
                                            </div>
                                            <div class="col-md-9">
                                                <button id="lkbDeletarUsuario_<%# Item.IdUser %>" type="button" clientidmode="Static" class="btn btn-danger abrir-modal-delete" onclick="abreModalDelete(<%# Item.IdUser %>)" data-toggle="popover" data-target="#exampleModalCenter">Deletar</button>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>

                            </asp:TemplateField>


                        </Columns>

                    </asp:GridView>

                    <%-- <asp:DropDownList ID="Drop1" runat="server" OnSelectedIndexChanged="Drop1_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>--%>

                    <%-- <div>
                        <asp:Label ID="Label1" runat="server" CssClass="abrir-modal-delete">

                            TESTANDO O LABEL
                        </asp:Label>
                    </div>--%>
                </div>
                <div class="row">

                    <br />
                    <asp:Button ID="btnAddUser" runat="server" Text="Adicionar Usuário" OnClick="AddUser_Click" CssClass="btn btn-success" />

                </div>
            </div>
        </div>
    </div>


    <!-- Button trigger modal -->
    <button id="button" type="button" class="btn btn-primary" data-toggle="popover" data-target="#exampleModalCenter">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    TEXTO PARA MODAL
                    <asp:HiddenField runat="server" ID="hdnIdUser" ClientIDMode="Static" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger" OnClick="btnDelete_Click" Text="Deletar"></asp:Button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Scripts" runat="server" ContentPlaceHolderID="JavaScriptContent">
    <script src="../Content/CustomJs/UsersPage.js"></script>
</asp:Content>
