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
    public partial class NoteList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Text = Page.User.Identity.Name;  // 로그인된 ID
        }

        public string GetContent(object content)
        { // 줄바꿈 문자를 <br>태그로 치환해 줌
            string ss = content.ToString();
            ss = ss.Replace("\n", "<br />");
            return ss;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (TextBox3.TextMode == TextBoxMode.SingleLine)
            {
                TextBox3.TextMode = TextBoxMode.MultiLine;
                TextBox3.Rows = 5;
            }
            else
            {
                TextBox3.TextMode = TextBoxMode.SingleLine;
                TextBox3.Rows = 1;
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        { // 저장 버튼
            string user = Page.User.Identity.Name;
            //연결
            string conStr =
                ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"Insert into oneNote(userID, name, content) 
                                  Values(@userID, @name, @content)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userID", user);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@content", TextBox3.Text);
            //실행
            con.Open();
            cmd.ExecuteNonQuery();  // 실행 쿼리
            con.Close();
            //화면 갱신
            DataList1.DataBind();
            TextBox3.Text = "";
        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string ss = e.CommandArgument.ToString();  // 선택한 행의 nID 값

            //연결
            string conStr =
                ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //명령
            string sql = @"Delete from oneNote Where nID = @nID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@nID", ss);

            //실행
            con.Open();
            cmd.ExecuteNonQuery();  // 실행 쿼리
            con.Close();

            //화면 갱신
            DataList1.DataBind();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) ||
                      (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                LinkButton btn = (LinkButton)e.Item.FindControl("LinkButton1");
                Label lbl = (Label)e.Item.FindControl("Label1");
                if (lbl.Text == Label4.Text)
                    btn.Visible = true;
                else
                    btn.Visible = false;
            }
        }

    }
}