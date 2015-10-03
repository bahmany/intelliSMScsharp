<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pnl_Login.ascx.cs" Inherits="ascx_pnl_Login" %>
<br />
<style type="text/css">
    .style1
    {
    }
    .style2
    {
        width: 222px;
    }
    .style3
    {
        width: 8px;
    }
    .style4
    {
        text-align: center;
        font-weight: bold;
        font-size: medium;
    }
</style>
<center dir="rtl">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btn_submit">
 

<div style="" >

<table style="padding: 9px; background-position: center top; width: 303px; background-image: url('images/logoLogin.png'); background-repeat: no-repeat; height: 384px;">
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4" colspan="3">
            ورود به سیستم تیکال</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label1" runat="server" 
                Text="نام کاربری"></asp:Label>
        </td>
        <td class="style2">
            <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td class="style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label2" runat="server" 
                Text="رمز عبور"></asp:Label>
        </td>
        <td class="style2">
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
        </td>
        <td class="style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td class="style2">
            <asp:Label ID="Label3" runat="server" ForeColor="#CC0000" 
                Text="عدم ورود !" Visible="False"></asp:Label>
        </td>
        <td class="style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td class="style2">
            <asp:Button ID="btn_submit" runat="server" onclick="btn_submit_Click" 
                Text="ورود به سیستم" />
        </td>
        <td class="style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:HyperLink ID="HyperLink1" runat="server" 
                Text="فراموشی رمز عبود" NavigateUrl="../links.aspx?page_id=3" 
                Visible="False"></asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:HyperLink ID="HyperLink2" runat="server" 
                Text="جهت ثبت نام این قسمت را کلیک کنید" 
                NavigateUrl="../links.aspx?page_id=1" Visible="False"></asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;</td>
    </tr>
</table>
</div>
   </asp:Panel>
</center>
<br />
<br />