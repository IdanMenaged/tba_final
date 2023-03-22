using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PRegister : System.Web.UI.Page
    {
        public string msg;

        string dbFileName = "CodeTipsDB.mdf";
        string tableName = "usersTbl";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string uName = Request.Form["uName"];
                string query = $"select * from {tableName} where uName = '{uName}'";
                if (Helper.IsExist(dbFileName, query))
                {
                    msg = "שם משתמש תפוס";
                }
                else
                {
                    string fName = Request.Form["fName"];
                    string lName = Request.Form["lName"];
                    string email = Request.Form["email"];
                    string password = Request.Form["password"];

                    query = $"insert into {tableName} values ('{uName}', N'{fName}', N'{lName}', '{email}', '{password}')";
                    Helper.ExecuteDataTable(dbFileName, query);
                    msg = "משתמש נרשם בהצלחה";
                }
            }
        }
    }
}