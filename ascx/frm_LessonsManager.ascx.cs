using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FarsiLibrary.Utils;
using FarsiLibrary.Resources;


public partial class ascx_frm_LessonsManager : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnk_lessonPost_Click(object sender, EventArgs e)
    {
        try
        {

            PersianDate pd = new PersianDate(txt_lr_showndate.Text);

            string str = FarsiLibrary.Utils.PersianDateConverter.ToGregorianDate(pd);

            new MainDataModuleTableAdapters.tbl_lesson_resultsTableAdapter().Insert(
                Convert.ToInt32(drp_lr_lesson_link.SelectedValue),
                Convert.ToDouble(txt_lr_result.Text),
                Convert.ToDateTime(str),
                DateTime.Now,
                Convert.ToInt32(Session["owner"].ToString()),
                Convert.ToInt32(drp_lr_customer_link.SelectedValue)
                );
            gr_studentresultslist.DataBind();
            lbl_newlessonresult_errmsg.Text = "";
        }
        catch (Exception _e)
        {
            lbl_newlessonresult_errmsg.Text = "اطلاعات ثبت نشد" + _e.Message;
        }

    }
    protected void lnk_delete_Click(object sender, EventArgs e)
    {
        new MainDataModuleTableAdapters.tbl_lesson_resultsTableAdapter().Delete(Convert.ToInt32((sender as LinkButton).ToolTip));
        gr_studentresultslist.DataBind();
    }
    protected void lnk_postNewLesson_Click(object sender, EventArgs e)
    {
            try
            {        if (new MainDataModuleTableAdapters.tbl_lessonsTableAdapter().IsLessonAvailable(txt_newlessonName.Text, Convert.ToInt32(txt_handcode.Text), Convert.ToInt32(Session["owner"].ToString())) == 0)
        {

                new MainDataModuleTableAdapters.tbl_lessonsTableAdapter().Insert(txt_newlessonName.Text, Convert.ToInt32(Session["owner"].ToString()), Convert.ToInt32(txt_handcode.Text), DateTime.Now);
                DataList1.DataBind();
                lbl_newlesson_errmsg.Text = "";
           
         
        }
        else
        {
            lbl_newlesson_errmsg.Text = "این درس قبلا وارد شده است";

        }   }
        catch(Exception _e)
            {
                lbl_newlesson_errmsg.Text = "اطلاعات ثبت نشد" + _e.Message;
            }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        new MainDataModuleTableAdapters.tbl_lessonsTableAdapter().Delete(Convert.ToInt32((sender as LinkButton).ToolTip));
        DataList1.DataBind();
    }
}
