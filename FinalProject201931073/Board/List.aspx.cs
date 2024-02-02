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
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string ShowDepth(int depth)
        {
            string result = "";
            for (int i = 0; i < depth; i++)
            {
                result += "&nbsp;&nbsp;&nbsp;"; // 빈칸 3개
            }
            return result;
        }

        protected string ShowReplyIcon(int inner_id)
        {
            string result = "";
            if (inner_id != 0)
            {
                result = "<img src='/Images/reply_icon.gif' />";
            }
            return result;
        }

        protected string ShowTitle(string seq, string title, string deleted)
        {
            string result = "";
            if (deleted == "N")
            {  // 글번호와 함께 “글읽기 페이지로” 링크
                result = "<a href='Read.aspx?sn=" + seq + "'>" + title + "</a>";
            }
            else
            {
                result = "삭제된 게시물입니다.";
            }
            return result;
        }
    }
}