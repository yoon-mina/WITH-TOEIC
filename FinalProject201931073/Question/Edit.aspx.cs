using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.IO;

namespace FinalProject201931073.Question
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "Select * From Question Where imgID = " + Request.QueryString["imgID"];
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    TextBox1.Text = rd["title"].ToString();
                    TextBox2.Text = rd["body"].ToString();
                    TextBox3.Text = rd["name"].ToString();
                    Label2.Text = rd["fName"].ToString();
                    Image1.ImageUrl = "~/Photos/" + Label2.Text;
                }
                rd.Close();
                con.Close();

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        { // 수정 버튼
            string imgID = Request.QueryString["imgID"];
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"update Question
                            set title=@title, body=@body, name=@name 
                            Where imgID=@imgID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@title", TextBox1.Text);
            cmd.Parameters.AddWithValue("@body", TextBox2.Text);
            cmd.Parameters.AddWithValue("@name", TextBox3.Text);
            cmd.Parameters.AddWithValue("@imgID", imgID);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Show.aspx?imgID=" + imgID);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Show.aspx?imgID=" + Request.QueryString["imgID"]);
        }
    }
}