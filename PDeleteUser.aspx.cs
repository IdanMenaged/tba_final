using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PDeleteUser : System.Web.UI.Page
    {
        public string msg;

        // constants
        string dbFileName = "CodeTipsDB.mdf";
        string tableName = "usersTbl";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() != "yes")
            {
                msg = "<p class='error'>אינך מנהל</p>" +
                    "<a href='PHome.aspx'>חזור לדף הבית</a>";
            }
            else
            {
                string userToDelete = Request.QueryString["uName"].ToString();
                string query = $"delete from {tableName} where uName = '{userToDelete}'";
                Helper.DoQuery(dbFileName, query);
                Response.Redirect("PAdminPage.aspx");
            }
        }
    }
}