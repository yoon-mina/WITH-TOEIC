using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security; // 추가

namespace project07
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                Label1.Text = Page.User.Identity.Name + " 님";
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
            else
            {
                Label1.Text = "";
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        { //로그인 버튼
            Response.Redirect("~/myLogin.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        { // 회원가입 버튼
            Response.Redirect("~/Register.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        { //로그아웃 버튼
            FormsAuthentication.SignOut();
            Response.Redirect(FormsAuthentication.DefaultUrl); // Home으로 보내기
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MemberOnly/Modify.aspx");
        }
    }
}