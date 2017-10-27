using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signin : System.Web.UI.Page
{
    String cs = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        cs = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        using (SqlConnection conn = new SqlConnection(cs))
        {
            using(SqlCommand cmd=new SqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO Registrations VALUES(@name,@email,@password)";
                cmd.Parameters.AddWithValue("@email", TextBox1.Text);
                cmd.Parameters.AddWithValue("@name", TextBox3.Text);
                cmd.Parameters.AddWithValue("@password", TextBox2.Text);
                try
                {
                    conn.Open();
                    int re=cmd.ExecuteNonQuery();
                }catch(Exception ex)
                {
                    File.WriteAllText(Request.PhysicalApplicationPath + "\\log.txt", ex.Message);
                }
                finally
                {
                    Response.Redirect("test.aspx");
                }
            }
        }
    }
}