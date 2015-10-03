<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_SendSMS.ascx.cs" Inherits="ascx_frm_SendSMS" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>




<style type="text/css">


   
</style>
 
<script>

    
</script>

<div dir="rtl" style="font-family: tahoma; font-size: 12px">




    <table width="100%">
        <tr>
            <td class="StepsTitle">
                <b>مرحله اول<br />
                </b><br />
                ورود متن پیام<br />
            </td>
            <td class="tdDetails">
                <table style="width: 100%">
                    <tr>
                        <td>
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" 
                                HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
                          
                            <asp:Panel ID="pnl_0" runat="server" Width="100%">
                                
                                
                                هر65 حرف برار است با یک پیام کوتاه
                                <hr />
                                <table>
                                    <tr>
                                        <td>
                                            <b>&lt;1. کد درس&gt;</b></td>
                                        <td class="detailsCodeSendSMS">
                                            نمایش دهنده ی آخرین نمره وارد شده</td>
                                    </tr>
                                    <tr>
                                        <td class="sendSmsCodeName">
                                            <b>&lt;2.کد درس&gt;</b></td>
                                        <td class="detailsCodeSendSMS">
                                            نمایش دهنده ی نام درس</td>
                                    </tr>
                                    <tr>
                                        <td class="sendSmsCodeName">
                                            <b>&lt;3.کد درس&gt;</b></td>
                                        <td class="detailsCodeSendSMS">
                                            نمایش دهنده ی تاریخ اعلام نمره</td>
                                    </tr>
                                    <tr>
                                        <td class="sendSmsCodeName">
                                            <b>&lt;4&gt;</b></td>
                                        <td class="detailsCodeSendSMS">
                                            نمایش دهنده ی نام دانش آموز</td>
                                    </tr>
                                    <tr>
                                        <td class="sendSmsCodeName">
                                            <b>&lt;5&gt;</b></td>
                                        <td class="detailsCodeSendSMS">
                                            نمایش دهنده ی نام صاحب خط</td>
                                    </tr>
                                    <tr>
                                        <td class="sendSmsCodeName">
                                            <b>&lt;6&gt;</b></td>
                                        <td class="detailsCodeSendSMS">
                                            نمایش دهنده ی تاریخ جاری</td>
                                    </tr>
                                    <tr>
                                        <td class="sendSmsCodeName">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <div>
                                
                                    <table bgcolor="#E6E6D9">
                                        <tr>
                                            <td>
                                                پیام های از پیش ذخیره شده :</td>
                                            <td style="margin-right: 80px">
                                                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
                                                    DataSourceID="do_drafts" DataTextField="sd_text" DataValueField="sd_text" 
                                                    Height="98px" onselectedindexchanged="ListBox1_SelectedIndexChanged" 
                                                    Width="179px"></asp:ListBox>
                                                <asp:ObjectDataSource ID="do_drafts" runat="server" DeleteMethod="Delete" 
                                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                                    SelectMethod="GetDataBy" 
                                                    TypeName="MainDataModuleTableAdapters.tbl_sms_draftsTableAdapter" 
                                                    UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_sd_id" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="sd_text" Type="String" />
                                                        <asp:Parameter Name="sd_ownerID" Type="Int32" />
                                                        <asp:Parameter Name="Original_sd_id" Type="Int32" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="sd_ownerID" SessionField="owner" Type="Int32" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="sd_text" Type="String" />
                                                        <asp:Parameter Name="sd_ownerID" Type="Int32" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                            <td style="margin-right: 80px">
                                                <asp:Button ID="Button1" runat="server" Height="20px" onclick="Button1_Click" 
                                                    Text="+" Width="28px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Panel ID="pnl_AddDraft" runat="server" BackColor="#FFDEBF" Visible="False">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                متن پیام</td>
                                                            <td>
                                                                <asp:TextBox ID="TextBox1" runat="server" Width="278px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="ثبت" 
                                                                    Width="56px" />
                                                                &nbsp;
                                                                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="انصراف" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                
                                </div>
                                <asp:TextBox ID="txt_text" runat="server" Height="114px" TextMode="MultiLine" 
                                    Width="394px" onKeyPress="return taLimit(this)" 
                                    onKeyUp="return taCount(this,'myCounter')" >با سلام
نمره دانش آموز &lt;4&gt; در درس &lt;2.10&gt; &lt;1.10&gt; می باشد
</asp:TextBox>
                                <br />
                                
                                <asp:LinkButton ID="lnk_previewEnteredMessage" runat="server" 
                                    onclick="lnk_previewEnteredMessage_Click">مرور پیام وارد شده</asp:LinkButton>
                                &nbsp;(پیام تولید شده زیر به هیچ منبعی وصل نیست و فقط با دروس و نمرات و تاریخ های غیر 
                                واقع پیام شما را بصورت پیش نمایش نشان میدهد)<div style="padding: 8px; border: 1px solid #000099; background-color: #FFFFCC">
                                
                                    <asp:Label ID="lbl_preview_message" runat="server" Font-Bold="True"></asp:Label>
                                
                                </div>
                                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
                                    height="75px" width="75px">
                                    لطفا صبر کنید ...<br />
                                    <img alt="Loading..." 
                                        src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' 
                                        style="border:0px;" />
                                </telerik:RadAjaxLoadingPanel>
                                <br />
                            </asp:Panel>
  </telerik:RadAjaxPanel>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="StepsTitle" >
                <b>مرحله دوم<br />
                </b><br />
                مشخص کردن<br />
                دریافت کنندگان<br />
                پیام کوتاه</td>
            <td class="tdDetails">
                <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" 
                    LoadingPanelID="RadAjaxLoadingPanel2">
              
            
                <table>
                    <tr>
                        <td class="style2">
                            <asp:CheckBox ID="chk_SendToRegisteredCells" runat="server" 
                                Text="ارسال به موبایل های ثبت شده" />
                        </td>
                        <td rowspan="3" 
                            style="border-left-style: solid; border-right-style: inherit; border-width: 1px; border-color: #999999">
                            &nbsp;</td>
                        <td class="style3">
                            <asp:CheckBox ID="chk_SendToUnRegisteredCells" runat="server" 
                                Text="ارسال به ناشناسان از طریق شماره ساز" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="padding: 6px; border: 1px solid #666666;">
                            <table style="padding: 6px; background-color: #D3CCB4">
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk_filter_group" runat="server" 
                                            Text="فیلتر بر اساس گروه ها" />
                                        <asp:ObjectDataSource ID="ods_GroupSelectot" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy1" 
                                            TypeName="MainDataModuleTableAdapters.tbl_customer_groupsTableAdapter" 
                                            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_cg_id" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="cg_name" Type="String" />
                                                <asp:Parameter Name="cg_exp" Type="String" />
                                                <asp:Parameter Name="cg_groups_type_id_link" Type="Int32" />
                                                <asp:Parameter Name="cg_ownerid" Type="Int32" />
                                                <asp:Parameter Name="Original_cg_id" Type="Int32" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="-1" Name="OwnerID" SessionField="owner" 
                                                    Type="Int32" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="cg_name" Type="String" />
                                                <asp:Parameter Name="cg_exp" Type="String" />
                                                <asp:Parameter Name="cg_groups_type_id_link" Type="Int32" />
                                                <asp:Parameter Name="cg_ownerid" Type="Int32" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                      </td>
                                    <td>
                                   
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" >
                                       
                                       <div style="height: 150px; overflow: scroll">
                                        <asp:CheckBoxList ID="chkl_group_list" runat="server" 
                                            DataSourceID="ods_GroupSelectot" DataTextField="cg_name" 
                                               DataValueField="cg_id" Font-Names="Tahoma" Font-Size="12px">
                                        </asp:CheckBoxList>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="style3" style="padding: 6px; border: 1px solid #666666;">
                            <table>
                                <tr>
                                    <td>
                                        قسمت ثابت شماره</td>
                                    <td>
                                        <asp:TextBox ID="txt_static_cell_no_part" runat="server" Width="84px">912</asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        تعداد شماره ها</td>
                                    <td>
                                        <asp:TextBox ID="txt_count" runat="server" Width="84px">500</asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:LinkButton ID="lnk_createRandomNums" runat="server" 
                                            onclick="LinkButton1_Click1">ساخت شماره ها</asp:LinkButton>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:ListBox ID="lst_CellNos" runat="server" Height="115px" Width="207px">
                                        </asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                </table>
                    
                 </telerik:RadAjaxPanel> <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" Height="75px"
                        Width="75px">
                        لطفا صبر کنید ...<br />
                        <img alt="Loading..." 
                            src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' 
                            style="border:0px;" />
                    </telerik:RadAjaxLoadingPanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="StepsTitle">
                <b>مرحله سوم       
                <br />
                <br />
                </b>مشخص کردن<br />
                زمان ارسال</td>
            <td class="tdDetails">
                            <table>
                                <tr>
                                    <td>
                                        تاریخ ارسال</td>
                                    <td>
                                        <asp:TextBox ID="txt_datesend_date" runat="server" Width="82px"></asp:TextBox>
                                    </td>
                                    <td>
                                        ساعت ارسال</td>
                                    <td>
                                        <asp:TextBox ID="txt_datesend_time" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            جهت جلوگیری از ارسال آنی پیام های ارسالی بوسیله کاربران ساعت ارسال یک ساعت جلو 
                            تر تنظیم شده است لذا در صورت نیاز به ارسالی فوری پیام ها ساعت بالا را اصلاح نمایید</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="StepsTitle">
                <b>مرحله چهارم<br />
                <br />
&nbsp;</b>ویرایش و تائید نهایی لیست برای ارسال</td>
            <td class="tdDetails">
                <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" 
                    HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel3" >
               
            <br />
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click2">تائید</asp:LinkButton>
            
            <br />
                <table>
                    <tr>
                        <td>
                            <b>اصلاح پیام کوتاه ارسالی&nbsp;&nbsp;&nbsp; </b>
                        </td>
                        <td>
                            موبایل</td>
                        <td>
                            <asp:TextBox ID="txt_NewMsgID" runat="server" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            متن پیام</td>
                        <td>
                            <asp:TextBox ID="txt_NewMsgBody" runat="server" Width="239px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click2">تائید</asp:LinkButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <b>حذف پیام کوتاه ارسالی&nbsp;&nbsp;&nbsp; </b>
                        </td>
                        <td>
                            موبایل</td>
                        <td>
                            <asp:TextBox ID="txt_DelMsgID" runat="server" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click1">تائید</asp:LinkButton>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            ارسال پیام کوتاه تست آنی</td>
                        <td>
                            موبایل</td>
                        <td>
                            <asp:TextBox ID="txt_TestCellNo" runat="server" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            متن پیام</td>
                        <td>
                            <asp:TextBox ID="txt_TestMsgBody0" runat="server" Width="239px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click1">ارسال</asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />    
                    <div style="background-color: #A55129; color: #FFFFFF; font-family: tahoma; font-size: 12px; font-weight: bold; height: 400px; overflow: scroll;">
                <asp:GridView ID="gr_preview" runat="server" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    CellSpacing="2" RowHeaderColumn="2" AllowPaging="True" AllowSorting="True" 
                            PageSize="30">
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                </div>
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel3" runat="server" Height="75px"
                        Width="75px">
                        لطفا صبر کنید ...<br />
                        <img alt="Loading..." 
                            src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' 
                            style="border:0px;" />
                    </telerik:RadAjaxLoadingPanel>
                 </telerik:RadAjaxPanel>
            
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="StepsTitle" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="StepsTitle">
                <b>مرحله پنجم<br />
                </b><br />
                تعیین و محاسبه تعداد پیام ها و محاسبات مالی</td>
            <td class="tdDetails">
                <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel4">
               
            <asp:Label ID="err1" runat="server"></asp:Label>
                <table>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnk_count" runat="server" onclick="LinkButton6_Click">محاسبه</asp:LinkButton>
                            &nbsp;&nbsp;
                            
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            تعداد نفرات<br />
                            دریافت کننده&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            تعداد
                            <br />
                            پیام های ارسالی&nbsp;&nbsp;&nbsp; </td>
                        <td class="style5">
                            هزینه ارسال
                            <br />
                            ریال&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            میزان اعتبار<br />
                            باقی مانده&nbsp;&nbsp;&nbsp; </td>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <asp:Label ID="lbl_recievers_count" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbl_sent_count" runat="server"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Label ID="lbl_sent_cost" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbl_customer_current_credit" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel4" runat="server" Height="75px"
                        Width="75px">
                        لطفا صبر کنید ...<br />
                        <img alt="Loading..." 
                            src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' 
                            style="border:0px;" />
                    </telerik:RadAjaxLoadingPanel>
                    <asp:Panel ID="pnl_OkSend" runat="server" Visible="False">
                    سیستم همکنون آماده ارسال پیام های شما می باشد جهت ارسال پیام هایتان بروی دکمه 
                    زیر کلیک کنید<br />
                    <asp:LinkButton ID="lnk_SendAll" runat="server" onclick="lnk_SendAll_Click">ارسال پیام ها</asp:LinkButton>
                        &nbsp;<asp:Label ID="err" runat="server"></asp:Label>&nbsp;</asp:Panel>
                <asp:Panel ID="pnl_NotEnoughCredit" runat="server" Visible="False">
                    اعتبار شما کمتر از میزان ارسال انتخابی می باشد لطفا تعداد فیلتر ها را بیشتر کرده 
                    تا تعداد دریافت کنندگان پیام هایتان محدودتر شود یا اقدام به
                    <asp:LinkButton ID="lnk_charge" runat="server" onclick="lnk_charge_Click">شارژ</asp:LinkButton>
                    &nbsp;نمایید</asp:Panel>
                
                 </telerik:RadAjaxPanel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="StepsTitle">
                &nbsp;</td>
            <td class="tdDetails">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>


</div>