using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected string data = null;

    List<string> cart;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";

        if (Session["cart"] == null)
        {
            cart = new List<string>();
        }
        else
        {
            cart = Session["cart"] as List<string>;
        }
        //Label1.Text = "<h1>Welcome" + Request.QueryString["Name"]+"</h1>";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "SELECT * FROM book_details WHERE book_name=@bn or authorFname=@afn or authorLname=@aln or topic=@topic";
                cmd.Parameters.AddWithValue("@bn", TextBox1.Text);
                cmd.Parameters.AddWithValue("@afn", TextBox2.Text);
                cmd.Parameters.AddWithValue("@aln", TextBox3.Text);
                cmd.Parameters.AddWithValue("@topic", TextBox4.Text);
                if (TextBox1.Text != "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE book_name=@bn ";

                }
                else if (TextBox2.Text != "" && TextBox3.Text == "" && TextBox4.Text == "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE authorFname=@afn";

                }
                else if (TextBox2.Text == "" && TextBox3.Text != "" & TextBox4.Text == "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE authorLname=@aln";

                }
                else if (TextBox2.Text == "" && TextBox3.Text == "" && TextBox4.Text != "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE  topic=@topic";

                }
                else if (TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text == "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE authorFname=@afn and authorLname=@aln ";

                }
                else if (TextBox2.Text != "" && TextBox3.Text == "" && TextBox4.Text != "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE authorFname=@afn and topic=@topic";

                }
                else if (TextBox2.Text == "" && TextBox3.Text != "" && TextBox4.Text != "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE authorLname=@aln and topic=@topic";

                }
                else if (TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "")
                {
                    cmd.CommandText = "SELECT * FROM book_details WHERE  authorFname=@afn and authorLname=@aln and topic=@topic";


                }
                else if (TextBox1.Text == "" && TextBox2.Text == "" && TextBox3.Text == "" && TextBox4.Text == "")
                {
                    cmd.CommandText = "SELECT * FROM book_details";

                }
                DataSet ds = new DataSet();

                try
                {
                    conn.Open();
                    SqlDataAdapter a = new SqlDataAdapter(cmd);
                    a.Fill(ds, "book_details");
                }
                catch (Exception ex)
                {
                    File.WriteAllText(Request.PhysicalApplicationPath + "\\log.txt", ex.Message);
                }
                conn.Close();
                if (ds.Tables[0].Rows.Count == 0)
                {
                    Label1.Text = "<a style='color:red' href='newbook.aspx?bookname="+TextBox1.Text + "'>The book seems not to be available. Please Fill the details on link here and get notified when book is available!</a>";
                }
                else
                GridView1.DataSource = ds;
                Label1.Focus();
                this.DataBind();
                // Response.Redirect("results.aspx");
            }
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            if (!cart.Contains(row.Cells[0].Text))
                cart.Add(row.Cells[0].Text);
            Session["cart"] = cart;
            DropDownList1.DataSource = cart;
            DropDownList1.DataBind();
            //Response.Redirect("results.aspx?" + row.Cells[0].Text);
        }
    }



    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label1.Focus();
        if (Session["cart"] == null)
            Label1.Text = "Nothing Present in Cart please add!";
        else
            Response.Redirect("results.aspx");
    }



    protected void Button2_Click1(object sender, EventArgs e)
    {
        Label1.Focus();
        cart.Clear();
        Session["cart"] = null;
        Label1.Text = "Cart Cleared!";
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int age = -1;
            string copies = e.Row.Cells[4].Text;
            age = int.Parse(copies);
            //age = (int)DataBinder.Eval(e.Row.DataItem, "availablecopies");
            if (age == 0)
            {
                e.Row.BackColor = Color.IndianRed;
                e.Row.ForeColor = Color.FloralWhite;
                Button btn = e.Row.Cells[7].FindControl("AddButton") as Button;
                btn.Text = "Notify";
                btn.CommandName = "NotifyAdmin";
            }

        }
    }
}