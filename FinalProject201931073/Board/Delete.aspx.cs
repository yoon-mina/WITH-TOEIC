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

namespace FinalProject201931073.Board
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // (1) 삭제하고자 하는 글의 참조번호(ref_id) 찾기 (답변이 아닌 경우 자신을 참조)
            //     첨부파일까지 깨끗이 삭제하려면 fName도 읽어와서 실제로 지울 것임

            string seq = Request.QueryString["sn"];

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Select ref_id, fName from shareBoard Where seq=" + seq;
            SqlCommand cmd = new SqlCommand(sql, con);

            string refString = "";
            string fileName = "";   // 첨부파일이 있으면 삭제하려고..

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                refString = dr["ref_id"].ToString();
                fileName = dr["fName"].ToString();
            }
            dr.Close();
            con.Close();

            // (2) 참조번호가 같으면서 삭제되지 않은 글 수를 얻음   
            string sql2 = @"Select count(*) From shareBoard Where ref_id=" + refString + " AND deleted != 'Y' ";
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            con.Open();
            int count = (int)cmd2.ExecuteScalar();
            con.Close();

            // (3) 참조번호가 같으면서 삭제되지 않은 글이 1개 뿐이면 무조건 삭제
            if (count == 1)
            {
                string sql3 = @"Delete From shareBoard Where ref_id=" + refString;
                SqlCommand cmd3 = new SqlCommand(sql3, con);
                con.Open();
                cmd3.ExecuteNonQuery();
                con.Close();
            }

            // (4) 참조번호가 같은 글이 여러 개이면, 본 글을 삭제하지 말고 deleted="Y'로 갱신

            else
            {
                string sql4 = @"Update shareBoard Set deleted='Y' Where seq =" + seq;
                SqlCommand cmd4 = new SqlCommand(sql4, con);
                con.Open();
                cmd4.ExecuteNonQuery();
                con.Close();
            }

            if (fileName != "")    // 어쨋든, 첨부파일은 삭제
            {
                FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
                myFile.Delete();
            }

            Response.Redirect("~/Board/List.aspx");
        }
    }
}