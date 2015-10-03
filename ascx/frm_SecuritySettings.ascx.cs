using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ascx_frm_sec_settings : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
//        new main_class().execute_command("insert into tbl_settings (st_name,st_value) values ('"++"','"++"')");
            SqlConnection sqlc = new SqlConnection(new main_class().get_connection_string());
            SqlCommand sqlcm = new SqlCommand(string.Format("select * from tbl_settings where (st_id = {0})", (sender as LinkButton).ToolTip.ToString()), sqlc);
            sqlc.Open();
            SqlDataReader sqldr = sqlcm.ExecuteReader();
            if (sqldr.HasRows)
            {
                while (sqldr.Read())
                {
                    TextBox1.Text = sqldr["st_name"].ToString();
                    TextBox2.Text = new main_class().Decode(sqldr["st_value"].ToString()); ;
                    Session["modeeee"] = "edit";
                    Panel1.Visible = true;
                }

            }
        
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["modeeee"].ToString() == "edit")
        {
            new main_class().execute_command("update tbl_settings st_name = '" + TextBox1.Text + "',st_value='" + new main_class().Encode(TextBox2.Text) + "' where st_id = "+(sender as LinkButton).ToolTip.ToString());
            Session["modeeee"] = "";
            Panel1.Visible = false;
            GridView1.DataBind();

        }
        if (Session["modeeee"].ToString() == "insert")
        {
            new main_class().execute_command("insert into tbl_settings (st_name ,st_value) values ('" + TextBox1.Text + "','" + new main_class().Encode(TextBox2.Text) + "')");
            Session["modeeee"] = "";
            Panel1.Visible = false;
            GridView1.DataBind();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["modeeee"] = "insert";
        Panel1.Visible = true;
    }
}
