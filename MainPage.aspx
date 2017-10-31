<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <link rel="stylesheet" href="CSS/mainpage.css" type="text/css" />
        <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <div class="row">
            <div class="input-field col s12">
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Book Name"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Textbox1" ValidationExpression="[A-Za-z ]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Author's First Name"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="Textbox2" ValidationExpression="[A-Za-z]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>

            </div>
            <div class="input-field col s6">
                <asp:TextBox ID="TextBox3" runat="server" placeholder="Last Name"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="Textbox3" ValidationExpression="[A-Za-z]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>

            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <asp:TextBox ID="TextBox4" runat="server" placeholder="Related Topic"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="Textbox4" ValidationExpression="[A-Za-z]*" runat="server" ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>

            </div>
        </div>

        <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn waves-effect waves-light col s12" OnClick="Button1_Click" Style="margin-bottom: 20px" />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" BorderStyle="Inset" OnRowCommand="GridView1_RowCommand">
                <HeaderStyle BorderStyle="Inset" BorderWidth="2px" />
                <RowStyle BorderStyle="Inset" />
                <Columns>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                    <asp:BoundField DataField="book_name" HeaderText="Book Name" />
                    <asp:TemplateField HeaderText="Author Name">
                        <ItemTemplate>
                            <%#Eval("authorFname") %> <%#Eval("authorLname") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="topic" HeaderText="Topic" />
                    <asp:BoundField DataField="availablecopies" HeaderText="No of Copies Available" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="rackno" HeaderText="Rack number" />
                    <asp:TemplateField HeaderText="Add to Cart?">
                        <ItemTemplate>
                            <asp:Button ID="AddButton" runat="server"
                                CommandName="AddToCart"
                                UseSubmitBehavior="true"
                                CssClass="btn waves-button-input"
                                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                Text="Sure!"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select-dropdown"></asp:DropDownList>
        <asp:Button ID="Button3" runat="server" Text="View Cart" CssClass="btn waves-effect waves-light green col s6" Style="margin-bottom: 20px" OnClick="Button2_Click" />
        <asp:Button ID="Button2" runat="server" Text="Clear Cart" CssClass="btn waves-effect waves-light red col s6" Style="margin-bottom: 20px" OnClick="Button2_Click1" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div style="position: absolute; background-color: #FAFAFA; z-index: 2147483647 !important; opacity: 0.8; overflow: hidden; text-align: center; top: 0; left: 0; height: 100%; width: 100%; padding-top: 20%;">
                <img src="images/Ellipsis.gif" height="75" width="75" style="position: relative; top: 45%" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    
</asp:Content>


