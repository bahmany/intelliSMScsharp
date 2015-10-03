using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MainDataModuleTableAdapters;

public partial class ascx_frm_OwnerAndCellCenterManagerChangeAuto : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["smsCenterID"] != null)
            {
                int smsCenterID = Convert.ToInt32(Session["smsCenterID"].ToString());
                foreach (DataRow dr in new tbl_sms_centersTableAdapter().GetDataBy1(smsCenterID))
                {

                    CheckBox1.Checked = Convert.ToBoolean(dr["s_auto_answer"].ToString());
                    TextBox1.Text = dr["s_auto_answer_text"].ToString();

                }
            }

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        new tbl_sms_centersTableAdapter().ChangeAutoAnswer(CheckBox1.Checked, TextBox1.Text, Convert.ToInt32(Session["smsCenterID"].ToString()));
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Sf", "اطلاعات شما ثبت شد", true);
    }
}
