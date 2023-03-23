using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PLogout : System.Web.UI.Page
    {
        string redirectUrl = "PHome.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(redirectUrl);
        }
    }
}