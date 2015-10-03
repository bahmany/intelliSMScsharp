<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_SentMessageCounterTotal.ascx.cs" Inherits="ascx_frm_SentMessageCounterTotal" %>
  
<div dir="rtl">

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="o_id" 
        DataSourceID="ObjectDataSource1" GridLines="Vertical">
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="o_id" HeaderText="o_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="o_id" />
            <asp:BoundField DataField="o_name" HeaderText="o_name" 
                SortExpression="o_name" />
            <asp:BoundField DataField="o_exp" HeaderText="o_exp" SortExpression="o_exp" />
            <asp:BoundField DataField="o_sms_center_link" HeaderText="o_sms_center_link" 
                SortExpression="o_sms_center_link" />
            <asp:BoundField DataField="o_postdate" HeaderText="o_postdate" 
                SortExpression="o_postdate" />
            <asp:BoundField DataField="o_sh_postdate" HeaderText="o_sh_postdate" 
                ReadOnly="True" SortExpression="o_sh_postdate" />
            <asp:BoundField DataField="SMSNo" HeaderText="SMSNo" ReadOnly="True" 
                SortExpression="SMSNo" />
            <asp:BoundField DataField="SendCount" HeaderText="SendCount" ReadOnly="True" 
                SortExpression="SendCount" />
            <asp:BoundField DataField="RecCount" HeaderText="RecCount" ReadOnly="True" 
                SortExpression="RecCount" />
            <asp:BoundField DataField="lastSent" HeaderText="lastSent" ReadOnly="True" 
                SortExpression="lastSent" />
            <asp:BoundField DataField="bill" HeaderText="bill" ReadOnly="True" 
                SortExpression="bill" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="MainDataModuleTableAdapters.tbl_owner1TableAdapter">
    </asp:ObjectDataSource>

</div>