using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_proj
{
    public partial class PFinalVid : System.Web.UI.Page
    {
        public string content;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uName"].ToString() == "אורח")
            {
                content = "<p class='error'</p>על מנת לסיים את הקורס עליך להתחבר</p> <br />" +
                    "<a href='PRegister.aspx'>צור משתמש</a> או <a href='PLogin.aspx'>התחבר למשתמש קיים</a>";
            }
            else
            {
                content = "<img src='res/course-completion.png' style='width: 200px' />" +
                    "<p>ברכות! השלמת את קורס הג'אבה שלי!</p>" +
                    "<p>עכשיו נשאר רק דבר אחד...</p>" +
                    "<video width='320' height='240' controls>" +
                        "<source src='res/final_vid.mp4' type='video/mp4'>" +
                    "</video>";
            }
        }
    }
}