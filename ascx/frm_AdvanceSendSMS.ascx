<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_AdvanceSendSMS.ascx.cs" Inherits="ascx_frm_AdvanceSendSMS" %>

    <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
        <link href="js/demo_page.css" rel="stylesheet" type="text/css" />
    <link href="js/demo_table_jui.css" rel="stylesheet" type="text/css" />
    <link href="js/demo_table.css" rel="stylesheet" type="text/css" />
<div dir="rtl" style="font-family: tahoma; font-size: 11px">
<div id="divMenu">

    <table>
        <tr>
            <td>
                متن پیام</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="266px"></asp:TextBox>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp; پیام های پیش فرض&nbsp;</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="278px">
                </asp:DropDownList>
&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server">+</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
                    <td>
                        <asp:HyperLink ID="HyperLink2" runat="server">تائید</asp:HyperLink>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

</div>

<div id="divTable"></div>


    

</div>


