using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;
using System.Text.RegularExpressions;

public partial class frmRegistrationForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void clearform()
    {
        TextBox6.Text = "";
        TextBox15.Text = "";
        TextBox16.Text = "";
        TextBox17.Text = "";
        TextBox18.Text = "";
        TextBox19.Text = "";
        TextBox20.Text = "";
        TextBox21.Text = "";
        TextBox22.Text = "";

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (new main_class().is_user_available_by_username(TextBox23.Text) == false)
        {
            if (new MainDataModuleTableAdapters.tbl_usersTableAdapter().CheckEmail(TextBox18.Text) == 0)
            {

                tbl_usersTableAdapter md = new tbl_usersTableAdapter();
                md.InsertIntoUsers(TextBox23.Text, new main_class().Encode(TextBox19.Text), "", TextBox6.Text, TextBox15.Text, TextBox16.Text, TextBox17.Text, TextBox18.Text, TextBox20.Text, TextBox21.Text, TextBox22.Text, Convert.ToInt32(Session["owner"].ToString()));
                pnl_registration_complete.Visible = true;
                pnl_registration_form.Visible = false;
                pnl_registration_forget.Visible = false;
            }
            else
            {
                pnl_registration_complete.Visible = false;
                pnl_registration_form.Visible = false;
                pnl_registration_forget.Visible = true;
       
            }
        }
        else
        {
            pnl_registration_complete.Visible = false;
            pnl_registration_form.Visible = false;
            pnl_registration_forget.Visible = true;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clearform();
        pnl_registration_forget.Visible = false;
        pnl_registration_form.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/links.aspx?page_id=3"); // loading forgotten pass form
    }
}
