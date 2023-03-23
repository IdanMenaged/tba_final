using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace final_proj
{
    public partial class PUpdateInfo : System.Web.UI.Page
    {
        public string uName;
        public string fName;
        public string lName;
        public string email;
        public string password;

        public string msg;

        // constants
        string dbFileName = "CodeTipsDB.mdf";
        string tableName = "usersTbl";

        protected void Page_Load(object sender, EventArgs e)
        {
            // check if user is logged in
            if (Session["uName"].ToString() == "אורח")
            {
                Response.Redirect("PHome.aspx");
            }

            string query = $"select * from {tableName} where uName = '{Session["uName"]}'";
            DataTable table = Helper.ExecuteDataTable(dbFileName, query);
            
            uName = table.Rows[0]["uName"].ToString();
            fName = table.Rows[0]["fName"].ToString();
            lName = table.Rows[0]["lName"].ToString();
            email = table.Rows[0]["email"].ToString();
            password = table.Rows[0]["password"].ToString();

            // on submit
            if (this.IsPostBack)
            {
                fName = Request.Form["fName"];
                lName = Request.Form["lName"];
                email = Request.Form["email"];
                password = Request.Form["password"];

                query = $"update {tableName} set " +
                    $"fName = N'{fName}', " +
                    $"lName = N'{lName}', " +
                    $"email = '{email}', " +
                    $"password = '{password}' " +
                    $"where uName = '{uName}'";

                Helper.DoQuery(dbFileName, query);
                Session["name"] = fName;
                msg = "פרטים התעדכנו";
            }
        }
    }
}