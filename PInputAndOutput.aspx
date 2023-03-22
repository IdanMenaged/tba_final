<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PInputAndOutput.aspx.cs" Inherits="final_proj.PInputAndOutput" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>תכנית פשוטה ב java</p>
    <p class="code">
        import java.util.*; <br />
        public class ClassName { <br />
            &nbsp public static Scanner reader = new Scanner(System.in); <br />
            &nbsp public static void main(String[] args) { <br />
                &nbsp &nbsp // code here <br />
            &nbsp } <br />
        }
    </p>
    <br />
    <p>קלט</p>
    <p class="code">
        int interger = reader.nextInt(); <br />
        double realNumber = reader.nextDouble(); <br />
        char character = reader.next().charAt(0); <br />
        String text = reader.nextLine(); <br />
    </p>
    <p>פלט</p>
    <p class="code">
        System.out.println(); // put thing to be printed inside the parenthesis
    </p>
    <p>תוכנית לדוגמה</p>
    <p class="code">
        import java.util.*; <br />
        public class ClassName { <br />
            &nbsp public static Scanner reader = new Scanner(System.in); <br />
            &nbsp public static void main(String[] args) { <br />
                &nbsp &nbsp System.out.println("enter an interger"); <br />
                &nbsp &nbsp int n = reader.nextInt(); // 3 <br />
                &nbsp &nbsp System.out.println("your interger is" + n); // your interger is 3 <br />
            &nbsp } <br />
        }
    </p>
</asp:Content>
