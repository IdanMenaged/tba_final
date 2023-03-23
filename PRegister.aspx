<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PRegister.aspx.cs" Inherits="final_proj.PRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function handleSubmit(event) {
            const form = event.target;
            const formData = new FormData(form);

            if (isValidForm(formData)) {
                console.log('submitted');
            }
            else {
                event.preventDefault(); // so that page is not refreshed and feedback could be shown
                console.log('could not submit');
            }
        }
        /**
         * formData should be a FormData Object
         */
        function isValidForm(formData) {
            let isValid = true;
            if (!isValidUsername(formData.get('uName'))) {
                isValid = false;
            }
            if (!isValidPassword(formData.get('password'))) {
                isValid = false;
            }
            if (!isValidFirstName(formData.get('fName'))) {
                isValid = false;
            }
            if (!isValidLastName(formData.get('lName'))) {
                isValid = false;
            }
            return isValid;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" onsubmit="return handleSubmit(event)" runat="server" id="form">
        <table class="base-table">
            <!-- username -->
            <tr class="base-tr">
                <td>
                    <label for="uName">שם משתמש</label>
                </td>
                <td class="base-td">
                    <input type="text" name="uName" id="uName" />
                </td>
                <!-- feedback -->
                <td class=" base-td feedback" id="usernameFeedback" type="text" disabled="disabled"></td>
            </tr>

            <!-- first name -->
            <tr class="base-tr">
                <td class="base-td">
                    <label for="fName">שם פרטי</label>
                </td>
                <td class="base-td">
                    <input type="text" name="fName" id="fName" />
                </td>
                <!-- feedback -->
                <td class="base-td feedback" id="firstNameFeedback"></td>
            </tr>

            <!-- last name -->
            <tr class="base-tr">
                <td class="base-td">
                    <label for="lName">שם משפחה</label>
                </td>
                <td class="base-td">
                    <input type="text" name="lName" id="lName" />
                </td>
                <!-- feedback -->
                <td class="base-td feedback" id="lastNameFeedback"></td>
            </tr>

            <!-- email -->
            <tr class="base-tr">
                <td class="base-td">
                    <label for="email">אימייל</label>
                </td>
                <td class="base-td">
                    <input type="email" name="email" id="email" required />
                </td>
                <!-- feedback -->
                <td class="base-td feedback" id="emailFeedback"></td>
            </tr>

            <!-- password -->
            <tr class="base-tr">
                <td class="base-td">
                    <label for="password">סיסמה</label>
                </td>
                <td class="base-td">
                    <input type="password" name="password" id="password" />
                </td>
                <!-- feedback -->
                <td class="base-td feedback" id="passwordFeedback"></td>
            </tr>
            
            <!-- submit -->
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="שלח.י" />
                </td>
            </tr>
        </table>
    </form>

    <% =msg %>
</asp:Content>
