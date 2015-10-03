using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;

public partial class ascx_pnl_Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] cookies = Request.Cookies.AllKeys;
        foreach (string cookie in cookies)
        {
            Response.Cookies[cookie].Expires = DateTime.Now.AddDays(-1);
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        tbl_usersTableAdapter tb = new tbl_usersTableAdapter();
        int ownerID = 0;
        int userWeight = 99;
        try
        {
            ownerID = (int)tb.GetOwnerIDfromUsername(TextBox1.Text, new main_class().Encode(TextBox2.Text));
            userWeight = (int)tb.GetUserGroupWeight(TextBox1.Text);
        }
        catch (Exception __e)
        {
            Response.Redirect("login.aspx");
        }
        if (ownerID != -1)
        {
            Response.Cookies.Add(new HttpCookie("username", TextBox1.Text));
            Response.Cookies.Add(new HttpCookie("password", new main_class().Encode(TextBox2.Text)));
            Response.Cookies.Add(new HttpCookie("owner", new main_class().Encode(ownerID.ToString())));
            Response.Cookies.Add(new HttpCookie("userWeight", new main_class().Encode(userWeight.ToString())));
            

            //Session["modulename"] = "مانیتورینگ";
            string mdname = "default.aspx";
            if (Session["modulename"] != null)
            {

            }
            else
            {
                //mdname = Session["modulename"].ToString();
            }
            Response.Redirect("links.aspx?page_id=11");

        }
        else { Label3.Visible = true; }

    }
}
