﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using waAgenda.Models;



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

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Execute("insert into Users (nameUser, emailUser, phoneUser, statusUser) Values (@nameUser, @emailUser, @phoneUser, '1')", contact);
            }

            Response.Write("Usuário inserido com sucesso!");

            Response.Redirect("usersPage.aspx");
        }

        
    }
}
