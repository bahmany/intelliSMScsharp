<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frm_AdvanceSendSMS_AddNewDraft.aspx.cs" Inherits="ascx_frm_AdvanceSendSMS_AddNewDraft" %>

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
                    متن پیام</td>
                <td style="margin-right: 40px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="207px"></asp:TextBox>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">ثبت</asp:LinkButton>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="sd_id" DataSourceID="ods_draftList">
            <Columns>
                <asp:BoundField DataField="sd_body" HeaderText="متن پیام" 
                    SortExpression="sd_body" />
                <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" 
                    InsertText="جدید..." NewText="جدید" SelectText="انتخاب" ShowDeleteButton="True" 
                    ShowEditButton="True" UpdateText="ثبت" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ods_draftList" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="MainDataModuleTableAdapters.tbl_sms_draftTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_sd_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="sd_ownerID" Type="Int32" />
                <asp:Parameter Name="sd_body" Type="String" />
                <asp:Parameter Name="Original_sd_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter DefaultValue="-1" Name="sd_ownerID" 
                    SessionField="OwnerID" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="sd_body" PropertyName="Text" 
                    Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
