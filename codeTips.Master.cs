using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class codeTips : System.Web.UI.MasterPage
    {
        public string name;
        public string links; // registration, login, sign out, update
        protected void Page_Load(object sender, EventArgs e)
        {
            name = Session["name"].ToString();
            if (name == "אורח")
            {
                links = "[<a href='PRegister.aspx'>הירשם.י</a>] <br />" +
                    "[<a href='PLogin.aspx'>התחבר.י</a>] <br />" +
                    "[<a href='PAdminLogin.aspx'>התחבר כמנהל</a>]";
            }
            else if (Session["admin"].ToString() == "yes")
            {
                links = "[<a href='PLogout.aspx'>התנתק.י</a>] <br />" +
                    "[<a href='PAdminPage.aspx'>דף ניהול</a>]";
            }
            else
            {
                links = "[<a href='PLogout.aspx'>התנתק.י</a>] <br />" +
                    "[<a href='PUpdateInfo.aspx'>עדכן.י פרטים</a>]";
            }
        }
    }
}