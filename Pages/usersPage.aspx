<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Principal.Master" AutoEventWireup="true" CodeBehind="usersPage.aspx.cs" Inherits="waAgenda.Pages.contactsPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="col-md-4">
            <h4>Usuários Ativos</h4>
            <br />
        </div>

        <div class="col-md-12">
            <div class="row">

                <div class="col-md-8">
                    <asp:TextBox ID="searchBar" runat="server" CssClass="form-control col-md-8" Width="50%"></asp:TextBox>
                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default" OnClick="btnSearch_Click" Text="Pesquisar" />
                    </div>
                </div>
                <div class="col-md-4" style="padding-right: unset">

                    <asp:Button ID="btnAddUser" runat="server" Text="Adicionar Usuário" OnClick="AddUser_Click" CssClass="btn btn-success pull-right" />

                </div>
            </div>
            <br />
            <div class="col-md-0">
                <div class="row">

                    <asp:GridView ID="GridViewActiveUsers" runat="server" AutoGenerateColumns="false" ItemType="waAgenda.Models.User" CssClass="table table-bordered table-hover table-responsive" EmptyDataRowStyle-CssClass="alert-danger text-center" 
                                  ShowHeaderWhenEmpty="True" EmptyDataText="Nenhum dado encontrado" AllowPaging="true" OnPageIndexChanging="GridViewActiveUsers_PageIndexChanging" PageSize="5" PagerStyle-HorizontalAlign="Right" PagerStyle-CssClass="pagination-ys" >

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
                                    <div class="text-center">
                                        <asp:Label runat="server">
                                            <%# Item.NameUser %> 
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
                                    <div class="text-center">
                                        <asp:Label runat="server">
                                    <%# Item.EmailUser %>
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
                                    <div class="text-center">
                                        <asp:Label runat="server">
                                            <%# Item.PhoneUser %>
                                        </asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <div class="text-left">
                                        Opções 
                                    </div>
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

            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="modalDeleteTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Deletar Usuário</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server">Você realmente deseja deletar o usuário?</asp:Label>
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
