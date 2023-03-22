<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PRegister.aspx.cs" Inherits="final_proj.PRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #FFA500;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .feedback {
            color: red;
        }
    </style>
    <script>
        function giveFeedback(feedbackElementId, msg) {
            const feedbackElement = document.getElementById(feedbackElementId);
            feedbackElement.innerHTML = msg;
        }

        function removeFeedback(feedbackElementId) {
            const feedbackElement = document.getElementById(feedbackElementId);
            feedbackElement.innerHTML = '';
        }

        /**
         * checks if str1 includes only charcters from str2
         */
        function containsOnly(str1, str2) {
            for (let char of str1) {
                if (!str2.includes(char)) {
                    return false;
                }
            }
            return true;
        }

        function isValidUsername(username) {
            const minLength = 6;
            const allowedChars = 'ABCDEFGHIJKMNLOPQRSTUVWXYZabcdefghijkmnlopqrstuvwxyz0123456789';

            // check length
            if (username.length < minLength) {
                giveFeedback('usernameFeedback', 'שם משתמש חייב להיות 6 תווים או יותר');
                return false;
            }

            // check allowed chars
            if (!containsOnly(username, allowedChars)) {
                giveFeedback('usernameFeedback', 'שם משתמש חייב להכיל רק תווים באנגלית ומספרים')
                return false;
            }

            removeFeedback('usernameFeedback');
            return true;
        }

        function isValidPassword(password) {
            const minLength = 6;
            const allowedChars = 'ABCDEFGHIJKMNLOPQRSTUVWXYZabcdefghijkmnlopqrstuvwxyz0123456789';

            // check length
            if (password.length < minLength) {
                giveFeedback('passwordFeedback', 'סיסמה חייבת להיות 6 תווים או יותר');
                return false;
            }

            // check allowed chars
            if (!containsOnly(password, allowedChars)) {
                giveFeedback('passwordFeedback', 'סיסמה חייבת להכיל רק תווים באנגלית ומספרים')
                return false;
            }

            removeFeedback('passwordFeedback');
            return true;
        }

        function isValidFirstName(name) {
            const minLength = 2;

            if (name.length < minLength) {
                giveFeedback('firstNameFeedback', 'שם פרטי צריך להיות לפחות 2 תווים');
                return false;
            }

            removeFeedback('firstNameFeedback');
            return true;
        }

        function isValidLastName(name) {
            const minLength = 2;

            if (name.length < minLength) {
                giveFeedback('lastNameFeedback', 'שם משפחה צריך להיות לפחות 2 תווים');
                return false;
            }

            removeFeedback('lastNameFeedback');
            return true;
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
                    <input type="submit" name="submit" value="שלח" />
                </td>
            </tr>
        </table>
    </form>

    <% =msg %>
</asp:Content>
