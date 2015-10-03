using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MainDataModuleTableAdapters;
using System.Collections;

public partial class ascx_frm_SendSMSList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gr_group_list_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = (e.Row.DataItem as DataRowView);
            (e.Row.Cells[3].FindControl("txt_date") as TextBox).Text = new main_class().Convert_to_Shamsi(
                Convert.ToDateTime(drv.Row["sg_datesend"].ToString()));

            (e.Row.Cells[3].FindControl("txt_time") as TextBox).Text = new main_class().Convert_to_standard_time(
                Convert.ToDateTime(drv.Row["sg_datesend"].ToString()).TimeOfDay);

        }
    }
    protected void gr_group_list_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "PostDate")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gr_group_list.Rows[index];
            DateTime dt = Convert.ToDateTime(
               new main_class().Convert_to_Midaly(
                (row.Cells[3].FindControl("txt_date") as TextBox).Text)


                + " " + (row.Cells[3].FindControl("txt_time") as TextBox).Text);
            int id = Convert.ToInt32((row.Cells[3].FindControl("LinkButton4") as LinkButton).ToolTip);
            new MainDataModuleTableAdapters.tbl_sms_send_groupsTableAdapter().ChangeSendDate(dt, id, Convert.ToInt32(Session["owner"].ToString()));
            new MainDataModuleTableAdapters.tbl_sms_sendTableAdapter().ChangeSMSSendTimeByGroupID(dt, id, Convert.ToInt32(Session["owner"].ToString()));

            gr_group_list.DataBind();



        }
        if (e.CommandName == "AppearPostDate")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gr_group_list.Rows[index];
            (row.Cells[3].FindControl("pnl_ChangeDate") as Panel).Visible = true;
        }
        if (e.CommandName == "DelGroup")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gr_group_list.Rows[index];
            (row.Cells[3].FindControl("pnl_ِDeleteGroup") as Panel).Visible = true;
        }
    }
    protected void gr_group_list_RowCreated(object sender, GridViewRowEventArgs e)
    {
        int RowState = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = (DataRowView)e.Row.DataItem;
            if (drv != null)
            {
                RowState = Convert.ToInt32(drv["sg_position"].ToString());
            }

            LinkButton addButton = (LinkButton)e.Row.Cells[3].FindControl("LinkButton4");
            addButton.CommandArgument = e.Row.RowIndex.ToString();
            LinkButton AppButton = (LinkButton)e.Row.Cells[3].FindControl("lbl_changeSendTime");
            AppButton.CommandArgument = e.Row.RowIndex.ToString();
            LinkButton DelButton = (LinkButton)e.Row.Cells[3].FindControl("LinkButton3");
            DelButton.CommandArgument = e.Row.RowIndex.ToString();

            if (RowState == 0)
            {
                AppButton.Visible = true;
                DelButton.Visible = true;

            }
            else
            {
                AppButton.Visible = false;
                DelButton.Visible = false;


            }

        }

    }
    protected void lbl_changeSendTime_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        gr_group_list.DataBind();
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        int groupid = Convert.ToInt32(Convert.ToInt32((sender as LinkButton).ToolTip));
        int sessionid = Convert.ToInt32(Convert.ToInt32((Session["owner"].ToString())));

        new tbl_sms_sendTableAdapter().DeleteSMSGroup(groupid, sessionid);
        new tbl_sms_send_groupsTableAdapter().DeleteByID(groupid, sessionid);



        DataTable dt = new MainDataModuleTableAdapters.tbl_sms_sendTableAdapter().GetDataByGroupID(groupid, sessionid) ;

        ArrayList al = new ArrayList();
        int msgCount = Convert.ToInt16(new main_class().get_value_from_setting("messagecount"));
        main_class mc = new main_class();
        foreach (DataRow dr in dt.Rows)
        {
            al.Add(mc.GetAMessageCount(dr["s_body"].ToString()));
        }

        int recieversCount = 0;
        int sentCount = 0;
        double sentCost = 0;
        double currentCredit = 0.0;
        double FarsiCost = 0;
        double EnglishCost = 0;

        foreach (DataRow dr in new MainDataModuleTableAdapters.tbl_sms_billingTableAdapter().GetDataBy1(
            Convert.ToInt32(Session["owner"].ToString())).Rows)
        {
            FarsiCost = Convert.ToDouble(dr["sb_FarsiSMSPrice"].ToString());
            EnglishCost = Convert.ToDouble(dr["sb_EngSMSPrice"].ToString());
        }


        foreach (main_class.MessageProperties mp in al)
        {
            recieversCount = recieversCount + 1;
            sentCount = sentCount + mp.howManyMessage;
            if (mp.isFarsi) { sentCost = sentCost + FarsiCost; }
            else { sentCost = sentCost + EnglishCost; }
        }


        new tbl_sms_billing_addcreditTableAdapter().Insert(sessionid,sentCost,DateTime.Now,"برگشت پیام های حذف شده به کد "+groupid.ToString());



        gr_group_list.DataBind();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

    }
}
