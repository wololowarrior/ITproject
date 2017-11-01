using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    private string cs = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Response.Redirect("MainPage.aspx");
        }
    }

    protected void create_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "admin@bas.com")
        {
            if (TextBox2.Text == "admin")
            {
                Response.Redirect("adminpage1.aspx");
            }
        }
        else
        {
            cs = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT  Name,Password FROM Registrations WHERE Email=@email";
                    cmd.Parameters.AddWithValue("@email", TextBox1.Text);
                    try
                    {
                        conn.Open();
                        SqlDataReader reader;
                        System.Threading.Thread.Sleep(1000);

                        reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            string password = reader["Password"].ToString();
                            if (password == TextBox2.Text)
                            {
                                Session["user"] = reader["Name"];
                                Session["email"] = TextBox1.Text;
                                Response.Redirect("MainPage.aspx");
                            }
                            else
                            {
                                Label2.Text = "<font color='red'>Check Password</font>";
                                RequiredFieldValidator1.ErrorMessage = "Check Password";
                            }
                        }
                        else
                        {
                            Label1.Text = "<font color='red'>Check E-Mail</font>";
                        }
                    }
                    catch (Exception ex)
                    {
                        File.WriteAllText(Request.PhysicalApplicationPath + "\\log.txt", ex.Message);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
        }
    }
}