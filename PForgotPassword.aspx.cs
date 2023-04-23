using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// email imports
using System.Net;
using System.Net.Mail;

namespace final_proj
{
    public partial class PForgotPassword : System.Web.UI.Page
    {
        public string msg = "";

        // constants
        string dbFileName = "CodeTipsDB.mdf";
        string usersTableName = "usersTbl";
        
        string senderEmail = "ctips5770@gmail.com";
        string smtpUsername = "ctips5770@gmail.com";
        string smtpPassword = "9B719B0A29ABF3DA3EEEF33A3413BE9B8979";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string query;
                DataTable table;
                string email;
                string password;

                
                query = $"select * from {usersTableName} where uName = '{Request.Form["uName"]}'";
                table = Helper.ExecuteDataTable(dbFileName, query);

                if (table.Rows.Count == 0)
                {
                    msg = $"לא קיים משתמש בשם {Request.Form["uName"]}";
                }
                else {
                    msg = "";

                    email = table.Rows[0]["email"].ToString();
                    password = table.Rows[0]["password"].ToString();

                    MailAddress to = new MailAddress(email);
                    MailAddress from = new MailAddress(senderEmail);

                    MailMessage message = new MailMessage(from, to);
                    message.Subject = "שיחזור סיסמה";
                    message.Body = $"הסיסמה שלך היא {password}";

                    SmtpClient smtp = new SmtpClient("smtp.elasticemail.com", 2525) // service for sending emails
                    {
                        Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                        EnableSsl = true
                    };

                    try
                    {
                        smtp.Send(message);
                        msg = "נשלח";
                    }
                    catch (SmtpException ex)
                    {
                        msg = ex.ToString();
                    }
                }
            }
        }
    }
}