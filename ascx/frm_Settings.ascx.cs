using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MainDataModuleTableAdapters;

public partial class ascx_frm_Settings : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["stid"] != null)
        {
            
            int stid = Convert.ToInt32(Request.QueryString["stid"].ToString());
            string form_name = new tbl_modulesTableAdapter().GetFormNameFromID(Convert.ToInt16(stid));

            string username = "guest";
            string pass = "pRS+UaJqCcwAcBEcdkJ6UmEQwvtkSm4GGero4+PfWIUrC7XpxXsgxi9xr0ha6paZ";

            if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
            {
                username = Request.Cookies["username"].Value.ToString();
                pass = Request.Cookies["password"].Value.ToString();
            }

            Control cnt = LoadControl(new main_class().Load_Control(form_name, username, pass));
            ph_settings.Controls.Add(cnt);

        }
    }
}
