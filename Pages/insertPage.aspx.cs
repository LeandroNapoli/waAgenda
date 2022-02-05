using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using waAgenda.Models;
using waAgenda.Models.Enum;

namespace waAgenda.Pages
{
    public partial class insertPage : System.Web.UI.Page
    {

        static string strConexao = ConfigurationManager.ConnectionStrings["conexaoAgenda"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click1(object sender, EventArgs e)
        {
            User contact = new User();

            contact.NameUser = nameBox.Text;
            contact.EmailUser = emailBox.Text;
            contact.PhoneUser = phoneBox.Text;

            var status = PesquisaUserAtivo();

            contact.IdStatus = status.IdStatus;

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {

                conexaoBD.Execute("insert into Users (NameUser, EmailUser, PhoneUser, IdStatus) Values (@nameUser, @emailUser, @phoneUser, @IdStatus)", contact);
            }

            Response.Redirect("usersPage.aspx");
        }

        protected Status PesquisaUserAtivo()
        {
            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                string sqlConsulta = @"select * from Status s 
                                        where s.StatusValor = @Ativo"; //Select para identificar qual status possui o campo StatusValor = @Ativo do EnumStatus.

                var status = conexaoBD.Query<Status>(sqlConsulta, new { Ativo = (int)EnumStatus.Ativo }).FirstOrDefault();

                return status;
            }
        }
    }
}
