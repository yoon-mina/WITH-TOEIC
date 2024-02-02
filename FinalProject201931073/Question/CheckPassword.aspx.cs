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
    public partial class CheckPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["mode"] == "edit")
                ImageButton1.ImageUrl = "~/Images/modify.gif";
            else
                ImageButton1.ImageUrl = "~/Images/delete.gif";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {  // 수정 또는 삭제 페이지로 이동 (비밀번호 확인 후)
            string imgID = Request.QueryString["imgID"];
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Select * From Question Where imgID = @imgID and pwd = @pwd";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@imgID", imgID);
            cmd.Parameters.AddWithValue("@pwd", TextBox1.Text);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                if (Request.QueryString["mode"] == "edit")
                    Response.Redirect("Edit.aspx?imgID=" + imgID);
                else
                    Response.Redirect("Delete.aspx?imgID=" + imgID);
            }
            else
            {
                Label1.Text = "비밀번호가 일치하지 않네요.. 다시...";
            }
            rd.Close();
            con.Close();
        }
    }
}