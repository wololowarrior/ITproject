<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="results.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 style="text-align:center">Your Purchases</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Table ID="Table1" runat="server" Width="300px" HorizontalAlign="Center" BorderStyle="Solid"></asp:Table>
    <asp:Button ID="Button1" runat="server" Text="Confirm Order"  CssClass="btn waves-effect" style="margin-left:650px;margin-top:10px" OnClick="Button1_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

</asp:Content>

