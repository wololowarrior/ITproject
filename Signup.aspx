<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp!</title>
    <link rel="stylesheet" href="CSS/test.css" />

    <script src="JS/test.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <hgroup>
                    <h1>SignUp</h1>
                </hgroup>
            </div>
            <div>
                <div class="group">
                    <asp:TextBox ID="TextBox1" class="textbox" placeholder="Email"  runat="server"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ValidationExpression="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" ErrorMessage="Not a valid Email"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                </div>
                <div class="group">
                    <asp:TextBox ID="TextBox3" placeholder="Name" class="textbox" runat="server"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox3" runat="server" ErrorMessage="Name Required"></asp:RequiredFieldValidator>
                </div>
                <div class="group">
                    <asp:TextBox ID="TextBox2" TextMode="Password" placeholder="Password" class="textbox" runat="server"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="Button1" class="button" runat="server" Text="Signup" OnClick="Button1_Click" />
            </div>
            <a href="MainPage.aspx">Continue without Login</a>
        </div>
    </form>
</body>
</html>
