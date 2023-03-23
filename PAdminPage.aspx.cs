using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PAdminPage : System.Web.UI.Page
    {
        public string content;

        // constants
        string dbFileName = "CodeTipsDB.mdf";
        string tableName = "usersTbl";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() != "yes")
            {
                content = "<p class='error'>דף זה נועד למנהלים בלבד</p> <br />" +
                    "<a href='PHome.aspx'>חזור לדף הבית</a>";
            }
            else
            {
                string query = $"select * from {tableName}";
                DataTable table = Helper.ExecuteDataTable(dbFileName, query);

                if (table.Rows.Count == 0)
                {
                    content = "לא רשומים משתמשים לאתר";
                }
                else {
                    content =
                        "<table>" +
                        "   <tr>" +
                        "       <th>שם משתמש</th>" +
                        "       <th>שם פרטי</th>" +
                        "       <th>שם משפחה</th>" +
                        "       <th>אימייל</th>" +
                        "       <th>סיסמה</th>" +
                        "       <th>מחק</th>" +
                        "   </tr>";

                    for (int i = 0; i < table.Rows.Count; i++)
                    {
                        content +=
                            $"<tr>" +
                            $"  <td>{table.Rows[i]["uName"]}</td>" +
                            $"  <td>{table.Rows[i]["fName"]}</td>" +
                            $"  <td>{table.Rows[i]["lName"]}</td>" +
                            $"  <td>{table.Rows[i]["email"]}</td>" +
                            $"  <td>{table.Rows[i]["password"]}</td>" +
                            $"  <td><a href='PDeleteUser?uName={table.Rows[i]["uName"]}'>" +
                            $"      <img class='delete-button' src='res/trash.png' />" +
                            $"  </a></td>" +
                            $"</tr>";
                    }

                    content += "</table>";
                }
            }
        }
    }
}