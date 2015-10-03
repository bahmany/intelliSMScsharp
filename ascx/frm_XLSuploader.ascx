<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_XLSuploader.ascx.cs" Inherits="ascx_frm_XLSuploader" %>



<div style="text-align: right">

    <img alt="" src="./images/excel.JPG" 
        style="width: 391px; height: 235px; /></div>
<div dir="rtl"  style="font-family: tahoma; font-size: 12px"><br />
    فایل اکسل مورد نظر می بایست از سه ستون تشکیل شده باشد<br />
    نام، نام خانوادگی و شماره موبایلی که ابتدای آن صفر نداشته باشد<br />
    توجه داشته باشید حتما فایل مورد نظر را با اکسل فرمت 2003 ذخیره نمایید<br />
    پس از انتقال با زدن دکمه انتقل به بانک اطلاعاتی مراحل را کامل نمایید<br />
    <br />
&nbsp;<table>
        <tr>
            <td>
                لیست دانش آموزان</td>
            <td>
                <asp:FileUpload ID="fu_account" runat="server" />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">انتقال</asp:LinkButton>
            </td>
            <td>
                <asp:Label ID="lbl_account" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                نام گروه</td>
            <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                        <asp:LinkButton ID="LinkButton3" runat="server" 
                    onclick="LinkButton3_Click">انتقال به بانک اطلاعاتی</asp:LinkButton>
                    &nbsp;&nbsp;
                    </td>
            <td>
                &nbsp;</td>
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    EnableModelValidation="True" ondatabinding="GridView1_DataBinding" 
                    onrowcreated="GridView1_RowCreated" 
                    onrowdatabound="GridView1_RowDataBound" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                            
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Position="Top" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</div>