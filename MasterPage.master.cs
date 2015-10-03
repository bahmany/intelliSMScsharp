using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;

public partial class MasterPage : System.Web.UI.MasterPage
{

    public int GetUserNameAndPasswordAndReturnOwnerID(string username, string password)
    {
        int ownerid = -1;


        /*string username = "guest";
        string pass = "pRS+UaJqCcwAcBEcdkJ6UmEQwvtkSm4GGero4+PfWIUrC7XpxXsgxi9xr0ha6paZ";

        if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
        {
            username = Request.Cookies["username"].Value.ToString();
            pass = Request.Cookies["password"].Value.ToString();
        }*/

        tbl_usersTableAdapter tb = new tbl_usersTableAdapter();
        int ownerID = (int)tb.GetOwnerIDfromUsername(username, password);
        return ownerid;
    }


    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["owner"] == null)
        {
            Session["modulename"] = Request.Url.PathAndQuery;
            Response.Redirect("login.aspx");
        }
        else
        {
            try
            {
                string username = Request.Cookies["username"].Value.ToString();
                string pass = Request.Cookies["password"].Value.ToString();
                string ownerid = Request.Cookies["owner"].Value.ToString();
                string userWeight = Request.Cookies["userWeight"].Value.ToString();
                string useridfromDB = new main_class().Encode(((int)new tbl_usersTableAdapter().GetOwnerIDfromUsername(username, pass)).ToString());
                if (ownerid != useridfromDB)
                {
                    Session["modulename"] = Request.Url.PathAndQuery;

                    Response.Redirect("login.aspx");
                }
                else
                {
                    Session["owner"] = ((int)new tbl_usersTableAdapter().GetOwnerIDfromUsername(username, pass)).ToString();
                    Session["OwnerID"] = ((int)new tbl_usersTableAdapter().GetOwnerIDfromUsername(username, pass)).ToString();
                    Session["userWeight"] = new main_class().Decode(userWeight);
                    Session["username"] = username;
                    Session["password"] = pass;

                }
            }
            catch (Exception __e)
            {
                Response.Redirect("login.aspx");
            }
        }

        if (!IsPostBack)
        {

           Literal1.Text = new tbl_sms_recieved_formattedTableAdapter().GetUnreadSMSCount(Convert.ToInt32(Session["owner"].ToString())).Value.ToString();
           lbl_OwnerName.Text = new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetOwnerNameFromOID(Convert.ToInt32(Session["owner"].ToString()));
           lbl_today.Text = new main_class().Convert_to_Shamsi(DateTime.Now);

        }

        lbl_current_value.Text = new MainDataModuleTableAdapters.tbl_sms_billingTableAdapter().GetLastCredit(Convert.ToInt32(Session["owner"].ToString()) ).ToString();
    
    
    }
    protected void RightMenuClicked(object sender, EventArgs e)
    {
        // Remeber Caption of LinkButtons must be highlighted
        LinkButton lb = sender as LinkButton;
        switch (lb.Text)
        {
            case "ارسال پیام":
                Response.Cookies.Add(new HttpCookie("linkname", "SendSMS"));
                Response.Cookies.Add(new HttpCookie("titlename", "1"));
                Response.Redirect("links.aspx?page_id=10");
                break;
            case "پیام های دریافتی":
                Response.Cookies.Add(new HttpCookie("linkname", "RecievedSMS"));
                Response.Cookies.Add(new HttpCookie("titlename", "2"));
                Response.Redirect("links.aspx?page_id=11");
                break;
            case "پیام های ارسالی":
                Response.Cookies.Add(new HttpCookie("linkname", "SentSMSList"));
                Response.Cookies.Add(new HttpCookie("titlename", "3"));
                Response.Redirect("links.aspx?page_id=12");
                break;
            case "صندوق پیشنهادات":
                break;
            case "نظرسنجی":
                Response.Cookies.Add(new HttpCookie("linkname", "Openions"));
                Response.Cookies.Add(new HttpCookie("titlename", "4"));
                Response.Redirect("links.aspx?page_id=13");
                break;
            case "مدیریت گیرندگان":
                Response.Cookies.Add(new HttpCookie("linkname", "CustomersAdmin"));
                Response.Cookies.Add(new HttpCookie("titlename", "5"));
                Response.Redirect("links.aspx?page_id=1");
                break;
            case "مدیریت نمرات":
                Response.Cookies.Add(new HttpCookie("linkname", "ResultsAdmin"));
                Response.Cookies.Add(new HttpCookie("titlename", "6"));
                Response.Redirect("links.aspx?page_id=8");
                break;

            case "تنظیمات":
                Response.Cookies.Add(new HttpCookie("linkname", "ُSettings"));
                Response.Cookies.Add(new HttpCookie("titlename", "7"));
                Response.Redirect("links.aspx?page_id=16");
                break;


        }
    }
    protected void lnk_SuggestionList_Click(object sender, EventArgs e)
    {

    }
    protected void lnk_signout_Click(object sender, EventArgs e)
    {
        Response.Cookies.Add(new HttpCookie("username",""));
        Response.Cookies.Add(new HttpCookie("password", ""));
        Response.Cookies.Add(new HttpCookie("owner", ""));
        Response.Redirect("login.aspx");

    }
    protected void lnk_charge_Click(object sender, EventArgs e)
    {
        Response.Redirect("links.aspx?page_id=15");
    }
}
