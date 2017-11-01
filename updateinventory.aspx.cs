using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn= new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "INSERT INTO book_details VALUES(@isbn,@bookname,@afn,@aln,@topic,@a,@price,@rackno)";
        cmd.Parameters.AddWithValue("@isbn", TextBox1.Text);
        cmd.Parameters.AddWithValue("@bookname", TextBox2.Text);
        cmd.Parameters.AddWithValue("@afn", TextBox3.Text);
        cmd.Parameters.AddWithValue("@aln", TextBox4.Text);
        cmd.Parameters.AddWithValue("@topic", TextBox5.Text);
        cmd.Parameters.AddWithValue("@a", TextBox6.Text);
        cmd.Parameters.AddWithValue("@price", TextBox7.Text);
        cmd.Parameters.AddWithValue("@rackno", TextBox8.Text);
        conn.Open();
        int res = cmd.ExecuteNonQuery();
        if (res != 0)
        {
            Response.Redirect("updateinventory.aspx");
        }
        conn.Close();

    }
}