using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text.RegularExpressions;
using FarsiLibrary.Utils;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;


public partial class ascx_frm_SendSMS : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
        {
            txt_datesend_time.Text = DateTime.Now.AddHours(1).ToString("HH:mm");
            PersianDate pd = new PersianDate(DateTime.Now);
            string y = "";
            string m = "";
            string d = "";
            y = pd.Year.ToString();
            m = pd.Month.ToString();
            d = pd.Day.ToString();
            if (m.Length == 1) { m = "0" + m; }
            if (d.Length == 1) { d = "0" + d; }

            txt_datesend_date.Text = y + "/" + m + "/" + d;
        }
    }
    public ArrayList GenerateStringSMS(string str)
    {
        string _str="";
        bool strOpen = false;
        ArrayList al = new ArrayList();
        for (int i = 0; i < str.Length; i++)
        {
            if (str[i] == '>' && strOpen)
            {
                strOpen = false;
                al.Add(_str);
                _str = "";
            }
            if (strOpen)
            {
                _str = _str + str[i];
            }
            
            if (str[i] == '<')
            {
                strOpen = true;
            }
        }

        return al;

    }
    public string GenerateFinalSMSStringTest(string str)
    {
        ArrayList al = GenerateStringSMS(str);
        ArrayList ps = new ArrayList();
        for (int i = 0; i < al.Count; i++)
        {
            string param = (string)al[i];
            al[i] = (string)al[i];
            ps.Add(al[i].ToString().Split('.'));
        }
        for (int i = 0; i < ps.Count; i++)
        {
            string[] strps = (string[])ps[i];
            if (strps.Length == 2)
            {
                string partOne = strps[0];
                string partTwo = strps[1];
                switch (partOne)
                {
                    case "1":
                        str = Regex.Replace(str, string.Format("<{0}.{1}>", partOne, partTwo), "12.25");
                        break;
                    case "2":
                        str = Regex.Replace(str, string.Format("<{0}.{1}>", partOne, partTwo), "ریاضی");
                        break;
                    case "3":
                        str = Regex.Replace(str, string.Format("<{0}.{1}>", partOne, partTwo), "1390/01/01");
                        break;
                }
            }
            if (strps.Length == 1)
            {
                string partOne = strps[0];
                switch (partOne)
                {
                    case "4":
                        str = Regex.Replace(str, string.Format("<{0}>", partOne), "محمدمحمدی");
                        break;
                    case "5":
                        str = Regex.Replace(str, string.Format("<{0}>", partOne), "علی محمدی");
                        break;
                    case "6":
                        str = Regex.Replace(str, string.Format("<{0}>", partOne), "1390/01/01");
                        break;
                }
            }
        }

        return str;


    }
    public string GenerateFinalSMSString(string str,string cellNo)
    {
        ArrayList al = GenerateStringSMS(str);
        ArrayList ps = new ArrayList();
        int owner = Convert.ToInt32(Session["owner"].ToString());
        for (int i = 0; i < al.Count; i++)
        {
            string param = (string)al[i];
            al[i] = (string)al[i];
            ps.Add(al[i].ToString().Split('.'));
        }
        for (int i = 0; i < ps.Count; i++)
        {
            string[] strps = (string[])ps[i];
            if (strps.Length == 2)
            {
                string partOne = strps[0];
                string partTwo = strps[1];
                string __result = "";
                switch (partOne)
                {
                    case "1":
                        
                        try
                        {
                            __result = new MainDataModuleTableAdapters.tbl_lesson_resultsTableAdapter().GetCustomerLastResult(Convert.ToInt32(partTwo), owner, cellNo).ToString();
                        }
                        catch
                        {
                            __result = "#";
                        }
                        if (__result == null) { __result = "#"; }
                        str = Regex.Replace(str, string.Format("<{0}.{1}>", partOne, partTwo), __result);
                        break;
                    case "2":
                        
                        try
                        {
                            __result = new MainDataModuleTableAdapters.tbl_lessonsTableAdapter().GetLessonNameFromLessonHandID(Convert.ToInt32(partTwo),owner).ToString();
                        }
                        catch
                        {
                            __result = "##";
                        }
                        if (__result == null) { __result = "##"; }
                        str = Regex.Replace(str, string.Format("<{0}.{1}>", partOne, partTwo),__result);
                        break;
                    case "3":
                        try
                        {
                            __result =  new MainDataModuleTableAdapters.tbl_lesson_resultsTableAdapter().GetCustomerLastResultDate(Convert.ToInt32(partTwo),owner, cellNo).ToString();
                        }
                        catch
                        {
                            __result = "###";
                        }
                        if (__result == null) { __result = "###"; }
                        str = Regex.Replace(str, string.Format("<{0}.{1}>", partOne, partTwo),__result);
                        break;
                }
            }
            if (strps.Length == 1)
            {
                string partOne = strps[0];
                switch (partOne)
                {
                    case "4":
                        str = Regex.Replace(str, string.Format("<{0}>", partOne),(string)
                            new MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter().GetCustomerNameFromCellNO(cellNo));
                        break;
                    case "5":
                        str = Regex.Replace(str, string.Format("<{0}>", partOne),
                            new MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter().GetCellOwnerNameFromCellPhone(cellNo)); ;
                        break;
                    case "6":
                        str = Regex.Replace(str, string.Format("<{0}>", partOne), new main_class().Convert_to_Shamsi(DateTime.Now));
                        break;
                }
            }
        }

        return str;


    }
    public string GenerateWhereClause()
    {
        string str = "";





        if (chk_filter_group.Checked)
        {
            bool isSelected = false;
            string selected_chks = "";
            for (int i = 0; i < chkl_group_list.Items.Count; i++)
            {
                if (chkl_group_list.Items[i].Selected)
                {
                    if (selected_chks == "")
                    {
                        selected_chks = chkl_group_list.Items[i].Value;
                    }
                    else
                    {
                        selected_chks =selected_chks +","+ chkl_group_list.Items[i].Value;
                    }
                    
                }
            }
            if (selected_chks != "")
            {
                str = " c_group_link in (" + selected_chks + " )";
            }
            


        }
/*
        if (chk_filter_responsibilty.Checked)
        {
            if (str != "")
            {
                str = str + " and ";
            }
            str = str +" c_responsibily_link = " + drp_responsibility.SelectedValue;
        }*/
        if (str != "")
        {
            str = str + " and ";
        }
        str = str + "c_owner_link = " + Session["owner"].ToString() ;
        if (str != "")
        {
            str = "  where cc_customer_link in (select c_id from tbl_customers where " + str + " )  ";
        }        
        return str;
    }
    public void GenerateCellNo()
    {
        lst_CellNos.Items.Clear();
        ArrayList al =
        new main_class().GenerateCellNoList(10, txt_static_cell_no_part.Text, Convert.ToInt32(txt_count.Text));
        for (int i = 0; i < al.Count; i++)
        {
            lst_CellNos.Items.Add(al[i].ToString());
        }
        Session["chkSentRnd"] = lst_CellNos;

    }
    protected void lnk_previewEnteredMessage_Click(object sender, EventArgs e)
    {
        lbl_preview_message.Text = GenerateFinalSMSStringTest(txt_text.Text);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        GenerateCellNo();
    }
    protected void LinkButton1_Click2(object sender, EventArgs e)
    {


        


        // creating time of sending .........................
        DateTime sendtime;// = Convert.ToDateTime(txt_DateSend.Text+ " " + txt_timesend.Text);
        PersianDate pr = new PersianDate(txt_datesend_date.Text);
        string ddtt = FarsiLibrary.Utils.PersianDateConverter.ToGregorianDateTime(pr).ToShortDateString();
        sendtime = Convert.ToDateTime(ddtt + " " + txt_datesend_time.Text);
        //...................................................
        //Generating SendList DataTable
        string sql = " select * from tbl_customer_cells  " + GenerateWhereClause() + " ";
        SqlConnection scn = new SqlConnection(new main_class().get_connection_string());
        scn.Open();
        SqlCommand sc = new SqlCommand(sql, scn);
        SqlDataReader sdr = sc.ExecuteReader();
        DataTable dtb = new DataTable();
        dtb.Columns.Add("cellCode", typeof(string));
        dtb.Columns.Add("body", typeof(string));
        while (sdr.Read())
        {
            DataRow dr = dtb.NewRow();
            dr[0] = sdr["cc_cellno"].ToString();
            dr[1] = GenerateFinalSMSString(txt_text.Text,sdr["cc_cellno"].ToString());
            dtb.Rows.Add(dr);
        }
        sdr.Close();
        //---------- Filled  :))); with DBData
        //.....................................................
        DataRow drw;
        MainDataModule.DataTable_BeforeSendDataTable dt_finalTable = new MainDataModule.DataTable_BeforeSendDataTable();
        // DataTable dtb is for those who are member
        if (chk_SendToRegisteredCells.Checked)
        {
            string CellNo = "";
            foreach (DataRow dr in dtb.Rows)
            {
               CellNo = dr[0].ToString();

                drw = dt_finalTable.NewRow();
                drw["دانش آموز"] = new MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter().GetCustomerNameFromCellNO(CellNo);

                drw["صاحب خط"] = new MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter().GetCellOwnerNameFromCellPhone(CellNo);
                drw["متن"] = dr[1];
                drw["موبایل"] = dr[0].ToString();
                drw["تاریخ میلادی"] = sendtime;
                drw["تاریخ شمسی"] = txt_datesend_date.Text + " " + txt_datesend_time.Text;
                drw["تعداد کاراکتر"] = dr[1].ToString().Length;
                dt_finalTable.Rows.Add(drw);
            }
        }
        //...................................................
        //compeleting DataAchievedSMS Now We must work on SMS Random Message

        if (chk_SendToUnRegisteredCells.Checked)
        {

            ListBox lb = (ListBox) Session["chkSentRnd"];
            for (int x = 0; x < lb.Items.Count; x++)
            {
                drw = dt_finalTable.NewRow();
                string PhoneNo = lb.Items[x].Value;
                drw["دانش آموز"] = "";
                drw["صاحب خط"] = "";
                drw["متن"] = txt_text.Text;
                drw["موبایل"] = PhoneNo;
                drw["تاریخ میلادی"] = sendtime;
                drw["تاریخ شمسی"] = txt_datesend_date.Text + " " + txt_datesend_time.Text;
                drw["تعداد کاراکتر"] = txt_text.Text.Length;
                dt_finalTable.Rows.Add(drw);
            }
        }

        Cache["SentTBL"] = dt_finalTable;
        gr_preview.DataSource = (DataTable)Cache["SentTBL"];
        gr_preview.DataBind(); 

    }
    protected void LinkButton3_Click2(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Cache["SentTBL"];

        foreach (DataRow dr in dt.Rows)
        {
            if (dr["موبایل"].ToString() == txt_NewMsgID.Text)
            {
                dr["متن"] = txt_NewMsgBody.Text;

                dt.AcceptChanges();
            }

        }
        Cache["SentTBL"] = dt;
        gr_preview.DataSource = (DataTable)Cache["SentTBL"];
        gr_preview.DataBind();
    }
    protected void LinkButton4_Click1(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Cache["SentTBL"];
        int i = 0;
        foreach (DataRow dr in dt.Rows)
        {

            if (dr["موبایل"].ToString() == txt_DelMsgID.Text)
            {
                break;
            }
            i++;
        }
        dt.Rows[i].Delete();
        dt.AcceptChanges();

        Cache["SentTBL"] = dt;
        gr_preview.DataSource = (DataTable)Cache["SentTBL"];
        gr_preview.DataBind();
    }
    protected void LinkButton5_Click1(object sender, EventArgs e)
    {
        if (new main_class().execute_command(
        string.Format("insert into tbl_sms_send (s_date_of_send,s_body,s_cell_no,s_sms_center_id) values (GetDate(),'"
        + txt_TestMsgBody0.Text + "','"
        + txt_TestCellNo.Text + "'," +
         (new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetSmSCenterID(
         Convert.ToInt32(Session["owner"].ToString())).Value) + ");")) != 0)
        {
            Label3.Text = "ارسال گردید";
        }
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Cache["SentTBL"];
        if (dt.Rows.Count != 0)
        {
            ArrayList al = new ArrayList();
            int msgCount = Convert.ToInt16(new main_class().get_value_from_setting("messagecount"));
            main_class mc = new main_class();
            foreach (DataRow dr in dt.Rows)
            {
                al.Add(mc.GetAMessageCount(dr["متن"].ToString()));
            }




            int recieversCount = 0;
            int sentCount = 0;
            int TotalCount = 0;
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
                sentCount = 0;
                recieversCount = recieversCount + 1;
                sentCount = mp.howManyMessage;
                if (mp.isFarsi) { sentCost = sentCost + ((FarsiCost)*sentCount); }
                else { sentCost += ((EnglishCost) * sentCount); }
                TotalCount += sentCount;
            }

            currentCredit = (double)new MainDataModuleTableAdapters.tbl_sms_billingTableAdapter().GetLastCredit(Convert.ToInt32(Session["owner"].ToString()));



            lbl_recievers_count.Text = recieversCount.ToString();
            lbl_sent_count.Text = TotalCount.ToString();
            lbl_sent_cost.Text = sentCost.ToString();
            lbl_customer_current_credit.Text = (currentCredit-sentCost).ToString();


            if (sentCost > currentCredit)
            {
                pnl_NotEnoughCredit.Visible = true;
                pnl_OkSend.Visible = false;
                lbl_customer_current_credit.ForeColor = Color.Red;
            }
            else
            {
                pnl_NotEnoughCredit.Visible = false;
                pnl_OkSend.Visible = true;
                lbl_customer_current_credit.ForeColor = Color.Green;
            }
        }
        else
        {
            err1.Text = "هیچ پیامی برای ارسال وجود ندارد لطفا لیست انتخابی مراحل قبل را چک کنید";
        }
    }
    protected void lnk_SendAll_Click(object sender, EventArgs e)
    {
        try
        {

            DataTable dt = (DataTable)Cache["SentTBL"];
            if (dt.Rows.Count != 0)
            {

            string SendTextTitle = txt_datesend_date.Text + " " + txt_datesend_time.Text + " " + "ثبت شده در تاریخ " + new main_class().Convert_to_Shamsi(DateTime.Now);
            new MainDataModuleTableAdapters.tbl_sms_send_groupsTableAdapter().InsertQuery(
                SendTextTitle,
                0,
                Convert.ToInt32(Session["owner"].ToString()),
                (int)new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetSmSCenterID(Convert.ToInt32(Session["owner"].ToString())),
                DateTime.Now,
                Convert.ToDateTime(new main_class().Convert_to_Midaly
                (txt_datesend_date.Text) + " " + txt_datesend_time.Text));

            int GroupID = (int)new MainDataModuleTableAdapters.tbl_sms_send_groupsTableAdapter().GetGroupIDByName(SendTextTitle, Convert.ToInt32(Session["owner"].ToString()));
            MainDataModuleTableAdapters.tbl_sms_sendTableAdapter ssta = new MainDataModuleTableAdapters.tbl_sms_sendTableAdapter();
            string sql = "";
            int CellCenterID = (int)new MainDataModuleTableAdapters.tbl_ownerTableAdapter().GetSmSCenterID(Convert.ToInt32(Session["owner"].ToString()));

            foreach (DataRow dr in dt.Rows)
            {
                sql = sql + string.Format(" INSERT INTO tbl_sms_send (s_date_of_send, s_cell_link, s_body, s_group_link, s_position, s_cell_no, s_sms_center_id, s_date_post) VALUES  " +
                    " ('{0}',{1},'{2}',{3},{4},'{5}',{6},GetDate()) ",
                    new main_class().Convert_to_Midaly(txt_datesend_date.Text) + " " + txt_datesend_time.Text,
                -1, dr["متن"].ToString(), GroupID, 0, dr["موبایل"].ToString(), CellCenterID
                );
            }
            new main_class().execute_command(sql);
            Cache.Remove("SentTBL");
            Response.Redirect("links.aspx?page_id=12");
            } else
            {
                err.Text = "شما نمی توانید لیست خالی ارسال کنید لطفا لیست دانش آموزان را ایجاد نمایید";
                Cache.Remove("SentTBL");
            }
        }
        catch (Exception _e)
        {
            err.Text = _e.Message;
        }

    }
    protected void lnk_charge_Click(object sender, EventArgs e)
    {
        Response.Redirect("links.aspx?page_id=15");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        pnl_AddDraft.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            new MainDataModuleTableAdapters.tbl_sms_draftsTableAdapter().Insert(TextBox1.Text, Convert.ToInt32(Session["owner"].ToString()));
            pnl_AddDraft.Visible = false;
            ListBox1.DataBind();
        } else
        {
            TextBox1.Text = "لطفا داخل این کادر متن مورد نظرا را وارد نمایید";
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        pnl_AddDraft.Visible = false;
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_text.Text = ListBox1.Text;
    }
}
