<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_SecuritySettings.ascx.cs" Inherits="ascx_frm_sec_settings"  %>
<asp:SqlDataSource ID="sqld_setting_con" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ticalConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:atiehfouladConnectionString.ProviderName %>" 
    SelectCommand="SELECT st_id,st_name FROM tbl_settings ORDER BY st_id">
</asp:SqlDataSource>
<p>
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" />
</p>
<asp:Panel ID="Panel1" runat="server" Visible="False">
    Param Name :<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp; Param Value:<asp:TextBox ID="TextBox2" runat="server" Height="128px" 
        TextMode="MultiLine" Width="297px"></asp:TextBox>&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="ok" 
        Width="56px" />
</asp:Panel>
<p>
    <br />
</p>
<asp:GridView ID="GridView1" runat="server" DataSourceID="sqld_setting_con">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                    ToolTip='<%# Eval("st_id") %>'>Edit</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowDeleteButton="True" />
    </Columns>
</asp:GridView>
