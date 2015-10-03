<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;




public class Handler : IHttpHandler {

    public string GetJSTableString(int OwnerID)
    {
        string str = "";
        SqlConnection sqlc = new SqlConnection(new main_class().get_connection_string());
        sqlc.Open();
        SqlCommand sc = new SqlCommand(
        " select *,(select top 1 cg_name from tbl_customer_groups where cg_id = tbl_customers.c_group_link) as GroupName, "+
        " (select top 1 cr_name from tbl_customer_responsibilty where cr_id = tbl_customers.c_responsibily_link) as ResponsibiltyName, "+
        " isnull((select top 1 cc_cellno from tbl_customer_cells where tbl_customer_cells.cc_customer_link = tbl_customers.c_id order by tbl_customer_cells.cc_priority asc),'') as CellPhone "+
        " from tbl_customers where c_owner_link = "+OwnerID.ToString(),sqlc);
        SqlDataReader sdr = sc.ExecuteReader();
        string name, family, group, masoliat, shomareh;
        int i=0;
        char ch = ',';
        while (sdr.Read())
        {
            name = sdr["c_name"].ToString();
            family = sdr["c_family"].ToString();
            group = sdr["GroupName"].ToString();
            masoliat = sdr["ResponsibiltyName"].ToString();
            shomareh = sdr["CellPhone"].ToString();
            if (i != 0) { ch = '?'; } else { ch = ' '; }
            str += string.Format(ch+"[\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\"]", name, family, group, masoliat, shomareh);
            i++;
        }

        str = "$('#example').dataTable( { \"aaData\":" + str + "]," + "\"aoColumns\":" + "[" +
            "{ \"sTitle\": \"Engine\" }," +
            "{ \"sTitle\": \"Browser\" }," +
            "{ \"sTitle\": \"Platform\" }," +
            "{ \"sTitle\": \"Engine\" }," +
            "{ \"sTitle\": \"Browser\" }});";

  
        return str;
    }
    
    
    
    
    public void ProcessRequest (HttpContext context) {

        if (context.Request.Params["on"] != null)
        {
            string OrderName = context.Request.Params["on"];
            if ( OrderName == "gclf" )
            {
                //string OwnerID = context.Request.Params[""];
                int ownerid = Convert.ToInt32( new main_class().Decode(context.Request.Params["id"].ToString()));
                //int ownerid = Convert.ToInt32( context.Request.Params["id"].ToString());
                //int ownerid = Convert.ToInt32(HttpContext.Current.Session["OwnerID"].ToString());
                
                context.Response.Write(GetJSTableString(ownerid));
     
                    context.Response.End();
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}