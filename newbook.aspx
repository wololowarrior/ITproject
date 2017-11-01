<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="newbook.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h5>
        <asp:Label ID="Label2" runat="server" Text="We apologise for the inconvinence. Please be so kind and the fill the book details below and get notified when in stock."></asp:Label></h5>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="Content3" runat="server" Visible="false">
    <div class="row">
        <div class="row">
            <div class="input-field col s12">
                <asp:TextBox ID="TextBox5" runat="server" placeholder="Book Name" required="true"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="Textbox5" ValidationExpression="[A-Za-z ]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <asp:TextBox ID="TextBox6" runat="server" placeholder="Author's First Name"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="Textbox6" ValidationExpression="[A-Za-z]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>

            </div>
            <div class="input-field col s6">
                <asp:TextBox ID="TextBox7" runat="server" placeholder="Last Name"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="Textbox7" ValidationExpression="[A-Za-z]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>

            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <asp:TextBox ID="TextBox8" runat="server" placeholder="Related Topic"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="Textbox8" ValidationExpression="[A-Za-z]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <asp:TextBox ID="TextBox9" runat="server" placeholder="Email id" required="true"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="Textbox9" ValidationExpression="[A-Za-z0-9_]+@[a-z]+" runat="server" ErrorMessage="Enter Valid Email"></asp:RegularExpressionValidator>
            </div>
        </div>
    </div>
    <asp:Button ID="Button4" runat="server" Text="Notify Me!" CssClass="btn waves-effect waves-light col s12" OnClick="Button4_Click" Style="margin-bottom: 20px" />
    <br>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>

