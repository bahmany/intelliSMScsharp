<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_SendSMSList.ascx.cs" Inherits="ascx_frm_SendSMSList" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div dir="rtl">
    <script language="JavaScript">

        var newwindow;
        function poptop(url) {
            var w = 370;
            var h = 405;
            var left = (screen.width / 2) - (w / 2);
            var top = (screen.height / 2) - (h / 2);
            newwindow = window.open(url, 'name', 'height=' + h + ',width=' + w + ', top=' + top + ', left=' + left);
            if (window.focus) {
                newwindow.focus()
            }
        }

        function poptop22(num) {

            poptop('ascx/frm_SendSMSListGroupDetails.aspx?groupid=' + num);
        }
    </script>

    <asp:Panel ID="pnl_smsGroupList" runat="server">
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Height="75px"
                Width="75px">
                <img alt="Loading..." src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>'
                    style="border: 0px;" />
            </telerik:RadAjaxLoadingPanel>
        <asp:GridView ID="gr_group_list" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="sg_id" DataSourceID="sds_groupList" PageSize="25" 
            Width="100%" onrowcommand="gr_group_list_RowCommand" 
            onrowcreated="gr_group_list_RowCreated" 
            onrowdatabound="gr_group_list_RowDataBound">
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:BoundField DataField="sg_name" HeaderText="نام گروه" 
                    SortExpression="sg_name" />
                <asp:BoundField DataField="datepost" HeaderText="تاریخ ثبت" ReadOnly="True" 
                    SortExpression="datepost" />
                <asp:BoundField DataField="datesend" HeaderText="ارسال" ReadOnly="True" 
                    SortExpression="datesend" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                    
                 
                       
                        <table>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel2" runat="server">
                                    
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("position") %>'></asp:Label>
                                </asp:Panel></td>
                                <td>
                                    &nbsp; &nbsp;
                                    <a href='javascript:poptop22(<%# Eval("sg_id","{0}")%>)' >دریافت کننده ها</a>
                                    </td>
                                <td>
                                    &nbsp;
                                    <asp:LinkButton ID="lbl_changeSendTime" runat="server" 
                                        onclick="lbl_changeSendTime_Click" CommandName="AppearPostDate">تغییر زمان ارسال</asp:LinkButton>
                                    &nbsp;    </td>
                                <td>
                                    <asp:Panel ID="pnl_ChangeDate" runat="server" Visible="False" 
                                        BackColor="#DEDFBF">
                                  
         <div id="ChangeTime" style="text-align: center; visibility: visible;">
                                    <asp:TextBox ID="txt_date" runat="server" Font-Size="11px" Height="17px" 
                                        Width="99px"></asp:TextBox>
                                    <asp:TextBox ID="txt_time" runat="server" Font-Size="11px" Height="17px" 
                                        Width="66px"></asp:TextBox>
                                    &nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton4" runat="server"  CommandName="PostDate" 
                                        ToolTip='<%# Eval("sg_id") %>'>ثبت</asp:LinkButton>
                                    &nbsp;&nbsp;<asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">انصراف</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                    </div>
                                     </asp:Panel> 
                                    </td>
                                <td>
                                    &nbsp;
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DelGroup" 
                                        onclick="LinkButton3_Click">حذف</asp:LinkButton>
                                    &nbsp;</td>
                                <td>
                                    <asp:Panel ID="pnl_ِDeleteGroup" runat="server" Visible="False" 
                                        BackColor="#DEDFBF">
                                        <div ID="ChangeTime0" style="text-align: center; visibility: visible;">
                                            آیا مطمئن هستید این ارسال را می خواهید حذف کیند ؟&nbsp;&nbsp;
                                            <asp:LinkButton ID="LinkButton6" runat="server" onclick="LinkButton6_Click" 
                                                ToolTip='<%# Eval("sg_id") %>'>بلی</asp:LinkButton>
                                            &nbsp;&nbsp;<asp:LinkButton ID="LinkButton7" runat="server" onclick="LinkButton5_Click">انصراف</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                 
                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="sds_groupList" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" SelectCommand="SELECT 
 *,

dbo.func_ConvertToDateTimePersian(sg_datepost) as datepost, 
dbo.func_ConvertToDateTimePersian(sg_datesend) as datesend, 
'position'=
case sg_position
when 0 then 'ارسال نشده'
when 1 then 'ارسال شده'
when 2 then 'رسیده شده'
end
 FROM tbl_sms_send_groups where 
sg_owner_id=@OwnerID and sg_position<>4 order by sg_id desc">
            <SelectParameters>
                <asp:SessionParameter Name="OwnerID" SessionField="owner" />
            </SelectParameters>
        </asp:SqlDataSource>
       </telerik:RadAjaxPanel>
    </asp:Panel>
    <br />
    <asp:Panel ID="pnl_SMSOneList" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </asp:Panel>
</div>