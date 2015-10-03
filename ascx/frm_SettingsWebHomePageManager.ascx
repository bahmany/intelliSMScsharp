<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_SettingsWebHomePageManager.ascx.cs" Inherits="ascx_frm_SettingsWebHomePageManager" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<div style="font-family: tahoma; font-size: 11px" dir="rtl">
    <table>
        <tr>
            <td>
                تیتر وب سایت</td>
            <td>
                <asp:TextBox ID="txt_siteTitle" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                نمایش تاریخ</td>
            <td>
                <asp:CheckBox ID="chk_showDate" runat="server" 
                    oncheckedchanged="CheckBox1_CheckedChanged" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                لوگوی بالایی وب سایت</td>
            <td>
                <asp:TextBox ID="fu_logoImageAddress" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:FileUpload ID="fu_logo" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                عکس بالایی پنل ها</td>
            <td>
                <asp:TextBox ID="txt_panelTopImage" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:FileUpload ID="fu_panelTopImage" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                پس زمینه نوار بالا</td>
            <td>
                <asp:TextBox ID="txt_TopBarbackgroundImage" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:FileUpload ID="fu_TopBarbackgroundImage" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                عکس پس زمینه</td>
            <td>
                <asp:TextBox ID="txt_backgroundImage" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:FileUpload ID="fu_backgroundImage" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                انتخاب رنگ</td>
            <td>
                <asp:TextBox ID="txt_backgroundColor" runat="server"></asp:TextBox>
            </td>
            <td>
                <telerik:RadColorPicker ID="cp_backgroundColor" Runat="server" 
                    Preset="Standard" Skin="Default">
                </telerik:RadColorPicker>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                متن زیر نویس چرخان</td>
            <td>
                <asp:TextBox ID="txt_firstPageMarquee" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                متن معرفی کوتاه</td>
            <td>
                <asp:LinkButton ID="lnk_shortDescribtion" runat="server">ورود به متن</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                مدیریت عکس های اول </td>
            <td>
                <asp:LinkButton ID="lnk_managmentImages" runat="server">ورود به قسمت مدیریت عکس ها</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                متن تماس با ما</td>
            <td>
                <asp:LinkButton ID="lnk_ConnectToUs" runat="server">ورود به متن</asp:LinkButton>
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