<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PWhileLoop.aspx.cs" Inherits="final_proj.PWhileLoop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>אנחנו משתמשים בלולאות while כשאנחנו לא בהכרח יודעים את כמות הפעמים שהלולאה תחזור</p>
    <p>הלולאה תפסיק כשהתנאי שבתוכה יפסיק להיות נכון</p>
    <p>לדוגמה קטע הקוד הזה:</p>
    <p class="code">
        int i = 0; <br />
        while (i < 10) { <br />
            &nbsp System.out.println("repetition #" + i); <br />
            &nbsp i++; <br />
        }
    </p>
    <p>
        מבצע את אותו הדבר כמו קטע הקוד הזה
    </p>
    <p class="code">
        int i; <br />
        for (i = 0; i < 10; i++) { <br />
            &nbsp System.out.println("repetition #" + i); <br />
        }
    </p>
    <p>
        קוד לדוגמה
    </p>
    <p>
        הקוד ימשיך לקלוט מספרים עד שיקבל -1
    </p>
    <p class="code">
        import java.util.*; <br />
        public class ClassName { <br />
            &nbsp public static Scanner reader = new Scanner(System.in); <br />
            &nbsp public static void main(String[] args) { <br />
                &nbsp &nbsp int n; <br />
                &nbsp &nbsp System.out.println("enter a number or -1 to stop"); <br />
                &nbsp &nbsp n = reader.nextInt(); <br />
                &nbsp &nbsp while (n != -1) { <br />
                    &nbsp &nbsp &nbsp System.out.println("enter a number or -1 to stop"); <br />
                &nbsp &nbsp } <br />
            &nbsp } <br />
        }
    </p>
</asp:Content>
