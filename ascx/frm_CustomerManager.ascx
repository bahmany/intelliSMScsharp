<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_CustomerManager.ascx.cs" Inherits="ascx_frm_CustomerManager" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<script type="text/javascript" src="js/jquery-latest.pack.js"></script>




<div style="font-family: tahoma; font-size: 12px" dir="rtl">


<style>

#mask {
  position:absolute;
  left:0;
  top:0;
  z-index:9000;
  background-color:#000;
  display:none;
}
  #DsCus {
  
}
  
#boxes .window {
  position:absolute;
  left:0;
  top:0;
  width:440px;
  height:200px;
  display:none;
  z-index:9999;
  padding:20px;
  overflow:scroll;
}

#boxes #dialog {
  width:375px; 
  height:450px;
  padding:10px;
  background-color:#ffffff;
}

#boxes #dialog1 {
  width:375px; 
  height:203px;
}

#dialog1 .d-header {
  background:url(images/login-header.png) no-repeat 0 0 transparent; 
  width:375px; 
  height:150px;
}

#dialog1 .d-header input {
  position:relative;
  top:60px;
  left:100px;
  border:3px solid #cccccc;
  height:22px;
  width:200px;
  font-size:15px;
  padding:5px;
  margin-top:4px;
}

#dialog1 .d-blank {
  float:left;
  background:url(images/login-blank.png) no-repeat 0 0 transparent; 
  width:267px; 
  height:53px;
}

#dialog1 .d-login {
  float:left;
  width:108px; 
  height:53px;
}

#boxes #dialog2 {
  background:url(images/notice.png) no-repeat 0 0 transparent; 
  width:326px; 
  height:229px;
  padding:50px 0 20px 25px;
}
    </style>

    <br />

<div>
    <br />
    </div>
<div id="boxes">

<div>

      <div id="div_AddNewCustomer">
                <table width="100%">
                    <tr>
                        <td style="border-style: none none none solid; border-width: 1px; border-color: #333333; vertical-align:top;" 
                            width="200px">
                <table>
                    <tr>
                        <td>
                            نام</td>
                        <td>
                            <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            نام خانوادگی</td>
                        <td>
                            <asp:TextBox ID="txt_family" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            جنسیت</td>
                        <td>
                            <asp:DropDownList ID="drp_jensiat" runat="server">
                                <asp:ListItem Selected="True" Value="-1">-</asp:ListItem>
                                <asp:ListItem Value="0">مرد</asp:ListItem>
                                <asp:ListItem Value="1">زن</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            تاریخ تولد</td>
                        <td>
                            <asp:TextBox ID="txt_datebirth" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            کد ملی</td>
                        <td>
                            <asp:TextBox ID="txt_MilliCode" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            شماره ش</td>
                        <td>
                            <asp:TextBox ID="txt_shsh" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            کد پستی</td>
                        <td>
                            <asp:TextBox ID="txt_postalcode" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            تلفن ثابت</td>
                        <td>
                            <asp:TextBox ID="txt_tel" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            آدرس</td>
                        <td>
                            <asp:TextBox ID="txt_addr" runat="server" Height="22px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            تلفن ضروری</td>
                        <td>
                            <asp:TextBox ID="txt_telzarori" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            آدرس ضروری</td>
                        <td>
                            <asp:TextBox ID="txt_addrzarori" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            کد دستی</td>
                        <td>
                            <asp:TextBox ID="txt_handcode" runat="server"></asp:TextBox>
&nbsp;</td>
                        <td>
                            <asp:HyperLink ID="HyperLink3" runat="server">?</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            گروه</td>
                        <td>
                            <asp:DropDownList ID="drp_group" runat="server" 
                                DataSourceID="ods_customer_group" DataTextField="cg_name" 
                                DataValueField="cg_id">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ods_customer_group" runat="server" 
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
                                    <asp:SessionParameter DefaultValue="" Name="OwnerID" SessionField="owner" 
                                        Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_add_newGroup" Name="cg_name" 
                                        PropertyName="Text" Type="String" />
                                    <asp:Parameter Name="cg_name" Type="String" />
                                    <asp:Parameter Name="cg_groups_type_id_link" Type="Int32" DefaultValue="0" />
                                    <asp:Parameter Name="cg_ownerid" Type="Int32" DefaultValue="9999" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink5" runat="server">?</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div>
                            
                            </div>
                            
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <br />
                            &nbsp;
                            <asp:LinkButton ID="lnk_post" runat="server" onclick="lnk_post_Click" >ثبت</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnk_delete" runat="server" onclick="lnk_delete_Click1">حذف</asp:LinkButton>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                            </td>
                            <td style="padding: 12px">
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" SelectCommand="SELECT c_id AS کدرایانه, c_name AS نام, c_family AS [نام خانوادگی], c_melli_code AS [کد ملی], (SELECT TOP (1) cg_name FROM tbl_customer_groups WHERE (cg_id = tbl_customers.c_group_link)) AS [نام گروه] ,
(SELECT count(*) FROM tbl_customer_groups WHERE (cg_id = tbl_customers.c_group_link)) AS [تعدادگروه] ,
(SELECT top 1 cc_cellno FROM tbl_customer_cells WHERE (cc_customer_link = tbl_customers.c_id)) AS [موبایل] 


FROM tbl_customers  where (c_owner_link = @c_owner_link) order by c_id" onselected="SqlDataSource2_Selected">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="c_owner_link" SessionField="OwnerID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <asp:Panel ID="Panel1" runat="server">
                                                             <div style="background-color: #CCCCFF">
                                
                                    &nbsp;&nbsp; تعداد گیرندگان ثبت شده :                                     <asp:Label ID="lbl_customer_count" runat="server" Font-Bold="True" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <table>
                                        <tr>
                                            <td>
                                                جستجو&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList1" runat="server">
                                                    <asp:ListItem>نام خانوادگی</asp:ListItem>
                                                    <asp:ListItem>کد ملی</asp:ListItem>
                                                    <asp:ListItem>نام گروه</asp:ListItem>
                                                    <asp:ListItem>موبایل</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click2">تائید</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                
                                </div>
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                    DataKeyNames="کدرایانه" DataSourceID="SqlDataSource2" GridLines="Vertical" 
                                    PageSize="20" Width="100%" ondatabound="GridView1_DataBound" 
                                    onrowdatabound="GridView1_RowDataBound">
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                                    ToolTip='<%# Eval("کدرایانه", "c.{0}") %>' />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="CheckBox2" runat="server" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="کدرایانه" HeaderText="کدرایانه" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="کدرایانه" />
                                        <asp:BoundField DataField="نام" HeaderText="نام" SortExpression="نام" />
                                        <asp:BoundField DataField="نام خانوادگی" HeaderText="نام خانوادگی" 
                                            SortExpression="نام خانوادگی" />
                                        <asp:BoundField DataField="کد ملی" HeaderText="کد ملی" 
                                            SortExpression="کد ملی" />
                                        <asp:BoundField DataField="نام گروه" HeaderText="نام گروه" ReadOnly="True" 
                                            SortExpression="نام گروه" />
                                        <asp:BoundField DataField="تعدادگروه" HeaderText="تعدادگروه" ReadOnly="True" 
                                            SortExpression="تعدادگروه" />
                                        <asp:BoundField DataField="موبایل" HeaderText="موبایل" ReadOnly="True" 
                                            SortExpression="موبایل" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                &nbsp;
                                                <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click2" 
                                                    ToolTip='<%# Eval("کدرایانه") %>'>ویرایش</asp:LinkButton>
                                                &nbsp;
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" 
                                        VerticalAlign="Top" />
                                    <EmptyDataTemplate>
                                        هیچ اطلاعاتی وارد نشده است
                                    </EmptyDataTemplate>
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                </asp:GridView>   </asp:Panel>

                                <asp:Panel ID="pnl_cellNo" runat="server">
                                <div style="background-color: #99CCFF">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click1" 
                                        style="font-weight: 700">برگشت </asp:LinkButton>
                                        </div>
                                    <br />
                                    لطفا شماره موبایل ها را بدون صفر ابتدایی وارد نمایید مثلا شماره 091215248398 را 
                                    9125248398 وارد نمایید<table>
                                        <tr>
                                            <td>
                                                نام</td>
                                            <td>
                                                شماره موبایل</td>
                                            <td>
                                                میزان
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl2" runat="server" Text='<%# Eval("c_id") %>' Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txt_cellname" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="margin-right: 80px">
                                                <asp:TextBox ID="txt_cellno" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_cellpermission" runat="server" 
                                                    DataSourceID="SqlDataSource1" DataTextField="ccpt_name" 
                                                    DataValueField="ccpt_id">
                                                    <asp:ListItem>فقط ارسال</asp:ListItem>
                                                    <asp:ListItem>فقط دریافت</asp:ListItem>
                                                    <asp:ListItem Selected="True">هر دو</asp:ListItem>
                                                    <asp:ListItem>-</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnk_cellpost" runat="server" CommandArgument="postcell" 
                                                    onclick="LinkButton1_Click">ثبت</asp:LinkButton>
                                                <asp:ObjectDataSource ID="ods_cell" runat="server" DeleteMethod="Delete" 
                                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                                    SelectMethod="GetDataBy11" 
                                                    TypeName="MainDataModuleTableAdapters.tbl_customer_cellsTableAdapter" 
                                                    UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:ControlParameter ControlID="lbl2" Name="Original_cc_id" 
                                                            PropertyName="Text" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="cc_name" Type="String" />
                                                        <asp:Parameter Name="cc_cellno" Type="String" />
                                                        <asp:Parameter Name="cc_type" Type="Int32" />
                                                        <asp:Parameter Name="cc_permission_link" Type="Int32" />
                                                        <asp:Parameter Name="cc_customer_link" Type="Int32" />
                                                        <asp:Parameter Name="Original_cc_id" Type="Int32" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="-1" Name="cc_customer_link" 
                                                            SessionField="code" Type="Int32" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="cc_name" Type="String" />
                                                        <asp:Parameter Name="cc_cellno" Type="String" />
                                                        <asp:Parameter Name="cc_type" Type="Int32" />
                                                        <asp:Parameter Name="cc_permission_link" Type="Int32" />
                                                        <asp:Parameter Name="cc_customer_link" Type="Int32" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:GridView ID="gr_cells" runat="server" AutoGenerateColumns="False" 
                                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                                    CellPadding="3" DataSourceID="ods_cell" GridLines="Vertical" PageSize="20">
                                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                    <Columns>
                                                        <asp:BoundField DataField="cc_name" HeaderText="نام" SortExpression="cc_name" />
                                                        <asp:BoundField DataField="cc_cellno" HeaderText="موبایل" />
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="drp_cellpermission0" runat="server" AutoPostBack="True" 
                                                                    DataSourceID="SqlDataSource1" DataTextField="ccpt_name" 
                                                                    DataValueField="ccpt_id" 
                                                                    onselectedindexchanged="drp_cellpermission_SelectedIndexChanged" 
                                                                    SelectedValue='<%# Bind("cc_type") %>' ToolTip='<%# Eval("cc_id") %>'>
                                                                    <asp:ListItem>فقط ارسال</asp:ListItem>
                                                                    <asp:ListItem>فقط دریافت</asp:ListItem>
                                                                    <asp:ListItem>هر دو</asp:ListItem>
                                                                    <asp:ListItem>-</asp:ListItem>
                                                                </asp:DropDownList>
                                                                &nbsp;&nbsp;
                                                                <asp:LinkButton ID="lnk_delete0" runat="server" onclick="LinkButton2_Click1" 
                                                                    ToolTip='<%# Eval("cc_id") %>'>حذف</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <EmptyDataTemplate>
                                                        <span class="style3"><b>هیچ شماره همراهی برای این شخص وارد نشده </b></span>
                                                    </EmptyDataTemplate>
                                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </div>


</div>

<!-- Mask to cover the whole screen -->
  <div id="mask"></div>
</div>

       <div style="padding: 10px">
       <br />
       <div style="display: table-cell">
       </div>
       <br />
       
       </div>


</div>
<asp:ObjectDataSource ID="ods_customer" runat="server" 
    InsertMethod="InsertQuery" OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetData" 
    TypeName="MainDataModuleTableAdapters.tbl_customersTableAdapter" 
    UpdateMethod="UpdateQuery">
    <UpdateParameters>
        <asp:ControlParameter ControlID="drp_group" Name="c_group_link" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="txt_name" Name="c_name" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="txt_family" Name="c_family" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="drp_jensiat" Name="c_sex" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="txt_datebirth" Name="c_birth_date" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_postalcode" Name="c_postal_code" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_MilliCode" Name="c_melli_code" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_shsh" Name="c_shsh" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="txt_tel" Name="c_phonelineno" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_addr" Name="c_address" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="txt_telzarori" Name="c_phoneline_necessary" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_addrzarori" Name="c_address_necessary" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="drp_responsibily" Name="c_responsibily_link" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="txt_handcode" Name="c_handcode" 
            PropertyName="Text" Type="String" />
        <asp:SessionParameter DefaultValue="" Name="c_owner_link" SessionField="owner" 
            Type="Int32" />
        <asp:SessionParameter DefaultValue="-1" Name="CustomerID" SessionField="code" 
            Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="-1" Name="c_owner_link" 
            SessionField="owner" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="" Name="c_owner_link" SessionField="owner" 
            Type="Int32" />
        <asp:ControlParameter ControlID="drp_group" DefaultValue="" Name="c_group_link" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="txt_name" Name="c_name" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="txt_family" Name="c_family" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="drp_jensiat" Name="c_sex" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="txt_datebirth" Name="c_birth_date" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_postalcode" Name="c_postal_code" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_MilliCode" Name="c_melli_code" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_shsh" Name="c_shsh" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="txt_tel" Name="c_phonelineno" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_addr" Name="c_address" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="txt_telzarori" Name="c_phoneline_necessary" 
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txt_addrzarori" Name="c_address_necessary" 
            PropertyName="Text" Type="String" />
        <asp:Parameter DefaultValue="" Name="c_responsibily_link" Type="Int32" />
        <asp:ControlParameter ControlID="txt_handcode" Name="c_handcode" 
            PropertyName="Text" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>


    

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" 
    SelectCommand="SELECT [ccpt_id], [ccpt_name] FROM [tbl_customer_cellphones_type]">
</asp:SqlDataSource>


    

<br />


    

<br />



<br />
<br />
<br />


    

<asp:Literal ID="lt_jqexecuter" runat="server"></asp:Literal>



    

