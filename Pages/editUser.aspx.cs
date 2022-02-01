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
    public partial class editUser : System.Web.UI.Page
    {
        static string strConexao = ConfigurationManager.ConnectionStrings["conexaoAgenda"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                var recebeId = Request.QueryString["idUser"];

                var idUser = Convert.ToInt32(recebeId);

                User contact = BuscarUser(idUser);

                //PreencheGridUsuario(contact);
                NameUser.Text = contact.NameUser;
                EmailUser.Text = contact.EmailUser;
                PhoneUser.Text = contact.PhoneUser;

            }
        }


        private static User BuscarUser(int idUser)
        {
            User contact = new User();

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Open();

                contact = conexaoBD.Query<User>("Select * from Users where idUser = @idUser", new { idUser }).FirstOrDefault();

            }

            return contact;
        }

        protected void btnSalvaUsuario_Click(object sender, EventArgs e)
        {
            var recebeId = Request.QueryString["idUser"];

            var idUser = Convert.ToInt32(recebeId);

            User contact = new User();

            contact.IdUser = idUser;
            contact.NameUser = NameUser.Text;
            contact.EmailUser = EmailUser.Text;
            contact.PhoneUser = PhoneUser.Text;

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Open();

                conexaoBD.Execute("Update Users Set NameUser = @NameUser, EmailUser = @EmailUser, PhoneUser = @PhoneUser where idUser = @idUser", new { contact.IdUser, contact.NameUser, contact.EmailUser, contact.PhoneUser });

            }

            Response.Redirect("usersPage.aspx");

        }
        //private void PreencheGridUsuario(List<User> contact)
        //{
        //    GridUser.DataSource = contact;
        //    GridUser.DataBind(); //TIPO UM COMMIT
        //}

    }
}