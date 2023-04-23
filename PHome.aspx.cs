using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PHome : System.Web.UI.Page
    {
        public int usersCount;

        // constants
        string dbFileName = "CodeTipsDB.mdf";
        string usersTableName = "usersTbl";

        protected void Page_Load(object sender, EventArgs e)
        {
            string query;
            DataTable table;

            query = $"select * from {usersTableName}";
            table = Helper.ExecuteDataTable(dbFileName, query);

            usersCount = table.Rows.Count;
        }
    }
}