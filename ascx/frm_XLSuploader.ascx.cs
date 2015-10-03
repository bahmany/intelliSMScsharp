using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using MainDataModuleTableAdapters;
using System.Data.SqlTypes;


public partial class ascx_frm_XLSuploader : System.Web.UI.UserControl
{
    public string gd = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected OleDbCommand ExcelConnection()
    {

        // Connect to the Excel Spreadsheet
        string xConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;" +
        "Data Source=" + Server.MapPath("~/uploadedfiles/" + gd + ".xls") + ";" +
        "Extended Properties=Excel 8.0;";

        // create your excel connection object using the connection string
        OleDbConnection objXConn = new OleDbConnection(xConnStr);
        objXConn.Open();

        // use a SQL Select command to retrieve the data from the Excel Spreadsheet
        // the "table name" is the name of the worksheet within the spreadsheet
        // in this case, the worksheet name is "Members" and is coded as: [Members$]
        OleDbCommand objCommand = new OleDbCommand("SELECT * FROM [Sheet1$]", objXConn);
        return objCommand;

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (fu_account.HasFile)
        {


            try
            {
                gd = Guid.NewGuid().ToString();
                Session["gd"] = gd;
                // alter path for your project
                fu_account.SaveAs(Server.MapPath("~/uploadedfiles/"+gd+".xls"));
                lbl_account.Text = "Upload File Name: " +
                fu_account.PostedFile.FileName +
                "<br>" + "Type: " +
                fu_account.PostedFile.ContentType +
                " File Size: " + fu_account.PostedFile.ContentLength
                + " kb<br>";



                OleDbDataAdapter objDataAdapter = new OleDbDataAdapter();

                // retrieve the Select command for the Spreadsheet
                objDataAdapter.SelectCommand = ExcelConnection();

                // Create a DataSet
                DataSet objDataSet = new DataSet();
                // Populate the DataSet with the spreadsheet worksheet data
                objDataAdapter.Fill(objDataSet);



                GridView1.DataSource = objDataSet.Tables[0].DefaultView;
                GridView1.DataBind();
                Session["_type"] ="صورتحسابها" ;
                Cache["_dbv"] = objDataSet.Tables[0].DefaultView;


            }
            catch (System.NullReferenceException ex)
            {
                lbl_account.Text = "Error: " + ex.Message;
            }

        }
        else
        {
            //lbl_account.Text = "Please select a file to upload.";
        }


    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

        DataTable dv = ((DataView)Cache["_dbv"]).Table;

        new main_class().execute_command("insert into tbl_customer_groups (cg_name,cg_ownerid) values ('" + TextBox1.Text + "'," + Session["OwnerID"].ToString() + ") ");

        int GroupID = new tbl_customer_groupsTableAdapter().GetGroupIDFromName(TextBox1.Text, Convert.ToInt32(Session["OwnerID"].ToString())).Value;

        
        foreach (DataRow dr in dv.Rows)
        {
            //if ((GridView1.Rows[i].FindControl("Label1") as Label).Text == "موردتائید")
            {

                //int bb = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
                new tbl_customersTableAdapter().AddToCustomersWithCellNo(

                    dr[0].ToString(),
                    dr[1].ToString(),
                    dr[2].ToString(),
                    Convert.ToInt32(Session["OwnerID"].ToString()),
                    GroupID
                    
                    );
            }
            lbl_account.Text = "اطلاعات شما منتقل گردید";
        }
    }
    
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
     
    }
    protected void GridView1_DataBinding(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    
    }
    protected void Label1_Init(object sender, EventArgs e)
    {
       
    }
    protected void Label1_Load(object sender, EventArgs e)
    {
       
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
       
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}