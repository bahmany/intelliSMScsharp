<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tk.aspx.cs" Inherits="login" %>

<%@ Register src="ascx/pnl_Login.ascx" tagname="pnl_Login" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="js/jquery.min.js" type="text/javascript"></script>

    <script src="js/jquery.cycle.all.latest.js" type="text/javascript"></script>
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
    <style type="text/css">
        .style1
        {
            text-align: center;
            font-weight: bold;
            font-size: medium;
        }
    </style>
</head>
<body style="font-family: tahoma; font-size: 12px" dir="rtl">
<style type="text/css">
.slideshow img { padding: 0px; background-color: #eee; text-align:center; }
</style>
<script type="text/javascript">

    $('#slideshow').cycle({
        after: function(el, next_el) {
            $(next_el).addClass('active');
        },
        before: function(el) {
            $(el).removeClass('active');
        }
    });

</script>
    <form id="form1" runat="server">
    <div style="background-color: #FFFFFF; margin-right: auto; margin-left: auto; width: 800px; height: 1500px">
        <br />
    
        <br />
        <br />
        <br />
        <img alt="" src="images/DSC_4630.jpg" style="width: 333px; height: 501px" /><br />
        <br />
        <img alt="" src="images/DSC_4632.jpg" style="width: 400px; height: 602px" /><br />
        <img alt="" src="images/DSC_4640.JPG" style="width: 400px; height: 602px" /><br />
    <div>
        <br />
        
<div id="slideshow">

<img class="Active" src="images/slid1.jpg" alt="" />
<img src="images/slid2.jpg" alt="" />
<img src="images/slid3.jpg" alt="" />

</div>
        <br />
        <br />
        <p>
            &nbsp;</p>
        <p class="style1">
            در دست طراحی</p>
        </div>
    </div>
    </form>
</body>
</html>
