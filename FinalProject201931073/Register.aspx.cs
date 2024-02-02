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

namespace FinalProject201931073
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        { //  등록 버튼
            if (IsMemberExists())
                Label2.Text = "이미 사용중인 아이디입니다.<br />다른 아이디를 사용해 주세요.";
            else
                AddMember();
        }

        private void AddMember()
        {
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"Insert into studyMember Values (@UserID,@Password,@Name,@Phone)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@UserID", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Name", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox5.Text);

            //실행
            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();

            if (a > 0)
            {
                FormsAuthentication.SetAuthCookie(TextBox1.Text, false); // 인증쿠키를 생성
                string str = "<script> alert('회원에 가입되셨습니다');";
                str += "location.href = '/Home.aspx'; </script > ";
                Response.Write(str);
            }
            else
                Label2.Text = "회원가입에 실패했습니다.";
        }

        private bool IsMemberExists()
        {
            bool result = true;
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"Select * from studyMember Where UserID=@UserID ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@UserID", TextBox1.Text);
            //실행
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
                result = true;
            else
                result = false;
            rd.Close();
            con.Close();
            return result;
        }

        protected void Button5_Click(object sender, EventArgs e)
        { // 중복확인 버튼
            string str = "<script> window.open('FindID.aspx?id=" + TextBox1.Text
                + "', 'mywindow', 'top=200, left=200, width=400, height=200');  </script>";
            Response.Write(str);
        }
    }
}