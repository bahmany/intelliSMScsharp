<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_OpinionGetter.ascx.cs" Inherits="ascx_frm_OpinionGetter" %>
<div style="font-family: tahoma; font-size: 12px" dir="rtl">


    * توجه داشته باشید در هر لحظه فقط می توانید یک نظر سنجی فعال شده باشید<br />
<hr />

                                        <asp:Label ID="lbl_errmsg" runat="server" Font-Bold="True" 
                                            ForeColor="Red"></asp:Label>

    <br />
    <table>
        <tr>
            <td>
                نام نظرسنجی</td>
            <td>
                <asp:TextBox ID="txt_opinionname" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                ارسال پیام دریافت</td>
            <td>
                <asp:CheckBox ID="chk_responseSms" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                تاریخ شروع</td>
            <td>
                1300/00/00
                <br />
                <asp:TextBox ID="txt_opinionstartdate" runat="server"></asp:TextBox>
            </td>
            <td>
                07:05<br />
                <asp:TextBox ID="txt_opinionstarttime" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                تاریخ پایان</td>
            <td>
                1300/00/00
                <br />
                <asp:TextBox ID="txt_opinionenddate" runat="server"></asp:TextBox>
            </td>
            <td>
                23:59<br />
                <asp:TextBox ID="txt_opinionendtime" runat="server" Height="22px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:LinkButton ID="lnk_post" runat="server" onclick="LinkButton1_Click">ثبت</asp:LinkButton>
                <asp:SqlDataSource ID="sds_opinion" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" 
                    SelectCommand="SELECT sm_answer_dynamic_msg AS [متن پیام], dbo.func_ConvertToDateTimePersian(sm_active_startdate) AS شروع, dbo.func_ConvertToDateTimePersian(sm_active_enddate) AS پایان, sm_name AS نام, sm_id FROM tbl_sms_mapper WHERE (sm_smscenterid_link = (SELECT TOP (1) o_sms_center_link FROM tbl_owner WHERE (o_id = @OwnerID)))">
                    <SelectParameters>
                        <asp:SessionParameter Name="OwnerID" SessionField="owner" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <asp:GridView ID="gr_OpinionGrid" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="sds_opinion" GridLines="Vertical">
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="نام" HeaderText="نام" SortExpression="نام" />
            <asp:BoundField DataField="شروع" HeaderText="شروع" ReadOnly="True" 
                SortExpression="شروع" />
            <asp:BoundField DataField="پایان" HeaderText="پایان" ReadOnly="True" 
                SortExpression="پایان" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click1" 
                        ToolTip='<%# Eval("sm_id") %>'>ویرایش</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
<br />
</div>
