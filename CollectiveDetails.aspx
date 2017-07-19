<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true"
    CodeBehind="CollectiveDetails.aspx.cs" Inherits="k_5_com_ua.CollectiveDetails" EnableEventValidation="false" %>

<%@ Register TagPrefix="iLightSite" TagName="ContentHtmlText" Src="~/Controls/ContentHtmlText/ContentHtmlText.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucPageData" Src="~/Admin/Controls/PageData/PageData.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>


<%@ Register TagPrefix="iLightSite" TagName="SiteMap" Src="~/Controls/SiteMap.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <div>
        <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>
    </div>
    <div class="TextPagesList">
        <div class="CollectiveDetailsBl">
            <iLightSite:ContentHtmlText ID="CollectiveDetailsBl" runat="server" DefaultText="Введите текст..." />
            <div class="clear">
            </div>
            <div class="backAllCollective">
                <iLightSite:ContentHtmlText ID="backAllCollective" runat="server" SkinControl="true" OnlyThisPage="true" />
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div>
        <asp:LoginView ID="lvPageData" runat="server" Visible="false">
            <LoggedInTemplate>
                <iLightSite:ucPageData ID="ucPageData" ShowPageTitle="true" ShowMetaDescription="true"
                    ShowMetaKeywords="true" runat="server" />
            </LoggedInTemplate>
        </asp:LoginView>
        <div class="clear">
        </div>
    </div>
</asp:Content>
