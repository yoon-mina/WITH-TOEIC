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

namespace FinalProject201931073.MemberOnly
{
    public partial class CalendarEx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["day"] != null) // 선택한 날짜와 월을 세션변수로 저장
                {
                    Calendar1.SelectedDate = (DateTime)Session["day"];
                    Calendar1.VisibleDate = (DateTime)Session["month"];
                }
                else
                {
                    Calendar1.SelectedDate = Calendar1.TodaysDate;
                }

                // 드롭다운 리스트에 내용 추가
                DropDownList1.Items.Add("오늘중");
                for (int i = 0; i < 24; i++)
                    DropDownList1.Items.Add(string.Format("{0:D2} 시", i));
                for (int i = 0; i < 6; i++)
                    DropDownList2.Items.Add(string.Format("{0:D2} 분", i * 10));

                ShowToDoList(); // 선택된 날짜의 타임리스트를 보여줘라
            }
        }

        private void ShowToDoList()
        {
            string id = User.Identity.Name;
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"select * from mySchedule 
                            Where userID=@userID and sDate=@sDate
                            Order by sTime;";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userID", id);
            cmd.Parameters.AddWithValue("@sDate", Calendar1.SelectedDate.ToShortDateString());

            con.Open();
            DataList1.DataSource = cmd.ExecuteReader();
            DataList1.DataBind();
            con.Close();
        }

        protected string DoneCheck(object todo, object hasDone)  // DataList 의 Label4에 표시되기 위해 호출
        {
            string result = todo.ToString();
            string done = hasDone.ToString();
            if (done == "Y")
            {
                result = "<strike>" + result + "</strike>";  // 글자를 관통하는 선 그리는 태그
            }
            return result;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            // 등록 버튼
            if (User.Identity.IsAuthenticated == false)
            {
                Label5.Text = "로그인하셔야 등록됩니다.";
                return;
            }
            string id = User.Identity.Name;
            string sTime = DropDownList1.SelectedItem.Text + " " + DropDownList2.SelectedItem.Text;
            if (DropDownList1.SelectedIndex == 0)
                sTime = "오늘중";

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"insert into mySchedule (userID,sDate,sTime,toDo,hasDone)
                            values (@userID,@sDate,@sTime,@toDo,'N');";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@userID", id);
            cmd.Parameters.AddWithValue("@sDate", Calendar1.SelectedDate.ToShortDateString());
            cmd.Parameters.AddWithValue("@sTime", sTime);
            cmd.Parameters.AddWithValue("@toDo", TextBox1.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ShowToDoList();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // 달력에서 날짜 선택하면 세션 변화 
            Session["day"] = Calendar1.SelectedDate;
            Session["month"] = Calendar1.VisibleDate;

            Label2.Text = Calendar1.SelectedDate.ToShortDateString();
            ShowToDoList();
        }

        protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            Session["month"] = Calendar1.VisibleDate;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            // 일정 있는날 표시 
            string id = User.Identity.Name;
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = @"select * from mySchedule 
                            where userID=@userID and sDate=@sDate;";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataAdapter adt = new SqlDataAdapter(sql, con);
            adt.SelectCommand = cmd;
            cmd.Parameters.AddWithValue("@userID", id);
            cmd.Parameters.AddWithValue("@sDate", e.Day.Date.ToShortDateString()); // 렌더링되는 날짜

            DataSet ds = new DataSet();
            adt.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string title = null;
                Label lbl = null;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    title = ds.Tables[0].Rows[i]["toDo"].ToString();
                    lbl = new Label();
                    lbl.Text = "<br/>" + title;
                    lbl.Font.Size = FontUnit.XSmall;
                    lbl.Font.Name = "맑은 고딕";
                    lbl.ForeColor = System.Drawing.Color.Blue;

                    e.Cell.Controls.Add(lbl);
                }
            }

        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "delete from mySchedule where seq=@seq";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@seq", e.CommandArgument);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ShowToDoList();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Done")
            {
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "update mySchedule set hasDone='Y' where seq=@seq";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@seq", e.CommandArgument);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                ShowToDoList();
            }
        }
    }
}