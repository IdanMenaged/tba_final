<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PIf.aspx.cs" Inherits="final_proj.PIf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>משפט תנאי מבצע את קטע הקוד שבתוכו רק אם התנאי נכון</p>
    <p class="code">
        if (n > 3) { <br />
            &nbsp System.out.println("number is bigger than 3"); // will print only when n > 3 <br />
        }
    </p>
    <p>ניתן גם להוסיף קטע קוד שיתבצע רק אם התנאי לא נכון ע"י else</p>
    <p class="code">
        if (n > 3) { <br />
            &nbsp System.out.println("number is bigger than 3"); <br />
        } <br />
        else { <br />
            &nbsp System.out.println("number is less than or equal to 3"); <br />
        }
    </p>
    <p>תוכנית לדוגמה</p>
    <p class="code">
        import java.util.*; <br />
        public class ClassName { <br />
            &nbsp public static Scanner reader = new Scanner(System.in); <br />
            &nbsp public static void main(String[] args) { <br />
                &nbsp &nbsp System.out.println("enter an interger"); <br />
                &nbsp &nbsp int n = reader.nextInt(); <br />
                &nbsp &nbsp if (n == 1) { <br />
                    &nbsp &nbsp &nbsp System.out.println("you entered 1"); <br />
                &nbsp &nbsp } <br />
                &nbsp &nbsp else { <br />
                    &nbsp &nbsp &nbsp System.out.println("you did not enter 1"); <br />
                &nbsp &nbsp } <br />
            &nbsp } <br />
        }
    </p>

    <!-- more information -->
    <a href="https://www.w3schools.com/java/java_conditions.asp">
        <img style="width: 20px" src="res/information-button.png" />
    </a>
</asp:Content>
