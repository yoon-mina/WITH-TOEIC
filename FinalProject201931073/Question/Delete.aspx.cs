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
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { // 레코드를 삭제, 첨부파일이 있다면 파일도 삭제하자!!
          // (1) 파일명을 읽어오자
            string imgID = Request.QueryString["imgID"];

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Select fName From Question Where imgID = " + imgID;
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            string fName = cmd.ExecuteScalar().ToString();
            con.Close();

            // (2) 레코드 삭제
            string sql2 = "Delete From Question Where imgID = " + imgID;
            SqlCommand cmd2 = new SqlCommand(sql2, con);

            con.Open();
            cmd2.ExecuteNonQuery();
            con.Close();

            // (3) 해당 파일도 삭제
            if (fName != null && fName != "")
            {
                FileInfo myFile =
                    new FileInfo(Server.MapPath("~/Photos/") + fName);
                myFile.Delete(); // 파일 삭제
            }
            Response.Redirect("List.aspx");
        }
    }
}