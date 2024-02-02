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
    public partial class Write : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            // [글쓰기] 버튼

            // 1) 글을 board 테이블에 insert하고, 2) ref_id를 자동생성된 글번호 seq로 update한다.

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"Insert into shareBoard(userID, name, pwd, title, body, wDate, fName, fSize)
                        Values (@userID, @name, @pwd, @title, @body, getDate( ), @fName, @fSize);";
            SqlCommand cmd = new SqlCommand(sql, con);

            string hashPwd =
               FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox2.Text, "sha1");
            // 비밀번호 암호화 

            string fileName = "";
            int fileSize = 0;

            if (FileUpload1.HasFile)  // 첨부된 파일이 있는 경우 (사진 앨범과 유사)
            {
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
            cmd.Parameters.AddWithValue("@pwd", hashPwd);  // 암호화된 비밀번호를 저장
            cmd.Parameters.AddWithValue("@title", TextBox3.Text);
            cmd.Parameters.AddWithValue("@body", TextBox4.Text);
            cmd.Parameters.AddWithValue("@fName", fileName);
            cmd.Parameters.AddWithValue("@fSize", fileSize);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            // 2) ref_id 값을 해당 글번호 seq 값으로 업데이트한다. (방금 insert된 글은 ref_id = 0 이다)

            string sql2 = @"Update shareBoard Set ref_id = seq Where ref_id = 0 ";
            SqlCommand cmd2 = new SqlCommand(sql2, con);

            con.Open();
            cmd2.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Board/List.aspx"); // List 페이지로 이동
        }

        private FileInfo NewFileName(FileInfo myFile) // 사진앨범과 동일
        {
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