<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="input-field col s12">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Book Name"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Author's First Name"></asp:TextBox>
                    </div>
                    <div class="input-field col s6">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Last Name"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Related Topic"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn waves-effect waves-light col s12" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

