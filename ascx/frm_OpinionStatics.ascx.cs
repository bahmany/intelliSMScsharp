using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ascx_frm_OpinionStatics : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DateTime dts = Convert.ToDateTime(new main_class().Convert_to_Midaly(TextBox1.Text) + " " + TextBox2.Text);
        DateTime dte = Convert.ToDateTime(new main_class().Convert_to_Midaly(TextBox3.Text) + " " + TextBox4.Text);

        ObjectDataSource1.SelectParameters["StartDate"].DefaultValue = 
            string.Format("{0}/{1}/{2} {3}:{4}:{5}", 
            dts.Year.ToString(),
            dts.Month.ToString(),
            dts.Day.ToString(),
            dts.Hour.ToString(),
            dts.Minute.ToString(),
            dts.Second.ToString());
        ObjectDataSource1.SelectParameters["EndDate"].DefaultValue = 
        string.Format("{0}/{1}/{2} {3}:{4}:{5}",
        dte.Year.ToString(),
        dte.Month.ToString(),
        dte.Day.ToString(),
        dte.Hour.ToString(),
        dte.Minute.ToString(),
        dte.Second.ToString());

        RadChart1.DataBind();

        
    }
}
