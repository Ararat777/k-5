<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true"
    CodeBehind="Collective.aspx.cs" Inherits="k_5_com_ua.Collective" EnableEventValidation="false" %>

<%@ Register TagPrefix="iLightSite" TagName="ContentHtmlText" Src="~/Controls/ContentHtmlText/ContentHtmlText.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucPageData" Src="~/Admin/Controls/PageData/PageData.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ContentLine" Src="~/Controls/ContentLine/ContentLine.ascx" %>


<%@ Register TagPrefix="iLightSite" TagName="SiteMap" Src="~/Controls/SiteMap.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <div>
        <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>
    </div>
    <div class="TextPagesList">
        <div class="imgBl defText">
            <iLightSite:ContentHtmlText ID="imgBl" runat="server" DefaultText="Место для картинки" SkinControl="true" />
            <div class="titlePages">
                <iLightSite:ContentHtmlText ID="titlePages" runat="server" SkinControl="true" SimpleEditor="true"  />
            </div>
        </div>
        <div class="CollectiveBl">
            <iLightSite:ContentLine ID="CollectiveBl" runat="server" RecommendedSizeImage="285x270" DisplayPublishDate="false" DisplayGroups="true" DetailsPageTemplate="CollectiveDetails.aspx" />
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
