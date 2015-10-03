<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frm_SendSMSListGroupDetails.aspx.cs" Inherits="ascx_frm_SendSMSListGroupDetails" EnableViewStateMac="false" EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-family: tahoma; font-size: 12px" dir="rtl">
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="s_id" 
            DataSourceID="ods_sendDetails" Width="100%">
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:BoundField DataField="DateSend" HeaderText="ارسال" ReadOnly="True" 
                    SortExpression="DateSend" />
                <asp:BoundField DataField="s_body" HeaderText="متن" SortExpression="s_body" />
                <asp:BoundField DataField="position" HeaderText="وضعیت" ReadOnly="True" 
                    SortExpression="position" />
                <asp:BoundField DataField="s_cell_no" HeaderText="دریافت کننده" 
                    SortExpression="s_cell_no" />
                <asp:TemplateField></asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ods_sendDetails" runat="server" DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy2" 
            TypeName="MainDataModuleTableAdapters.tbl_sms_sendTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_s_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="s_cell_link" Type="Int32" />
                <asp:Parameter Name="s_body" Type="String" />
                <asp:Parameter Name="s_group_link" Type="Int32" />
                <asp:Parameter Name="s_cell_no" Type="String" />
                <asp:Parameter Name="Original_s_id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="-1" Name="GroupID" 
                    QueryStringField="groupid" Type="Int32" />
                <asp:SessionParameter Name="OwnerID" SessionField="owner" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
