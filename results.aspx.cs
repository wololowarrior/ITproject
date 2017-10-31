using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DataSet ds;
    List<string> objlt;
    List<int> count;
    protected void Page_Load(object sender, EventArgs e)
    {

        count = new List<int>();
        objlt = (List<string>)Session["cart"];
        if (Session["cart"] != null)
        {
            objlt = (List<string>)Session["cart"];

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT * FROM book_details";
        SqlDataAdapter a = new SqlDataAdapter(cmd);
        ds = new DataSet();
        a.Fill(ds, "book_details");
        TableRow tr = new TableRow();
        TableCell tc = new TableCell();
        tc.Text = "ISBN";
        TableCell tc1 = new TableCell();
        TableCell tc2 = new TableCell();
        tr.Cells.Add(tc);
        tc1.Text = "Book Name";
        tc.BorderStyle = BorderStyle.Solid;
        tc1.BorderStyle = BorderStyle.Solid;
        tc2.BorderStyle = BorderStyle.Solid;

        tc2.Text = "Price";
        tr.Cells.Add(tc1);
        tr.Cells.Add(tc2);
        tr.BorderStyle = BorderStyle.Solid;
        Table1.Rows.Add(tr);
        double sum = 0;
        for (int i = 0; i < objlt.Count; i++)
        {
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row["ISBN"].ToString() == objlt[i].ToString())
                {
                    TableRow t = new TableRow();
                    TableCell tc3 = new TableCell();
                    TableCell tc4 = new TableCell();
                    TableCell tc5 = new TableCell();
                    tc3.BorderStyle = BorderStyle.Solid;
                    tc4.BorderStyle = BorderStyle.Solid;
                    tc5.BorderStyle = BorderStyle.Solid;

                    t.BorderStyle = BorderStyle.Solid;
                    tc3.Text = row["ISBN"].ToString();
                    tc4.Text = row["book_name"].ToString();
                    tc5.Text = row["price"].ToString();
                    sum += Convert.ToDouble(row["price"].ToString());
                    t.Cells.Add(tc3);
                    t.Cells.Add(tc4);
                    t.Cells.Add(tc5);
                    Table1.Rows.Add(t);
                    count.Add(Convert.ToInt32(row["availablecopies"].ToString()) - 1);
                    break;
                }
            }
        }
        TableRow td = new TableRow();
        TableCell tv = new TableCell();
        TableCell tv1 = new TableCell();
        tv1.Text = "Total Amount";
        TableCell tv2 = new TableCell();
        td.Cells.Add(tv1);
        td.Cells.Add(tv2);
        tv.Text = sum.ToString();
        td.Cells.Add(tv);
        Table1.Rows.Add(td);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        for (int i = 0; i < objlt.Count; i++)
        {
            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connn;
            cmd.CommandText = "UPDATE book_details SET availablecopies=@c WHERE ISBN=@isbn";
            cmd.Parameters.AddWithValue("@c", count[i]);
            cmd.Parameters.AddWithValue("@isbn", objlt[i]);
            connn.Open();
            int res=cmd.ExecuteNonQuery();
        }
        Label1.Text = "<br>Thankyou for shopping with us. You may collect Your items from the counter.";
        objlt.Clear();
        Session["cart"] = null;
    }
    
}