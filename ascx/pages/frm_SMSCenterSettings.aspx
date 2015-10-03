<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frm_SMSCenterSettings.aspx.cs" Inherits="ascx_pages_frm_SMSCenterSettings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div dir="rtl" style="font-family: tahoma; font-size: 11px">
    
        <table>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" 
                        Text="فعال بودن سیستم پاسخگوی اتوماتیک" />
                </td>
            </tr>
            <tr>
                <td>
                    متن پیام&nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="399px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">تائید</asp:LinkButton>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
