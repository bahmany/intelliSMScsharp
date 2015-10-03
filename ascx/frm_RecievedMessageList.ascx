<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_RecievedMessageList.ascx.cs" Inherits="ascx_frm_RecievedMessageList" %>
<div style="font-family: tahoma; font-size: 12px" dir="rtl">


    <table>
        <tr>
            <td>
                پارامتر جستجو</td>
            <td style="margin-right: 40px">
                <asp:DropDownList ID="drp_search_selectfield" runat="server" Width="128px">
                    <asp:ListItem Selected="True" Value="1">ارسال کننده</asp:ListItem>
                    <asp:ListItem Value="2">پیام دریافتی</asp:ListItem>
                    <asp:ListItem Value="3">نام ارسال کننده</asp:ListItem>
                    <asp:ListItem Value="4">نام دانش آموز</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
&nbsp;&nbsp; مقدار</td>
            <td>
                <asp:TextBox ID="txt_searchValue" runat="server"></asp:TextBox>
            </td>
            <td>
&nbsp;&nbsp;
                <asp:LinkButton ID="lnk_filter" runat="server" onclick="lnk_filter_Click">جستجو</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnk_filter_remove" runat="server" 
                    onclick="lnk_filter_remove_Click" Visible="False">برداشتن فیلتر</asp:LinkButton>
            </td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td>
                تعداد اطلاعات یافت شده :
            </td>
            <td>
                <asp:Label ID="lbl_rowscount" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />


    <asp:GridView ID="gr_RecMessages" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="srf_id" 
        DataSourceID="sds_RecievedMessagesList" Width="100%" 
        ondatabound="gr_RecMessages_DataBound" onrowcreated="gr_RecMessages_RowCreated" 
        onrowdatabound="gr_RecMessages_RowDataBound" 
        ondatabinding="gr_RecMessages_DataBinding" onload="gr_RecMessages_Load" 
        onselectedindexchanged="gr_RecMessages_SelectedIndexChanged">
        <RowStyle BackColor="White" ForeColor="#330099" />
        <Columns>
            <asp:BoundField DataField="srf_date_recieved" HeaderText="تاریخ دریافت" 
                SortExpression="srf_date_recieved" />
            <asp:BoundField DataField="srf_cellno" HeaderText="ارسال کننده" 
                SortExpression="srf_cellno" />
            <asp:BoundField DataField="srf_Message" HeaderText="پیام دریافتی" 
                SortExpression="srf_Message" />
            <asp:TemplateField HeaderText="نام ارسال کننده"></asp:TemplateField>
            <asp:TemplateField HeaderText="نام دارنده حساب کاربری"></asp:TemplateField>
            <asp:TemplateField HeaderText="تاریخ آخرین مشاهده">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("LastDateOfRead") %>'></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                        ToolTip='<%# Eval("srf_id") %>'>حذف</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            <span class="style1"><b style="color: #CC3300">اطلاعاتی یافت نشد</b></span>
        </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="sds_RecievedMessagesList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" SelectCommand="SELECT srf_id, srf_owner_link, srf_smscenter_link, srf_linked_guid, srf_IndexOfSpliter, srf_ParameterCount, srf_ParameterCommand, srf_ParameterParam1, srf_ParameterParam2, srf_HasThisCommandException, srf_Message, srf_customer_id, srf_cell_id, 
dbo.func_ConvertToDateTimePersian(srf_date_recieved) as srf_date_recieved ,
srf_date_post, 
srf_cellno, (SELECT TOP (1) srfd_datepost FROM tbl_sms_recieved_formatted_details WHERE (srfd_sms_recieved_formatted_link = tbl_sms_recieved_formatted.srf_id)) AS LastDateOfRead FROM tbl_sms_recieved_formatted WHERE (srf_owner_link = @OwnerID) AND (srf_ParameterCommand = - 1) ORDER BY srf_date_recieved DESC" 
        ondatabinding="sds_RecievedMessagesList_DataBinding" 
        onselected="sds_RecievedMessagesList_Selected">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-1" Name="OwnerID" SessionField="owner" />
        </SelectParameters>
    </asp:SqlDataSource>


</div>