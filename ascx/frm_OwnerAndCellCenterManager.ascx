<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_OwnerAndCellCenterManager.ascx.cs" Inherits="ascx_frm_OwnerManager" %>


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

        function poptop11(num) {

            poptop('ascx/pages/frm_SMSCenterSettings.aspx');
        }
    </script>


<div style="font-family: tahoma; font-size: 12px" dir="rtl">

<div>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام خریدار</td>
                        <td>
                            <asp:TextBox ID="txt_s_name" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            شماره مرکز پیام کوتاه</td>
                        <td>
                            <asp:TextBox ID="txt_s_smsCenterNo" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            کاراکتر جدا کننده دستورات</td>
                        <td>
                            <asp:TextBox ID="txt_s_seperator_char" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            کاراکتر فاصله انداز دستورات</td>
                        <td>
                            <asp:TextBox ID="txt_s_space_char" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            نام کاربر مرکز</td>
                        <td>
                            <asp:TextBox ID="txt_s_username" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            رمز عبور مرکز</td>
                        <td>
                            <asp:TextBox ID="txt_s_password" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:LinkButton ID="lnk_smscenter_post" runat="server" 
                                onclick="lnk_smscenter_post_Click">ثبت</asp:LinkButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gr_SMSCenter" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="s_id" 
                    DataSourceID="ods_SMSCenter" GridLines="Vertical">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="s_id" HeaderText="کد" InsertVisible="False" 
                            ReadOnly="True" SortExpression="s_id" />
                        <asp:BoundField DataField="s_name" HeaderText="نام خریدار" 
                            SortExpression="s_name" />
                        <asp:BoundField DataField="s_smsCenterNo" HeaderText="شماره مرکز پیام کوتاه" 
                            SortExpression="s_smsCenterNo" />
                        <asp:BoundField DataField="s_seperator_char" 
                            HeaderText="کاراکتر جدا کننده دستورات" SortExpression="s_seperator_char" />
                        <asp:BoundField DataField="s_space_char" 
                            HeaderText="کاراکتر فاصله انداز دستورات" SortExpression="s_space_char" />
                        <asp:BoundField DataField="s_username" HeaderText="نام کاربری مرکز" 
                            SortExpression="s_username" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                                    ToolTip='<%# Eval("s_id") %>'>ورود به تنظیمات</asp:LinkButton>
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
                <asp:ObjectDataSource ID="ods_SMSCenter" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.tbl_sms_centersTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_s_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="s_name" Type="String" />
                        <asp:Parameter Name="s_smsCenterNo" Type="String" />
                        <asp:Parameter Name="s_seperator_char" Type="String" />
                        <asp:Parameter Name="s_space_char" Type="String" />
                        <asp:Parameter Name="s_username" Type="String" />
                        <asp:Parameter Name="s_password" Type="String" />
                        <asp:Parameter Name="Original_s_id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="s_name" Type="String" />
                        <asp:Parameter Name="s_smsCenterNo" Type="String" />
                        <asp:Parameter Name="s_seperator_char" Type="String" />
                        <asp:Parameter Name="s_space_char" Type="String" />
                        <asp:Parameter Name="s_username" Type="String" />
                        <asp:Parameter Name="s_password" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</div>

<hr />
<p></p>
<br />
<div>

    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام صاحب</td>
                                <td>
                                    <asp:TextBox ID="txt_o_name" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    توضیحات</td>
                                <td>
                                    <asp:TextBox ID="txt_o_exp" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    مرکز پیام کوتاه</td>
                                <td>
                                    <asp:DropDownList ID="drp_o_sms_center_link" runat="server" 
                                        DataSourceID="ods_SMSCenter" DataTextField="s_smsCenterNo" 
                                        DataValueField="s_id">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:LinkButton ID="lnk_postowner" runat="server" onclick="lnk_postowner_Click">ثبت</asp:LinkButton>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="gr_owner" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="o_id" 
                            DataSourceID="ods_owner" GridLines="Vertical">
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <Columns>
                                <asp:BoundField DataField="o_id" HeaderText="کد" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="o_id" />
                                <asp:BoundField DataField="o_name" HeaderText="نام صاحب" 
                                    SortExpression="o_name" />
                                <asp:BoundField DataField="o_exp" HeaderText="توضیحات" SortExpression="o_exp" />
                                <asp:BoundField DataField="o_sms_center_link" HeaderText="کد مرکز پیام" 
                                    SortExpression="o_sms_center_link" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ods_owner" runat="server" DeleteMethod="Delete" 
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
                </tr>
            </table>

</div>

</div>