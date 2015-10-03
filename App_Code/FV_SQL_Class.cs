using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for FV_SQL_Class
/// </summary>
public class FV_SQL_Class
{
	public FV_SQL_Class()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string GetSQLConnection()
    {
        main_class m = new main_class();
        return m.get_connection_string();
        //return "Data Source=.;Initial Catalog=fcnet;Persist Security Info=True;User ID=sa;Password=1";
    }
    
    public DataSet SelectExe(string qry)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(qry, GetSQLConnection());
        sda.Fill(ds);
        return ds;

    }
    public int EXEQuery(string qry)
    {
        SqlConnection conn = new SqlConnection(GetSQLConnection());
        SqlCommand sc = new SqlCommand(qry);
        sc.CommandType = CommandType.Text;
        sc.Connection = conn;
        //sc.Connection.ConnectionString = GetSQLConnection();
        sc.Connection.Open();
        return sc.ExecuteNonQuery();

    }
    public DataSet SelectExe(string tableName, string fieldsName, string where, string orderBy)
    {
        string qry = "";
        qry = " SELECT ";
        
        if (tableName.Length > 0)
        {
            qry += fieldsName;
            qry += " FROM ";
        }
        else
        {
            qry += " * ";
        }
                
        if ( tableName.Length > 0)
        {
            qry += " " + tableName;
        }
        else
        {
            return null;
        }

        if ( where.Length > 0)
        {
            qry += " " + where;
        }

        if (orderBy.Length > 0)
        {
            qry += " ORDER BY " + orderBy;
        }

        return SelectExe(qry);

    }

    public void SetDropDownListItemsFromDB(DropDownList ddl , string tableName, string textField, string valueField , string where)
    {
        string qry = " SELECT ";
        qry += " " + textField;
        qry += " , " + valueField;
        qry += " FROM " + tableName;
        if ( where.Length > 0)
        {
            qry += " WHERE " + where;
        }

        ddl.DataSource = SelectExe(qry);
        ddl.DataTextField = textField;
        ddl.DataValueField = valueField;

        
        ddl.DataBind();
        
    }


    public void SetDropDownListItemsFromDB(Telerik.Web.UI.RadComboBox ddl, string tableName, string textField, string valueField, string where)
    {
        string qry = " SELECT ";
        qry += " " + textField;
        qry += " , " + valueField;
        qry += " FROM " + tableName;
        if (where.Length > 0)
        {
            qry += " WHERE " + where;
        }


        ddl.DataSource = SelectExe(qry);
        ddl.DataTextField = textField;
        ddl.DataValueField = valueField;
        
        
        ddl.DataBind();

    }
}
