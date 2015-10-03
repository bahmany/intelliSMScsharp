<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_LessonsManager.ascx.cs" Inherits="ascx_frm_LessonsManager" %>
<div style="font-family: tahoma; font-size: 12px" dir="rtl">
<script>
$('table tr td').css('vertical-align','top');
</script>
<style type="text/css">
table tr td{
vertical-align:top;
}
</style>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام درس</td>
                        <td>
                            نام دانش آموز</td>
                        <td>
                            تاریخ 1300/00/00</td>
                        <td>
                            آخرین نمره</td>
                        <td>
                            &nbsp;</td>
                        <td rowspan="2">
                            <asp:Label ID="lbl_newlessonresult_errmsg" runat="server" Font-Bold="True" 
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="sds_lessons" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" 
                                SelectCommand="SELECT l_id, l_name, l_owner_id, l_handcode, l_postDate FROM tbl_lessons where  l_owner_id=@OwnerID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="OwnerID" SessionField="owner" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="drp_lr_lesson_link" runat="server" 
                                DataSourceID="sds_lessons" DataTextField="l_name" DataValueField="l_id">
                            </asp:DropDownList>
                            <br />
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sds_studens" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" 
                                SelectCommand="SELECT CASE WHEN c_name IS NULL THEN '' ELSE c_name END + CASE WHEN c_family IS NULL THEN '' ELSE c_family END + CASE WHEN c_handcode IS NULL THEN '' ELSE ' کد دستی:' + c_handcode END + ' کدرایانه:' + CAST(c_id AS nvarchar(30)) AS name, c_id FROM tbl_customers WHERE (c_owner_link = @Owner) order by c_handcode,c_id">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Owner" SessionField="owner" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="drp_lr_customer_link" runat="server" 
                                DataSourceID="sds_studens" DataTextField="name" DataValueField="c_id">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_lr_showndate" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_lr_result" runat="server"></asp:TextBox>
                        </td>
                        <td>
&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnk_lessonPost" runat="server" 
                                onclick="lnk_lessonPost_Click">ثبت</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                            <div style="border: 1px solid #666666">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        مدیریت درس جدید</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td rowspan="3">
                                        <asp:Label ID="lbl_newlesson_errmsg" runat="server" Font-Bold="True" 
                                            ForeColor="Red"></asp:Label>
                                            </td>
                                </tr>
                                <tr>
                                    <td>
                                        نام درس جدید</td>
                                    <td>
                                        <asp:TextBox ID="txt_newlessonName" runat="server" Width="69px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp; کد دستی&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="txt_handcode" runat="server" Width="38px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:LinkButton ID="lnk_postNewLesson" runat="server" 
                                            onclick="lnk_postNewLesson_Click">ثبت</asp:LinkButton>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <div>
                                <asp:DataList ID="DataList1" runat="server" BackColor="White" 
                                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                    DataKeyField="l_id" DataSourceID="sds_lessons" ForeColor="Black" 
                                    GridLines="Vertical" RepeatColumns="6" RepeatDirection="Horizontal">
                                    <FooterStyle BackColor="#CCCC99" />
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    نام درس</td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("l_name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    کد دستی</td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("l_handcode") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                                                        ToolTip='<%# Eval("l_id") %>'>حذف</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                       <hr />
                                    </ItemTemplate>
                                    <AlternatingItemStyle BackColor="White" />
                                    <ItemStyle BackColor="#F7F7DE" />
                                    <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                </asp:DataList>
                                    </div>
                            </div>
                <asp:ObjectDataSource ID="ods_lessons_details" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
                    TypeName="MainDataModuleTableAdapters.tbl_lesson_resultsTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_lr_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="lr_lesson_link" Type="Int32" />
                        <asp:Parameter Name="lr_result" Type="Double" />
                        <asp:Parameter Name="lr_showndate" Type="DateTime" />
                        <asp:Parameter Name="lr_postdate" Type="DateTime" />
                        <asp:Parameter Name="lr_owner_id" Type="Int32" />
                        <asp:Parameter Name="lr_customer_link" Type="Int32" />
                        <asp:Parameter Name="Original_lr_id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Owner" SessionField="owner" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="lr_lesson_link" Type="Int32" />
                        <asp:Parameter Name="lr_result" Type="Double" />
                        <asp:Parameter Name="lr_showndate" Type="DateTime" />
                        <asp:Parameter Name="lr_postdate" Type="DateTime" />
                        <asp:Parameter Name="lr_owner_id" Type="Int32" />
                        <asp:Parameter Name="lr_customer_link" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <br />
                <asp:GridView ID="gr_studentresultslist" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    DataSourceID="sds_studentlist" GridLines="Vertical">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="نام دانش آموز" ReadOnly="True" 
                            SortExpression="name" />
                        <asp:BoundField DataField="lessonname" HeaderText="نام درس" ReadOnly="True" 
                            SortExpression="lessonname" />
                        <asp:BoundField DataField="lr_result" HeaderText="نتیجه" 
                            SortExpression="lr_result" />
                        <asp:BoundField DataField="showndate" HeaderText="تاریخ نمایش" ReadOnly="True" 
                            SortExpression="showndate" />
                        <asp:BoundField DataField="postdate" HeaderText="تاریخ ثبت" ReadOnly="True" 
                            SortExpression="postdate" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_delete" runat="server" onclick="lnk_delete_Click" 
                                    ToolTip='<%# Eval("lr_id") %>'>حذف</asp:LinkButton>
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
                <asp:SqlDataSource ID="sds_studentlist" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" SelectCommand="SELECT lr_lesson_link, lr_result, lr_id,
(select top 1 l_name from tbl_lessons where l_id=lr_lesson_link) as lessonname,
dbo.func_ConvertToDateTimePersian(lr_showndate) as showndate, 
dbo.func_ConvertToDateTimePersian(lr_postdate) as postdate, 
(select top 1 c_name+' '+c_family from tbl_customers where c_id= lr_customer_link ) as name
 FROM tbl_lesson_results where 

lr_owner_id = @Owner order by lr_id desc">
                    <SelectParameters>
                        <asp:SessionParameter Name="Owner" SessionField="owner" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</div>