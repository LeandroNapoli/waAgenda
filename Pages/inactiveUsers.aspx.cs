using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using waAgenda.Models;

namespace waAgenda.Pages
{
    public partial class inactiveUsers : System.Web.UI.Page
    {
        static string strConexao = ConfigurationManager.ConnectionStrings["conexaoAgenda"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<User> users = BuscarUsersInativos();

                PreencheGridUsuario(users);

                //PreencheDropUsuario(contacts);

            }
        }

        private static List<User> BuscarUsersInativos()
        {
            List<User> users = new List<User>();

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Open();

                users = conexaoBD.Query<User>("Select * from users where statusUser = 0 order by nameUser asc").ToList();

            }

            return users;
        }


        private void PreencheGridUsuario(List<User> users)
        {
            GridViewInactiveUsers.DataSource = users;
            GridViewInactiveUsers.DataBind(); //TIPO UM COMMIT
        }

        protected void btnReativar_Click(object sender, EventArgs e)
        {
            var idUser = Convert.ToInt32(hdnIdUser.Value);

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Execute("Update Users set statusUser = 1 where idUser = @idUser", new { idUser });

            }

            List<User> users = BuscarUsersInativos(); //PESQUISAR NOVAMENTE OS USUÁRIO E PREENCHER O GRID ATUALIZADO
            PreencheGridUsuario(users);

        }
    }

}