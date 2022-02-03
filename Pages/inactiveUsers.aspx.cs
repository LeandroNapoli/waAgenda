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
using waAgenda.Models.Enum;

namespace waAgenda.Pages
{
    public partial class inactiveUsers : Page
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

                string sql = @"Select * 
                                from Users u 
                                INNER JOIN Status s on s.idStatus = u.IdStatus 
                                where s.StatusValor = @Inativo 
                                order by NameUser asc";

                users = conexaoBD.Query<User>(sql, new { Inativo = (int)EnumStatus.Inativo }).ToList();


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
                string sqlConsulta = @"select * from Status s 
                                        where s.StatusValor = @Ativo";

                var status = conexaoBD.Query<Status>(sqlConsulta, new { Ativo = (int)EnumStatus.Ativo }).FirstOrDefault();

                string sql = @"Update Users set IdStatus = @IdStatusAtivo 
                                where idUser = @UsuarioId";

                conexaoBD.Execute(sql, new { IdStatusAtivo = status.IdStatus, UsuarioId = idUser });

            }

            List<User> users = BuscarUsersInativos(); //PESQUISAR NOVAMENTE OS USUÁRIO E PREENCHER O GRID ATUALIZADO
            PreencheGridUsuario(users);

        }
    }

}