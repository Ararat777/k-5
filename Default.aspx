<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="k_5_com_ua.Default" EnableEventValidation="false" %>

<%@ Register TagPrefix="iLightSite" TagName="ContentHtmlText" Src="~/Controls/ContentHtmlText/ContentHtmlText.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ContentLineSlider" Src="~/Controls/ContentLine/ContentLineSlider/ContentLineSlider.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucPageData" Src="~/Admin/Controls/PageData/PageData.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>


<%@ Register TagPrefix="iLightSite" TagName="SiteMap" Src="~/Controls/SiteMap.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <div>
        <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>
        <div class="clear">
        </div>
    </div>
    <div>
        <div class="defSlider">
            <iLightSite:ContentLineSlider ID="defSlider" runat="server"  RecommendedSizeImage="910x508" Width="910" Height="508" NeedDetailsPage="false" NeedExpireDate="false"    DisplayDescription="false" DisplayComment="false" DisplayPublishDate="false" LinkOnImage="false"  NeedDetailsPag="false" />
        </div>
        <div class="defText">
            <iLightSite:ContentHtmlText ID="ContentHtmlText1" runat="server" DefaultText="Введите текст сюда..." />
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
