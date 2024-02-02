using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject201931073
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
        }
    }
}