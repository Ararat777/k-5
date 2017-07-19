<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormFileManager.aspx.cs"
    Inherits="i.LightSite.Web.WebFormFileManager" %>

<%@ Register TagPrefix="iLightSite" TagName="scFileManager" Src="~/Controls/scFileManager.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="FileManager" Src="~/Controls/FileManager.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="~/StyleSheets/smoothness/jquery-ui-1.8.19.custom.css"
        rel="stylesheet" />
     <!-- Bootstrap -->
    <link href="~/StyleSheets/bootstrap.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body{margin:0}
        .dEditpopup-background{background:#444444 ;opacity:.70;filter:Alpha(Opacity=70);position:fixed;top:0px;left:0px;width:100%;height:100%;z-index:600 !important}
    </style>
</head>
<body style="overflow: scroll">
    <form id="form1" runat="server">
    <script src='<%= ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js") %>' type="text/javascript"></script>
    <script src='<%= ResolveClientUrl("~/Scripts/jquery-ui-1.8.19.custom.min.js") %>'
        type="text/javascript"></script>
    <script src='<%= ResolveClientUrl("~/Scripts/jquery.center.js") %>' type="text/javascript"></script>
    <div>
        <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>
        <iLightSite:scFileManager ID="ucImageFileManager" runat="server" Visible="true" />
        <iLightSite:FileManager ID="ucFileManager" runat="server" Visible="false" />
    </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $("input:submit, button").button();
            });
    </script>

    </form>
</body>
</html>
