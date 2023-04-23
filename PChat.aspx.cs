using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PChat : System.Web.UI.Page
    {
        public string notLoggedInMsg = "";
        public string content = "";

        // constants
        string dbFileName = "CodeTipsDB.mdf";
        string chatTableName = "chatTbl";
        static string cardClassName = "card";

        // html snippets
        string addPostHtml =
            "<form method='post' runat='server'>" +
                "<label for='title'>כותרת</label>" +
                "<input type='text' id='title' name='title' maxlength='25' required />" +
                "<label for='content'>תוכן</label>" +
                "<input type='textarea' id='content' name='content' maxlength='400' rows='4' cols='50' />" +
                "<input type='submit' name='submit' value='שלח' />" +
            "</form>";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uName"].ToString() == "אורח")
            {
                notLoggedInMsg = "<span style='color:red;'>על מנת לראות את דף זה עליך להתחבר לחשבון</span><br /><br />" +
                    "<a href='PRegister.aspx'>הירשם.י</a> &nbsp" +
                    "<a href='PLogin.aspx'>התחבר.י</a>";
            }
            else
            {
                string query;
                DataTable table;
                int i;

                if (Request.Form["submit"] != null)
                {
                    string owner = Session["name"].ToString();
                    string postedOn = DateTime.Now.ToString();
                    string title = Request.Form["title"].ToString();
                    string postContent = Request.Form["content"].ToString();

                    query = $"insert into {chatTableName} values (N'{owner}', '{postedOn}', N'{title}', N'{postContent}')";
                    Helper.ExecuteDataTable(dbFileName, query);
                }

                content += addPostHtml;
                
                query = $"select * from {chatTableName}";
                table = Helper.ExecuteDataTable(dbFileName, query);

                if (table.Rows.Count == 0)
                {
                    content += "אין כרגע אף הודעה";
                }
                else
                {
                    for (i = 0; i < table.Rows.Count; i++)
                    {
                        content += cardify(table.Rows[i]["postedOn"].ToString(),
                            table.Rows[i]["owner"].ToString(),
                            table.Rows[i]["title"].ToString(),
                            table.Rows[i]["content"].ToString(),
                            table.Rows[i]["id"].ToString());
                    }
                }
            }
        }

        static string cardify(string date, string owner, string title, string content, string id)
        {
            return (
                $"<div class='{cardClassName}' id={id}>" +
                    $"<header>" +
                        $"{date} {owner}" +
                    $"</header>" +
                    $"<h3>" +
                        $"{title}" +
                    $"</h3>" +
                    $"<p>" +
                        $"{content}" +
                    $"</p>" +
                $"</div>"
            );
        }
    }
}