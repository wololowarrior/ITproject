<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BMS Login</title>
    <link rel="stylesheet" href="CSS/test.css" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />

    <script src="JS/test.js"></script>
</head>
<body>
    <div>
        <h1 style="color: #fff; text-align: center; text-shadow: 0px 0px 10px 10px#eee">The Automated Book Management System</h1>
    </div>
    <form id="form1" runat="server">
        <div>
            <div>
                <hgroup>
                    <h1>SignIn</h1>
                </hgroup>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        <div class="group">
                            <asp:TextBox ID="TextBox1" CssClass="textbox" Placeholder="Email" runat="server"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Email Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ValidationExpression="^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$" ErrorMessage="Please Enter a valid Email" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:Label ID="Label1" runat="server" Text="" Font-Size="X-Small"></asp:Label>
                        </div>
                        <div class="group">
                            <asp:TextBox ID="TextBox2" TextMode="Password" Placeholder="Password" CssClass="textbox" runat="server"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                            <asp:Label ID="Label2" runat="server" Text="" Font-Size="X-Small"></asp:Label>

                        </div>
                        <asp:Button ID="Button1" CssClass="button" runat="server" Text="LogIn" OnClick="Button1_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button class="button" runat="server" Text="Create An Account" CausesValidation="false" ID="create" OnClick="create_Click"></asp:Button>
            <a href="MainPage.aspx">Continue without Login</a>
        </div>
        <div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div style="position: absolute; background-color: #FAFAFA; z-index: 2147483647 !important; opacity: 0.8; overflow: hidden; text-align: center; top: 0; left: 0; height: 100%; width: 100%; padding-top: 20%;">
                        <img src="images/Ellipsis.gif" height="75" width="75" style="position: relative; top: 45%" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>

</body>
</html>
