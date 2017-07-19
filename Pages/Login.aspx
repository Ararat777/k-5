<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="i.LightSite.Web.Login" %>

<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="Login" Src="~/Controls/Login.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <div>
        <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server">
        </iLightSite:emDisplayInfo>
        <div class="clear">
        </div>
    </div>
    <div id="bRightL">
        <div id="bRightR">
            <div id="contentText">
                <iLightSite:Login ID="ucLogin" runat="server"></iLightSite:Login>
            </div>
        </div>
    </div>
</asp:Content>
