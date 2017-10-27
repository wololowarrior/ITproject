using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Label2.Visible = true;
            Label4.Text = "<i>WELCOME "+Session["user"].ToString()+"</i>";
        }
        else
        {
            Label3.Visible = true;
            Label1.Text = "Automated BMS";
        }
    }
}
