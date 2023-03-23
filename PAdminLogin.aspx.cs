using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PAdminLogin : System.Web.UI.Page
    {
        public string msg;

        // constants
        string dbFileName = "CodeTipsDB.mdf";
        string tableName = "adminsTbl";
        string redirectUrl = "PHome.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                // check if there exists a user with both correct uName and password
                string uName = Request.Form["uName"];
                string password = Request.Form["password"];

                string query = $"select * from {tableName} where uName = '{uName}' and password = '{password}'";
                DataTable table = Helper.ExecuteDataTable(dbFileName, query);
                if (table.Rows.Count == 0)
                {
                    msg = "שם משתמש או סיסמה לא נכונים";
                }
                else
                {
                    Session["uName"] = uName;
                    Session["name"] = "מנהל";
                    Session["admin"] = "yes";

                    Response.Redirect(redirectUrl);
                }
            }
        }

    }
}