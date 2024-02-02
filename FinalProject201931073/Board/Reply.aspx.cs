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
    public partial class Reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                TextBox3.Text = "[RE] " + Request.QueryString["title"];
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            // (1) 현 게시물의 ref_id, inner_id, depth 가져오기
            int ref_id = 0;
            int inner_id = 0;
            int depth = 0;

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"Select ref_id, inner_id, depth From shareBoard Where seq =" + Request.QueryString["sn"];
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                ref_id = (int)rd["ref_id"];
                inner_id = (int)rd["inner_id"];
                depth = (int)rd["depth"];
            }
            rd.Close();
            con.Close();

            // (2) 현 게시물과 같은 글을 참조하는 글 중에서 현 게시물 이후의 inner_ID 를 1증가
            string sql2 = @"Update shareBoard Set inner_id = inner_id + 1
                                Where ref_id = @ref_id and inner_id > @inner_id";
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            cmd2.Parameters.AddWithValue("@ref_id", ref_id);
            cmd2.Parameters.AddWithValue("@inner_id", inner_id);

            con.Open();
            cmd2.ExecuteNonQuery();
            con.Close();

            // (3) inner_id 와 depth 를 1씩 증가시켜서 답변 글 저장

            string sql3 = @"Insert into shareBoard(userID, name, pwd, title, body, ref_id, inner_id, depth, wDate, fName, fSize)
               Values (@userID, @name,@pwd,@title,@body,@ref_id,@inner_id,@depth, getDate( ), @fName, @fSize);";
            cmd = new SqlCommand(sql3, con);  // SqlCommand 새로 정의한 것 아니므로 주의

            // 이하 Write.aspx 와 비슷하므로 복사해서 수정한다.

            string hashPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox2.Text, "sha1");
            string fileName = "";
            int fileSize = 0;

            if (FileUpload1.HasFile)
            {
                // Write.aspx에서 복사하기 
                fileName = FileUpload1.FileName;
                FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
                if (myFile.Exists)
                { // 이미 존재하는 파일명을 첨부하려고 함: 파일이름 뒤에 1,2,3...을 붙임
                    myFile = NewFileName(myFile);  // 호출
                    fileName = myFile.Name;   // 경로를 제외한 파일이름만
                }
                FileUpload1.SaveAs(myFile.FullName); // 파일을 서버에 저장(full path name을 줘야 함)
                fileSize = FileUpload1.PostedFile.ContentLength;  // 바이트 단위
            }
            cmd.Parameters.AddWithValue("@userID", Page.User.Identity.Name);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@pwd", hashPwd);
            cmd.Parameters.AddWithValue("@title", TextBox3.Text);
            cmd.Parameters.AddWithValue("@body", TextBox4.Text);
            cmd.Parameters.AddWithValue("@ref_id", ref_id);         // 이하 3줄은 새로 추가
            cmd.Parameters.AddWithValue("@inner_id", ++inner_id);  // 글 위치 1 증가
            cmd.Parameters.AddWithValue("@depth", ++depth);     // 깊이 값 1 증가
            cmd.Parameters.AddWithValue("@fName", fileName);
            cmd.Parameters.AddWithValue("@fSize", fileSize);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Board/List.aspx");
        }

        private FileInfo NewFileName(FileInfo myFile)  // (복사할 것) 
        {
            // Write.aspx에서 복사하기 
            int num = 0;
            string fileName = "";
            string fName = myFile.Name.Substring(0, (myFile.Name.Length - myFile.Extension.Length));
            string fExtension = myFile.Extension;

            do
            {
                num++;
                fileName = fName + "_" + num + fExtension;
                myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);

            } while (myFile.Exists);

            return myFile;
        }
    }
}