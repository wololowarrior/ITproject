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
    String cs = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            TextBox9.Text = Session["email"].ToString();
        }
        TextBox5.Text = Request.QueryString["bookname"];
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        cs = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        using(SqlConnection conn=new SqlConnection(cs))
        {
            using(SqlCommand cmd=new SqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO newbook VALUES(@email,@bookname,@authorFname,@authorLname,@topic)";
                cmd.Parameters.AddWithValue("@email", TextBox9.Text);
                cmd.Parameters.AddWithValue("@bookname", TextBox5.Text);
                cmd.Parameters.AddWithValue("@authorFname", TextBox6.Text);
                cmd.Parameters.AddWithValue("@authorLname", TextBox7.Text);
                cmd.Parameters.AddWithValue("@topic", TextBox8.Text);
                try
                {
                    conn.Open();
                    int ret=cmd.ExecuteNonQuery();
                    if (ret != 0)
                    {
                        Label1.Text = "Your request has been recorded.";
                    }
                }
                catch(Exception ex)
                {
                    throw;
                }
            }
        }
    }
}