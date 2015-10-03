<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_BillingManager.ascx.cs" Inherits="ascx_frm_BillingManager" %>
<div dir="rtl" style="font-family: tahoma; font-size: 11px">

    <table>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ods_OwnerList" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_ownerTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_o_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="o_name" Type="String" />
                        <asp:Parameter Name="o_exp" Type="String" />
                        <asp:Parameter Name="o_sms_center_link" Type="Int32" />
                        <asp:Parameter Name="o_postdate" Type="DateTime" />
                        <asp:Parameter Name="Original_o_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="o_name" Type="String" />
                        <asp:Parameter Name="o_exp" Type="String" />
                        <asp:Parameter Name="o_sms_center_link" Type="Int32" />
                        <asp:Parameter Name="o_postdate" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:DropDownList ID="drp_selectOwner" runat="server" 
                    DataSourceID="ods_OwnerList" DataTextField="o_name" DataValueField="o_id">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="میزان اضافه کرد اعتبار"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_CreditAdded" runat="server"></asp:TextBox>
                ریال</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                توضیحات</td>
            <td>
                <asp:TextBox ID="txt_Exp" runat="server" Width="213px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
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
                <asp:LinkButton ID="lnk_CreditOK" runat="server" onclick="lnk_CreditOK_Click">تائید</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" 
                    InsertCommand="INSERT INTO tbl_sms_billing_addcredit(sba_creditadded, sba_ownerlink, sba_exp) VALUES (@sba_creditadded, @sba_ownerlink, @sba_exp)" 
                    SelectCommand="SELECT tbl_owner.o_id, tbl_owner.o_name, tbl_owner.o_exp, tbl_owner.o_sms_center_link, tbl_owner.o_postdate, tbl_sms_billing.sb_currentCredit, tbl_sms_centers.s_name, tbl_sms_centers.s_id, tbl_sms_centers.s_smsCenterNo FROM tbl_owner INNER JOIN tbl_sms_billing ON tbl_owner.o_id = tbl_sms_billing.sb_ownerLink INNER JOIN tbl_sms_centers ON tbl_owner.o_sms_center_link = tbl_sms_centers.s_id AND tbl_sms_billing.sb_smscenterLink = tbl_sms_centers.s_id">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txt_CreditAdded" Name="sba_creditadded" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="drp_selectOwner" Name="sba_ownerlink" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txt_Exp" Name="sba_exp" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="o_id" HeaderText="کد صاحب" InsertVisible="False" 
                ReadOnly="True" SortExpression="o_id" />
            <asp:BoundField DataField="o_name" HeaderText="نام" SortExpression="o_name" />
            <asp:BoundField DataField="o_exp" HeaderText="توضیحات" SortExpression="o_exp" />
            <asp:BoundField DataField="o_sms_center_link" HeaderText="کد مرکز" 
                SortExpression="o_sms_center_link" />
            <asp:BoundField DataField="sb_currentCredit" HeaderText="اعتبار جاری" 
                SortExpression="sb_currentCredit" />
            <asp:BoundField DataField="s_smsCenterNo" HeaderText="شماره مرکز" 
                SortExpression="s_smsCenterNo" />
        </Columns>
    </asp:GridView>

</div>