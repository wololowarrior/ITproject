<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="stat.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="float: right; margin-right: 40%">
        <h1>Sale Statistics</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT book_details.ISBN,  book_details.book_name,book_details.price,COUNT(book_details.ISBN) AS [Total Sold], SUM(book_details.price) AS [Total Sale] FROM book_details INNER JOIN sales ON book_details.ISBN = sales.ISBN GROUP BY book_details.ISBN, book_details.book_name,book_details.price"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
    </div>
</asp:Content>

