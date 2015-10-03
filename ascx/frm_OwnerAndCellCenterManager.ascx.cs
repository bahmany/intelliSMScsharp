using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ascx_frm_OwnerManager : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void clearform()
    {
        for (int i = 0; i < Page.Controls.Count; i++)
        {
            if (Page.Controls[i] is TextBox)
            {
                (Page.Controls[i] as TextBox).Text = "";
            }
        }
    }
    protected void lnk_smscenter_post_Click(object sender, EventArgs e)
    {
        new MainDataModuleTableAdapters.tbl_sms_centersTableAdapter().Insert(txt_s_name.Text, txt_s_smsCenterNo.Text, txt_s_seperator_char.Text, txt_s_space_char.Text, txt_s_username.Text, txt_s_password.Text,false,"");
        gr_SMSCenter.DataBind();
        clearform();

    }
    protected void lnk_postowner_Click(object sender, EventArgs e)
    {
        new MainDataModuleTableAdapters.tbl_ownerTableAdapter().Insert(txt_o_name.Text,txt_o_exp.Text,Convert.ToInt32(drp_o_sms_center_link.SelectedValue.ToString()),DateTime.Now);
        gr_owner.DataBind();
        clearform();

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["smsCenterID"] = (sender as LinkButton).ToolTip;
        ScriptManager.RegisterStartupScript(this, this.GetType(), "fgfsd", "poptop11('1');  ", true);
    }
}
