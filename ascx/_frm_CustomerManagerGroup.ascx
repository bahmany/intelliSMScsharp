<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_CustomerManagerGroup.ascx.cs" Inherits="ascx_frm_CustomerManagerGroup" %>
<div dir="rtl" style="padding: 10px; font-family: tahoma; font-size: 11px">

    <table>
        <tr>
            <td>
                نام گروه جدید</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                توضیحات</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server">ثبت</asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="cg_id" 
        DataSourceID="ods_GroupManager" GridLines="Vertical">
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="cg_name" HeaderText="نام گروه" 
                SortExpression="cg_name" />
            <asp:BoundField DataField="cg_exp" HeaderText="توضیحات" 
                SortExpression="cg_exp" />
            <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" 
                InsertText="جدید" NewText="جدید" SelectText="انتخاب" ShowDeleteButton="True" 
                ShowEditButton="True" UpdateText="بروز رسانی" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ods_GroupManager" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="MainDataModuleTableAdapters.tbl_customer_groupsTableAdapter" 
        UpdateMethod="Update">
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
            <asp:SessionParameter DefaultValue="-1" Name="OwnerID" SessionField="OwnerID" 
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="cg_name" Type="String" />
            <asp:Parameter Name="cg_exp" Type="String" />
            <asp:Parameter Name="cg_groups_type_id_link" Type="Int32" />
            <asp:Parameter Name="cg_ownerid" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>

</div>