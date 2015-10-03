using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;
using MainDataModuleTableAdapters;

public partial class ascx_frm_RecievedMessageList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
  //      lbl_rowscount.Text = new tbl_sms_recieved_formattedTableAdapter().GetCountMessages(Convert.ToInt32(Session["owner"].ToString())).Value.ToString();
    }
    protected void gr_RecMessages_RowCreated(object sender, GridViewRowEventArgs e)
    {
     
    }
    protected void gr_RecMessages_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Text = "1";
            DataRowView drv = (e.Row.DataItem as DataRowView);
            int rowid = Convert.ToInt32(drv.Row["srf_id"].ToString());
            string cellno = drv.Row["srf_cellno"].ToString();
            DateTime dt = new DateTime();
           
            if (drv.Row["LastDateOfRead"] != null)
            {
                try
                {
                    dt = Convert.ToDateTime(drv.Row["LastDateOfRead"].ToString());
                }
                catch (Exception _e)
                {
                    dt = DateTime.Now;
                }
            }
            
            e.Row.Cells[3].Text = new MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter().GetCellOwnerNameFromCellPhone(cellno);
            e.Row.Cells[4].Text = (string)new MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter().GetCustomerNameFromCellNO(cellno);
            
            {
                if (dt != DateTime.Now)
                {
                    e.Row.Cells[5].Text = new main_class().Convert_to_Shamsi(dt)+" "+dt.TimeOfDay.ToString();
                    e.Row.Cells[5].Text = "  <a href=\"links.aspx?page_id=0&_type=1&_id=" + rowid.ToString() + "\"> خوانده شده در تاریخ </a>" + e.Row.Cells[5].Text;

                }
                else
                {
                    e.Row.BackColor = Color.FromName("#E4CFB1");
                    e.Row.Cells[5].Text = "  <a href=\"links.aspx?page_id=0&_type=1&_id=" + rowid.ToString() + "\"> خوانده نشده </a>" + e.Row.Cells[5].Text;
                }
            }
   
        }

    }
    protected void gr_RecMessages_DataBound(object sender, EventArgs e)
    {
        
    }
    protected void gr_RecMessages_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void lnk_filter_Click(object sender, EventArgs e)
    {
        string sqlwherestr ="";
        string sqlstr = " select *, (select top 1 srfd_datepost from tbl_sms_recieved_formatted_details where srfd_sms_recieved_formatted_link = srf_id) as LastDateOfRead from tbl_sms_recieved_formatted where srf_owner_link=@OwnerID and srf_ParameterCommand = -1 <1> order by srf_date_recieved desc ";
        switch (drp_search_selectfield.SelectedValue)
        {
            case "1":
                sqlwherestr = " and srf_cellno like '%"+txt_searchValue.Text+"%'";
                break;
            case "2":
                sqlwherestr = " and srf_Message like '%" + txt_searchValue.Text + "%'";
                break;
            case "3":
                sqlwherestr = " and srf_cellno in (select cc_cellno from tbl_customer_cells where cc_name like '%"+txt_searchValue.Text+"%') ";
                break;
            case "4":
                sqlwherestr = " and srf_cellno in (select cc_cellno from tbl_customer_cells where cc_customer_link in ( select c_id from tbl_customers where c_name like '%" + txt_searchValue.Text + "%')) ";
                break;

        }
        sqlstr = Regex.Replace(sqlstr, "<1>", sqlwherestr);
        sds_RecievedMessagesList.SelectCommand = sqlstr;
        gr_RecMessages.DataBind();
        lnk_filter_remove.Visible = true;
    }
    protected void sds_RecievedMessagesList_DataBinding(object sender, EventArgs e)
    {
        
    }
    protected void lnk_filter_remove_Click(object sender, EventArgs e)
    {
        string sqlstr = " select *, (select top 1 srfd_datepost from tbl_sms_recieved_formatted_details where srfd_sms_recieved_formatted_link = srf_id) as LastDateOfRead from tbl_sms_recieved_formatted where srf_owner_link=@OwnerID and srf_ParameterCommand = -1  order by srf_date_recieved desc ";
        sds_RecievedMessagesList.SelectCommand = sqlstr;
        gr_RecMessages.DataBind();
        lnk_filter_remove.Visible = false;

    }
    protected void sds_RecievedMessagesList_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lbl_rowscount.Text = e.AffectedRows.ToString();
    }
    protected void gr_RecMessages_Load(object sender, EventArgs e)
    {
        
    }
    protected void gr_RecMessages_DataBinding(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        new tbl_sms_recieved_formattedTableAdapter().Delete(Convert.ToInt32((sender as LinkButton).ToolTip));
        gr_RecMessages.DataBind();
    }
}
