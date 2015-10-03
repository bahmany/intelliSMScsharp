<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="login" %>

<%@ Register src="ascx/pnl_Login.ascx" tagname="pnl_Login" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script language="JavaScript">
    function correctPNG() // correctly handle PNG transparency in Win IE 5.5 & 6.
    {
        var arVersion = navigator.appVersion.split("MSIE")
        var version = parseFloat(arVersion[1])
        if ((version >= 5.5) && (document.body.filters)) {
            for (var i = 0; i < document.images.length; i++) {
                var img = document.images[i]
                var imgName = img.src.toUpperCase()
                if (imgName.substring(imgName.length - 3, imgName.length) == "PNG") {
                    var imgID = (img.id) ? "id='" + img.id + "' " : ""
                    var imgClass = (img.className) ? "class='" + img.className + "' " : ""
                    var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
                    var imgStyle = "display:inline-block;" + img.style.cssText
                    if (img.align == "left") imgStyle = "float:left;" + imgStyle
                    if (img.align == "right") imgStyle = "float:right;" + imgStyle
                    if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
                    var strNewHTML = "<span " + imgID + imgClass + imgTitle
            + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
            + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
            + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>"
                    img.outerHTML = strNewHTML
                    i = i - 1
                }
            }
        }
    }
    window.attachEvent("onload", correctPNG);
</script>
    
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="font-family: tahoma; font-size: 12px" dir="rtl">
    <form id="form1" runat="server">
    <div>
    <style type="text/css">
    .style1
    {
    }
    </style>
<center dir="rtl">
    <asp:Panel ID="Panel1" runat="server">
 

<div style="" >

<table style="padding: 9px; background-position: center top; width: 303px; background-image: url('images/logoLogin.png'); background-repeat: no-repeat; height: 384px;">
    <tr>
        <td class="style1">
        <center>
            <img alt="" src="images/Untitled-1.jpg" style="width: 244px; height: 245px" /></center></td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
</div>
<div>
<br />
<br />

<table>
<tbody>
<tr>
<td>
    <img alt="" src="images/btn1.jpg"  onclick="window.location='homepage.aspx'" 
        style="width: 180px; height: 173px; cursor: pointer;" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
<td>
    <img alt="" src="images/btn2.jpg" onclick="window.location='tk.aspx'" 
        style="width: 180px; height: 173px; cursor: pointer; " /></td>


</tr>
</tbody></table>
</div>

   </asp:Panel>
</center>
    
    </div>
    </form>
</body>
</html>
