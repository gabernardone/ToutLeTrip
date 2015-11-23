using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace toutLeTrip01
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                string emailValue = Request.QueryString["valorA"];

                Email.Text = emailValue;
            }
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {

        }
    }
}