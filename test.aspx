<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>



<%@ Register src="ascx/frm_Settings.ascx" tagname="frm_Settings" tagprefix="uc1" %>



<%@ Register src="ascx/frm_AdvanceSendSMS.ascx" tagname="frm_AdvanceSendSMS" tagprefix="uc2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc2:frm_AdvanceSendSMS ID="frm_AdvanceSendSMS1" runat="server" />

</asp:Content>

