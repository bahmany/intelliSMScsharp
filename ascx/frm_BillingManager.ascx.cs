using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ascx_frm_BillingManager : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnk_CreditOK_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Insert();
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this,this.GetType(),"v","اعتبار مورد نظر اضافه گردید",true);
        }
        catch (Exception __e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "v", __e.Message, true);
        }

    }
}
