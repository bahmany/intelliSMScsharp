<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_Settings.ascx.cs" Inherits="ascx_frm_Settings" %>
<div dir="rtl" style="font-family: tahoma; font-size: 11px">

    <table width="100%">
        <tr>
            <td style="padding: 4px; width: 150px; vertical-align: top; background-color: #FFFFFF;">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="sm_id" 
                    DataSourceID="ods_settingsMenu">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("sm_link", "{0}") %>' Text='<%# Eval("sm_name") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ods_settingsMenu" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
                    TypeName="MainDataModuleTableAdapters.tbl_settings_menuTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_sm_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="sm_name" Type="String" />
                        <asp:Parameter Name="sm_weight" Type="Int32" />
                        <asp:Parameter Name="sm_link" Type="String" />
                        <asp:Parameter Name="Original_sm_id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="99" Name="Weight" SessionField="userWeight" 
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="sm_name" Type="String" />
                        <asp:Parameter Name="sm_weight" Type="Int32" />
                        <asp:Parameter Name="sm_link" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td style="vertical-align: top">
                <asp:PlaceHolder ID="ph_settings" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </table>

</div>