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
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)   // 엄청 중요!! 빠뜨리면 수정이 안 됨
            {
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "Select * from shareBoard Where seq = " + Request.QueryString["sn"];
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    TextBox1.Text = rd["name"].ToString();
                    TextBox3.Text = rd["title"].ToString();
                    TextBox4.Text = rd["body"].ToString();

                    Label2.Text = rd["fName"].ToString();
                    Label3.Text = "(" + rd["fSize"].ToString() + " bytes)";
                    HiddenField1.Value = rd["fSize"].ToString();

                    if (Label2.Text == "")
                    {
                        Label3.Visible = false;
                        LinkButton1.Visible = false;
                    }
                    else
                    {
                        Label3.Visible = true;
                        LinkButton1.Visible = true;
                    }
                }
                rd.Close();
                con.Close();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            // [수정] 버튼
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"Update shareBoard 
			  Set name=@name, title=@title, body=@body, fName=@fName, fSize=@fSize
                          Where seq = " + Request.QueryString["sn"];
            SqlCommand cmd = new SqlCommand(sql, con);

            // 첨부파일 수정여부 파악  
            string fileName = Label2.Text;
            int fileSize = int.Parse(HiddenField1.Value);

            if (FileUpload1.HasFile)    //  (복사하기) 글쓰기 페이지와 똑같음
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

            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@title", TextBox3.Text);
            cmd.Parameters.AddWithValue("@body", TextBox4.Text);
            cmd.Parameters.AddWithValue("@fName", fileName);   // 확인
            cmd.Parameters.AddWithValue("@fSize", fileSize);        // 확인

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/Board/List.aspx");
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // 비밀번호 체크할 필요 없음!
            // (1) DB에서 해당 레코드의 fName, fSize, hitDown 수정
            string seq = Request.QueryString["sn"];  // 리스트에서 읽어온 글의 번호

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"Update shareBoard Set fName=' ', fSize=0, hitDown=0  Where seq = " + seq;
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            // (2) 실제로 Uploads 폴더에서 파일 삭제
            FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + Label2.Text);
            myFile.Delete();

            Response.Redirect("~/Board/Edit.aspx?sn=" + seq);   // 현재 페이지 다시 띄움
        }
    }
}