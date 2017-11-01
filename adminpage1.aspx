<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="adminpage1.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="float: right; margin-right: 40%">
        <h2>Requested New Books</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" SelectCommand="SELECT [email], [bookname], [authorFname], [authorLname], [topic] FROM [newbook] ORDER BY [bookname]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT notify.ISBN, notify.requested, book_details.book_name, book_details.authorFname, book_details.authorLname, book_details.topic, book_details.availablecopies, book_details.price, book_details.rackno FROM notify INNER JOIN book_details ON notify.ISBN = book_details.ISBN ORDER BY notify.requested DESC"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
        <br>
        <h2>Books to be Restocked</h2>
        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="ISBN">
            <Columns>
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                <asp:BoundField DataField="requested" HeaderText="copies requested" SortExpression="requested" />
                <asp:BoundField DataField="book_name" HeaderText="book name" SortExpression="book_name" />
                <asp:BoundField DataField="authorFname" HeaderText="author First name" SortExpression="authorFname" />
                <asp:BoundField DataField="authorLname" HeaderText="author last name" SortExpression="authorLname" />
                <asp:BoundField DataField="topic" HeaderText="topic" SortExpression="topic" />
                <asp:BoundField DataField="availablecopies" HeaderText="availablecopies" SortExpression="availablecopies" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="rackno" HeaderText="rackno" SortExpression="rackno" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

