<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_OwnerAndCellCenterManagerChangeAuto.ascx.cs" Inherits="ascx_frm_OwnerAndCellCenterManagerChangeAuto" %>
    <div dir="rtl" style="font-family: tahoma; font-size: 11px">
   <a href="links.aspx?page_id=16">
   برگشت
   </a> 
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