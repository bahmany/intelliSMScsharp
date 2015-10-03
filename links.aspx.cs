using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;

public partial class links : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["page_id"] != null)
        {
            string page_id = Request.QueryString["page_id"].ToString();
 

            if (page_id == "0")
            {
                string _type = Request.QueryString["_type"].ToString();
                switch (_type)
                {
                    case "1":
                        string _id = Request.QueryString["_id"].ToString();

                        new MainDataModuleTableAdapters.tbl_sms_recieved_formatted_detailsTableAdapter().Insert(Convert.ToInt32(_id), 1, DateTime.Now);
                     Response.Redirect("links.aspx?page_id=11");
                        break;
                }
            }
            else
            {
                string form_name = new tbl_modulesTableAdapter().GetFormNameFromID(Convert.ToInt16(page_id));
                string form_to_transfer = "loader.aspx?moduleid=" + form_name+"&"+Request.Url.Query;
                Response.Redirect(form_to_transfer);

            }







        }
    }
}
