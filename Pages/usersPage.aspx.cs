using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using waAgenda.Models;
using Dapper;
using System.Data.SqlClient;
using waAgenda.Models.Enum;

namespace waAgenda.Pages
{
    public partial class contactsPage : System.Web.UI.Page
    {
        static string strConexao = ConfigurationManager.ConnectionStrings["conexaoAgenda"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<User> contacts = BuscarUsers();

                    PreencheGridUsuario(contacts);
                
                //PreencheDropUsuario(contacts);

            }

        }

        //private void PreencheDropUsuario(List<User> contacts)
        //{
        //    Drop1.DataSource = contacts;
        //    Drop1.DataValueField = "IdUser";
        //    Drop1.DataTextField = "Name";
        //    Drop1.DataBind(); //TIPO UM COMMIT
        //}


        /// <summary>
        /// Recebe a lista de usuário por parâmetro
        /// e preenche o Grid com a Lista de Users (Parametro)
        /// </summary>
        /// <param name="contacts">Lista de Users</param>
        private void PreencheGridUsuario(List<User> contacts)
        {
            GridViewActiveUsers.DataSource = contacts;
            GridViewActiveUsers.DataBind(); //TIPO UM COMMIT
        }

        private static List<User> BuscarUsers()
        {
            List<User> users = new List<User>();

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Open();

                string sql = @"Select * 
                                from Users u 
                                INNER JOIN Status s on s.idStatus = u.IdStatus 
                                where s.StatusValor = @Ativo 
                                order by NameUser asc";

                users = conexaoBD.Query<User>(sql, new { Ativo = (int)EnumStatus.Ativo}).ToList();

            }

            return users;
        }

        protected void AddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("insertPage.aspx");
        }

        //protected void Drop1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Label1.Text = Drop1.SelectedValue.ToString();
        //}

        protected void lkbEditarUsuario_Click(object sender, EventArgs e)
        {
            LinkButton lkbEditarUsuario = (LinkButton)sender; //Conversão explícita para converter e conseguir encontrar o que vem dentro do Grid

            int idUser = Convert.ToInt32(lkbEditarUsuario.CommandArgument);

            Response.Redirect("editUser.aspx?idUser=" + idUser);

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var idUser = Convert.ToInt32(hdnIdUser.Value);

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {

                string sqlConsulta = @"Select * from Status s 
                                        where s.StatusValor = @Inativo";

                var status = conexaoBD.Query<Status>(sqlConsulta, new { Inativo = (int)EnumStatus.Inativo }).FirstOrDefault();

                conexaoBD.Execute("Update Users set IdStatus = @IdStatusInativo where idUser = @idUser", new { IdStatusInativo = status.IdStatus, idUser });

            }

            List<User> contacts = BuscarUsers(); //PESQUISAR NOVAMENTE OS USUÁRIO E PREENCHER O GRID ATUALIZADO
            PreencheGridUsuario(contacts);

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            List<User> users = new List<User>();
            var search = searchBar.Text;


            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Open();

                string sqlConsulta = @"select * from Status s 
                                        where s.StatusValor = @Ativo"; //Select para identificar qual status possui o campo StatusValor = @Ativo do EnumStatus.

                var status = conexaoBD.Query<Status>(sqlConsulta, new { Ativo = (int)EnumStatus.Ativo }).FirstOrDefault();


                string sql = @"Select * from users 
                                where NameUser Like @search and IdStatus = @IdStatusAtivo";

                users = conexaoBD.Query<User>(sql, new { search = "%" + search + "%", IdStatusAtivo = status.IdStatus }).ToList();

            }

            PreencheGridUsuario(users);
        }
    }
}


// contacts != null ? GridView1.DataSource = contacts : GridView1.DataSource = contacts2; IF EM UMA LINHA SÓ
// ? - Se a condição for verdadeira e após : Se for Falso