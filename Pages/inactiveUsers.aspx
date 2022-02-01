<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Principal.Master" AutoEventWireup="true" CodeBehind="inactiveUsers.aspx.cs" Inherits="waAgenda.Pages.inactiveUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="JavaScriptContent" runat="server">
    <script src="../Content/CustomJs/InactiveUsers.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="col-md-12">
            <div class="col-md-3">
                <h3>Usuários Inativos</h3>
            </div>
            <div class="col-md-0">
                <div class="row">

                    <asp:GridView ID="GridViewInactiveUsers" runat="server" AutoGenerateColumns="false" ItemType="waAgenda.Models.User" CssClass="table table-bordered table-hover">

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
                                    <button id="btnActiveUser_<%# Item.IdUser %>" type="button" clientidmode="Static" class="btn btn-primary abrir-modal-reativar" onclick="abreModalReativa(<%# Item.IdUser %>)" data-toggle="popover" data-target="#exampleModalCenter">Reativar</button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>






    <!-- Modal -->
    <div class="modal fade" id="modalReativar" tabindex="-1" role="dialog" aria-labelledby="modalReativarTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Reativar Usuário</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server">Você realmente deseja reativar o usuário?</asp:Label>
                    <asp:HiddenField runat="server" ID="hdnIdUser" ClientIDMode="Static" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <asp:Button ID="btnReativar" runat="server" class="btn btn-success" OnClick="btnReativar_Click" Text="Reativar"></asp:Button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
