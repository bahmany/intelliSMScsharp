using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ascx_frm_AdvanceSendSMS : System.Web.UI.UserControl
{

    public string GetJSTableString(int OwnerID)
    {
        string str = "";
        SqlConnection sqlc = new SqlConnection(new main_class().get_connection_string());
        sqlc.Open();
        SqlCommand sc = new SqlCommand(
        " select *,(select top 1 cg_name from tbl_customer_groups where cg_id = tbl_customers.c_group_link) as GroupName, " +
        " (select top 1 cr_name from tbl_customer_responsibilty where cr_id = tbl_customers.c_responsibily_link) as ResponsibiltyName, " +
        " isnull((select top 1 cc_cellno from tbl_customer_cells where tbl_customer_cells.cc_customer_link = tbl_customers.c_id order by tbl_customer_cells.cc_priority asc),'') as CellPhone " +
        " from tbl_customers where c_owner_link = " + OwnerID.ToString(), sqlc);
        SqlDataReader sdr = sc.ExecuteReader();
        string name, family, group, masoliat, shomareh;
        int i = 0;
        char ch = ',';
        while (sdr.Read())
        {
            name = sdr["c_name"].ToString();
            family = sdr["c_family"].ToString();
            group = sdr["GroupName"].ToString();
            masoliat = sdr["ResponsibiltyName"].ToString();
            shomareh = sdr["CellPhone"].ToString();
            if (i != 0) { ch = ','; } else { ch = ' '; }
            str += ch + "[" + string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\",\"{6}\"",
                "<input type=checkbox runat=server id=chk_" + sdr["c_id"].ToString() + " />",
            name, family, group, masoliat, shomareh
                , "<input type=text runat=server id=txt_" + sdr["c_id"].ToString() + " />"
                ) + "]";
            i++;
        }


       // <input type=checkbox runat=server />
    str =  "$(document).ready(function() {"+
    "$('#divTable').html('<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\" id=\"example\"></table>');" +

       "$('#example').dataTable( { \"aaData\":[" + str + "]," + "\"aoColumns\":" + "[" +
            "{ \"sTitle\": \" ارسال\" }," +
            "{ \"sTitle\": \"نام\" }," +
            "{ \"sTitle\": \"نام خانوادگی\" }," +
            "{ \"sTitle\": \"گروه\" }," +
            "{ \"sTitle\": \"مسئولیت\" }," +
            "{ \"sTitle\": \"موبایل\" }," +
            "{ \"sTitle\": \"متن پیام\" }" +
        "]});});";


        return str;
    }
    


    protected void Page_Load(object sender, EventArgs e)
    {
        //this is for loading datatable ..
       // ScriptManager.RegisterStartupScript(this, this.GetType(), "rwetyf", "OwnerID='" +
        //new main_class().Encode(Session["OwnerID"].ToString()) + "'; ", true);
       
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "twfss"," requestTableData(); ", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "twfss",GetJSTableString(Convert.ToInt32(Session["OwnerID"].ToString())) , true);

    }
}
