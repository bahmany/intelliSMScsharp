using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ascx_frm_OpinionGetter : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        lbl_errmsg.Text = "";

        try
        {


            if (Session["id"] == null)
            {

                if (Convert.ToInt32(new MainDataModuleTableAdapters.tbl_sms_mapperTableAdapter().CheckForDublicate(Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionstartdate.Text, txt_opinionstarttime.Text)),
                    Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionenddate.Text, txt_opinionendtime.Text)),
                    (int)new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetSmSCenterID(Convert.ToInt32(Session["owner"].ToString()))
                    ).ToString()) == 0)
                {

                    new MainDataModuleTableAdapters.tbl_sms_mapperTableAdapter().Insert(
                        (int)new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetSmSCenterID(Convert.ToInt32(Session["owner"].ToString())),
                        chk_responseSms.Checked, 1, true,
                        "", "نظر شما گزینه <1> میباشد  باتشکر",
                         Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionstartdate.Text, txt_opinionstarttime.Text)),
                        Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionenddate.Text, txt_opinionendtime.Text)), false, ".", 0, 0, 0,
                        "", "", "", "", "", "", "", "", "", "", "", "", txt_opinionname.Text);
                    gr_OpinionGrid.DataBind();
                    txt_opinionendtime.Text = "";
                    txt_opinionenddate.Text = "";
                    txt_opinionstartdate.Text = "";
                    txt_opinionstarttime.Text = "";
                    txt_opinionname.Text = "";
                }
                else { lbl_errmsg.Text = "در تاریخ های وارد شده نظر سنجی دیگری وجود دارد لطفا تاریخ را اصلاح نمایید"; }
            }
            else
            {
                if (Convert.ToInt32(new MainDataModuleTableAdapters.tbl_sms_mapperTableAdapter().CheckForDublicate(Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionstartdate.Text, txt_opinionstarttime.Text)),
        Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionenddate.Text, txt_opinionendtime.Text)),
        (int)new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetSmSCenterID(Convert.ToInt32(Session["owner"].ToString()))
        ).ToString()) == 1)
                {
                    new MainDataModuleTableAdapters.tbl_sms_mapperTableAdapter().Update(

                        (int)new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetSmSCenterID(Convert.ToInt32(Session["owner"].ToString())),
                        chk_responseSms.Checked, 1, true,
                        "", "نظر شما گزینه <1> میباشد  باتشکر",
                         Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionstartdate.Text, txt_opinionstarttime.Text)),
                        Convert.ToDateTime(new main_class().Convert_to_Midaly(txt_opinionenddate.Text, txt_opinionendtime.Text)), false, ".", 0, 0, 0,
                        "", "", "", "", "", "", "", "", "", "", "", "", txt_opinionname.Text, Convert.ToInt32(Session["id"]));
                    Session.Remove("id");
                    gr_OpinionGrid.DataBind();
                    txt_opinionendtime.Text = "";
                    txt_opinionenddate.Text = "";
                    txt_opinionstartdate.Text = "";
                    txt_opinionstarttime.Text = "";
                    txt_opinionname.Text = "";
                }
                else { lbl_errmsg.Text = "در تاریخ های وارد شده نظر سنجی دیگری وجود دارد لطفا تاریخ را اصلاح نمایید"; }
            }

        }
        catch (Exception _e)
        {
            lbl_errmsg.Text = "اطلاعات ثبت نشد" + _e.Message;
        }

    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        foreach (DataRow dr in new MainDataModuleTableAdapters.tbl_sms_mapperTableAdapter().GetDataBy1(Convert.ToInt32((sender as LinkButton).ToolTip)).Rows)
        {
            txt_opinionname.Text = dr["sm_name"].ToString();
            txt_opinionstartdate.Text = new main_class().Convert_to_Shamsi(Convert.ToDateTime(dr["sm_active_startdate"].ToString()));
            txt_opinionstarttime.Text = new main_class().Convert_to_standard_time(Convert.ToDateTime(dr["sm_active_startdate"].ToString()).TimeOfDay);
            txt_opinionenddate.Text = new main_class().Convert_to_Shamsi(Convert.ToDateTime(dr["sm_active_enddate"].ToString()));
            txt_opinionendtime.Text = new main_class().Convert_to_standard_time(Convert.ToDateTime(dr["sm_active_enddate"].ToString()).TimeOfDay);
            chk_responseSms.Checked = Convert.ToBoolean(dr["sm_type"].ToString());
            Session["id"] = dr["sm_id"].ToString();

        }
    }
}
