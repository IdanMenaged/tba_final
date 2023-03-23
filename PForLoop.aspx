<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PForLoop.aspx.cs" Inherits="final_proj.PForLoop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>אנחנו משתמשים בלופ for כשאנחנו יודעים את כמות הפעמים שנצטרך לחזור על הפעולה</p>
    <p>
        הלופ מורכב מ3 חלקים <br />
        1. התחלה <br />
        2. תנאי סיום <br />
        3. קפיצה <br />
    </p>
    <p class="code">
        int i; <br />
        for (i = 0; i < 10; i++)
    </p>
    <p>
        עבור הלולאה הזו המשתנה i יתחיל ב-0 <br />
        הלולאה תחזור על עצמה כל עוד i < 10 <br />
        בסוף כל חזרה i עולה ב-1 <br />
        לכן הלולאה תחזור על עצמה 10 פעמים
    </p>
    <p>תכנית מלאה</p>
    <p class="code">
        import java.util.*; <br />
        public class ClassName { <br />
            &nbsp public static Scanner reader = new Scanner(System.in); <br />
            &nbsp public static void main(String[] args) { <br />
                &nbsp &nbsp int i, n; <br />
                &nbsp &nbsp System.out.println("how many time would you like to repeat the loop?"); <br />
                &nbsp &nbsp n = reader.nextInt(); <br />
                &nbsp &nbsp for (i = 0; i < n; i++) { <br />
                    &nbsp &nbsp &nbsp System.out.println("repetition #" + i); <br />
                &nbsp &nbsp } <br />
            &nbsp } <br />
        }
    </p>

    <!-- more information -->
    <a href="https://www.w3schools.com/java/java_for_loop.asp">
        <img style="width: 20px" src="res/information-button.png" />
    </a>
</asp:Content>
