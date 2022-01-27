﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using waAgenda.Models;
using Dapper;
using System.Data.SqlClient;

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

        private void PreencheGridUsuario(List<User> contacts)
        {
            GridView1.DataSource = contacts;
            GridView1.DataBind(); //TIPO UM COMMIT
        }

        private static List<User> BuscarUsers()
        {
            List<User> contacts = new List<User>();

            using (SqlConnection conexaoBD = new SqlConnection(strConexao))
            {
                conexaoBD.Open();

                contacts = conexaoBD.Query<User>("select * from users where status = 1 order by name asc").ToList();

            }

            return contacts;
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

            Response.Redirect("editUser.aspx?idUser=" +idUser);

        }

        protected void lkbDeletarUsuario_Click(object sender, EventArgs e)
        {
            LinkButton lkbDeletaUsuario = (LinkButton)sender;

            int idUser = Convert.ToInt32(lkbDeletaUsuario.CommandArgument);

        }

    }
}


// contacts != null ? GridView1.DataSource = contacts : GridView1.DataSource = contacts2; IF EM UMA LINHA SÓ
// ? - Se a condição for verdadeira e após : Se for Falso