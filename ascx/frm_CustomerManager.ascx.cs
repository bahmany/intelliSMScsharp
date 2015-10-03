using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MainDataModuleTableAdapters;

public partial class ascx_frm_CustomerManager : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataBind();
            gr_cells.DataBind();
            if (Session["code"] != null)
            {
               // Session.Remove("code");
            }
        }


        if (IsPostBack)
        {
            if (Session["code"] != null)
            {
                Panel1.Visible = false;
                pnl_cellNo.Visible = true;
            }
        }

        if (Session["code"] == null)
        {
            Panel1.Visible = true;
            pnl_cellNo.Visible = false;
        }



        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = SqlDataSource2.FilterExpression;
        int rowcount = dv.Count;
        lbl_customer_count.Text = rowcount.ToString();
        
    }
    public void clearform()
    {
        
        txt_addr.Text = "";
        txt_addrzarori.Text = "";
        txt_datebirth.Text = "";
        txt_family.Text = "";
        txt_handcode.Text = "";
        txt_MilliCode.Text = "";
        txt_name.Text = "";
        txt_postalcode.Text = "";
        txt_shsh.Text = "";
        txt_tel.Text = "";
        txt_telzarori.Text = "";

    }
    protected void lnk_post_Click(object sender, EventArgs e)
    {

        if (Session["code"] == null)
        {
            int sess = Convert.ToInt32(Session["owner"].ToString());
            ods_customer.Insert();

        }
        else
        {
            ods_customer.Update();
            lt_jqexecuter.Text = "";
            

          /*   int id = Convert.ToInt32(Session["code"].ToString());


           
                        string sql = 
                           string.Format("UPDATE [tical].[dbo].[tbl_customers] "+
            "   SET [c_owner_link] = {0} "+
            "      ,[c_group_link] = {1} "+
            "      ,[c_name] = '{2}' "+
            "      ,[c_family] = '{3}' "+
            "      ,[c_sex] = {4} "+
            "      ,[c_birth_date] = '{5}' "+
            "      ,[c_postal_code] = '{6}' "+
            "      ,[c_melli_code] = '{7}' "+
            "      ,[c_shsh] = '{8}' "+
            "      ,[c_phonelineno] = '{9}' "+
            "      ,[c_address] = '{10}' "+
            "      ,[c_phoneline_necessary] = '{11}' "+
            "      ,[c_address_necessary] = '{12}' "+
            "      ,[c_responsibily_link] = {13} "+
            "      ,[c_handcode] = '{14}' "+
            "      "+
            " WHERE c_id = {15}",9999,
                             Convert.ToInt32(drp_group.SelectedValue),
                             txt_name.Text,
                             txt_family.Text,
                             Convert.ToInt32(drp_jensiat.SelectedValue),
                             txt_datebirth.Text,
                             txt_postalcode.Text,
                             txt_MilliCode.Text,
                             txt_shsh.Text,
                             txt_tel.Text,
                             txt_addr.Text,
                             txt_telzarori.Text,
                             txt_addrzarori.Text,
                             Convert.ToInt32(drp_responsibily.SelectedValue),
                             txt_handcode.Text,
                             id.ToString());
                        */
            /* int change =  new MainDataModuleTableAdapters.tbl_customersTableAdapter().UpdateQuery(
                  Convert.ToInt32(drp_group.SelectedValue),
                  txt_name.Text,
                  txt_family.Text,
                  Convert.ToInt32(drp_jensiat.SelectedValue),
                  txt_datebirth.Text,
                  txt_postalcode.Text,
                  txt_MilliCode.Text,
                  txt_shsh.Text,
                  txt_tel.Text,
                  txt_addr.Text,
                  txt_telzarori.Text,
                  txt_addrzarori.Text,
                  Convert.ToInt32(drp_responsibily.SelectedValue),
                  txt_handcode.Text,9999,
                  id);*/
           
            

          //  sds_updator.Update();
        }
        clearform();
        Session.Remove("code");
        //Response.Redirect(Request.Url.PathAndQuery);
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void lnk_edit_Click(object sender, EventArgs e)
    {

    }
    protected void lnk_delete_Click(object sender, EventArgs e)
    {
        if (Session["code"] != null)
        {
            int id = Convert.ToInt32(Session["code"].ToString());
            //new MainDataModuleTableAdapters.tbl_customersTableAdapter().DeleteQuery(id);

        }
        if (Request.Cookies["code"] != null)
        {
            int id = Convert.ToInt32(Request.Cookies["code"].Value.ToString());
            //new MainDataModuleTableAdapters.tbl_customersTableAdapter().DeleteQuery(id);

        }
        
        
    }
    protected void lnk_delete_Click1(object sender, EventArgs e)
    {

        try
        {
            if (Session["code"] != null)
            {
                int id = Convert.ToInt32(Session["code"].ToString());
                new MainDataModuleTableAdapters.tbl_customersTableAdapter().DeleteQuery(id);
                lt_jqexecuter.Text = "";
                Session.Remove("code");
            }
            if (Request.Cookies["code"] != null)
            {
                int id = Convert.ToInt32(Request.Cookies["code"].Value.ToString());
                new MainDataModuleTableAdapters.tbl_customersTableAdapter().DeleteQuery(id);
                lt_jqexecuter.Text = "";
                Request.Cookies["code"].Expires = DateTime.Now.AddDays(-1);

            }


            Session.Remove("code");
            clearform();
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        catch(Exception __e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "j1", "alert('لطفا ابتدا موبایل های زیر شاخه را حذف نمایید')", true);

        }

        //dls_custmers.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
            new tbl_customer_cellsTableAdapter().InsertQuery(
                txt_cellname.Text,
                txt_cellno.Text,
                Convert.ToInt32(drp_cellpermission.SelectedValue),
                0,
                Convert.ToInt32(Session["code"]));

            gr_cells.DataBind();
        /*
           if (e.CommandArgument == "postcell")
           {

               int RowID = Convert.ToInt32(e.Item.ItemIndex);//Convert.ToInt32(e.CommandArgument.ToString());

               int RowKey = Convert.ToInt32((dls_custmers.Items[RowID].FindControl("lbl2") as Label).Text);
               string txt1 = ((TextBox)dls_custmers.Items[RowID].FindControl("txt_cellname")).Text;
               string txt2 = ((TextBox)dls_custmers.Items[RowID].FindControl("txt_cellno")).Text;
               int val1 = Convert.ToInt32(((dls_custmers.Items[RowID].FindControl("drp_cellpermission") as DropDownList).SelectedValue.ToString()));
         

            
               dls_custmers.DataBind();
               //GridView1.DataBind();
           } */
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.PathAndQuery);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.PathAndQuery);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        ods_customer_group.Insert();
      //  GridView3.DataBind();
        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
      
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
    protected void drp_cellpermission_SelectedIndexChanged(object sender, EventArgs e)
    {
        new tbl_customer_cellsTableAdapter().ChangeCellType(
  Convert.ToInt32((sender as DropDownList).SelectedValue.ToString()),
  Convert.ToInt32((sender as DropDownList).ToolTip.ToString()));
      //  dls_custmers.DataBind();
        
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {

        new MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter().DeleteQuery(Convert.ToInt32((sender as LinkButton).ToolTip));
        gr_cells.DataBind();
  //      dls_custmers.DataBind();


    }
    protected void chk_active_CheckedChanged(object sender, EventArgs e)
    {
        new MainDataModuleTableAdapters.tbl_customersTableAdapter().ChangeUserActive(
            (sender as CheckBox).Checked,
            Convert.ToInt32((sender as CheckBox).ToolTip));
    //    dls_custmers.DataBind();
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
   
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
    }
    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {

    }
    protected void LinkButton1_Click2(object sender, EventArgs e)
    {
        SqlDataSource2.FilterExpression = "[" + DropDownList1.SelectedValue.ToString() + "]" + " LIKE '%" + TextBox1.Text + "%'";
        GridView1.DataBind();
    }
    protected void LinkButton2_Click2(object sender, EventArgs e)
    {
        foreach (DataRow dr in new MainDataModuleTableAdapters.tbl_customersTableAdapter().GetInformationOfByID(Convert.ToInt32((sender as LinkButton).ToolTip)))
        {
            Session["code"] = (sender as LinkButton).ToolTip;
            txt_addr.Text = dr["c_address"].ToString();
            txt_addrzarori.Text = dr["c_address_necessary"].ToString();
            txt_datebirth.Text = dr["c_birth_date"].ToString();
            txt_family.Text = dr["c_family"].ToString();
            txt_handcode.Text = dr["c_handcode"].ToString();
            txt_MilliCode.Text = dr["c_melli_code"].ToString();
            txt_name.Text = dr["c_name"].ToString();
            txt_postalcode.Text = dr["c_postal_code"].ToString();
            txt_shsh.Text = dr["c_shsh"].ToString();
            txt_tel.Text = dr["c_phonelineno"].ToString();
            txt_telzarori.Text = dr["c_phoneline_necessary"].ToString();
            drp_group.SelectedValue = dr["c_group_link"].ToString();
            drp_jensiat.SelectedValue = dr["c_sex"].ToString();


   

            //txt_mobile.Text = 
            //lt_jqexecuter.Text = "<script> var maskHeight = $(document).height(); var maskWidth = $(window).width();$('#mask').css({ 'width': maskWidth, 'height': maskHeight });$('#mask').fadeIn(1000);$('#mask').fadeTo(\"slow\", 0.8);var winH = $(window).height();var winW = $(window).width();$('#dialog').css('top', winH / 2 - $('#dialog').height() / 2);$('#dialog').css('left', winW / 2 - $('#dialog').width() / 2);$('#dialog').fadeIn(2000); </script>";
        }


        Panel1.Visible = false;
        pnl_cellNo.Visible = true;
    }
    protected void LinkButton3_Click1(object sender, EventArgs e)
    {
        Session.Remove("code");
        clearform();
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}
