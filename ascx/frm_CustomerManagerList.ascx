<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_CustomerManagerList.ascx.cs" Inherits="ascx_frm_CustomerManagerList" %>
<div dir="rtl" style="font-family: tahoma; font-size: 11px">

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="c_id" 
        DataSourceID="ods_customerList" GridLines="Vertical">
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="c_id" HeaderText="c_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="c_id" />
            <asp:BoundField DataField="c_owner_link" HeaderText="c_owner_link" 
                SortExpression="c_owner_link" />
            <asp:BoundField DataField="c_group_link" HeaderText="c_group_link" 
                SortExpression="c_group_link" />
            <asp:BoundField DataField="c_name" HeaderText="c_name" 
                SortExpression="c_name" />
            <asp:BoundField DataField="c_family" HeaderText="c_family" 
                SortExpression="c_family" />
            <asp:BoundField DataField="c_sex" HeaderText="c_sex" SortExpression="c_sex" />
            <asp:BoundField DataField="c_melli_code" HeaderText="c_melli_code" 
                SortExpression="c_melli_code" />
            <asp:BoundField DataField="c_shsh" HeaderText="c_shsh" 
                SortExpression="c_shsh" />
            <asp:BoundField DataField="c_phonelineno" HeaderText="c_phonelineno" 
                SortExpression="c_phonelineno" />
            <asp:BoundField DataField="c_address" HeaderText="c_address" 
                SortExpression="c_address" />
            <asp:BoundField DataField="c_phoneline_necessary" 
                HeaderText="c_phoneline_necessary" SortExpression="c_phoneline_necessary" />
            <asp:BoundField DataField="c_address_necessary" 
                HeaderText="c_address_necessary" SortExpression="c_address_necessary" />
            <asp:BoundField DataField="c_responsibily_link" 
                HeaderText="c_responsibily_link" SortExpression="c_responsibily_link" />
            <asp:BoundField DataField="c_handcode" HeaderText="c_handcode" 
                SortExpression="c_handcode" />
            <asp:CheckBoxField DataField="c_active" HeaderText="c_active" 
                SortExpression="c_active" />
            <asp:BoundField DataField="c_birth_date" HeaderText="c_birth_date" 
                SortExpression="c_birth_date" />
            <asp:BoundField DataField="c_postal_code" HeaderText="c_postal_code" 
                SortExpression="c_postal_code" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ods_customerList" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="MainDataModuleTableAdapters.tbl_customersTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="c_owner_link" SessionField="OwnerID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</div>