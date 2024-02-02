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
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { // 조회수를 1 증가시킴
            if (!IsPostBack)
            {
                string imgID = Request.QueryString["imgID"];
                if (imgID == null)
                    return;
                // else: DB 연동하여 hit 필드 값을 1 증가시킴(수정시킴)
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "update Question set hit = hit + 1 Where imgID=" + imgID;
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                cmd.ExecuteNonQuery(); // 조회수 증가 실행
                con.Close();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        { // 수정 버튼
            Response.Redirect("CheckPassword.aspx?mode=edit&imgID=" +
                Request.QueryString["imgID"]);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {  // 삭제 버튼
            Response.Redirect("CheckPassword.aspx?mode=del&imgID=" +
                Request.QueryString["imgID"]);
        }
    }
}