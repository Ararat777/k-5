<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true"
    CodeBehind="Contacts.aspx.cs" Inherits="k_5_com_ua.Contacts" EnableEventValidation="false" %>

<%@ Register TagPrefix="iLightSite" TagName="ContentHtmlText" Src="~/Controls/ContentHtmlText/ContentHtmlText.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucPageData" Src="~/Admin/Controls/PageData/PageData.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>


<%@ Register TagPrefix="iLightSite" TagName="SiteMap" Src="~/Controls/SiteMap.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
   
    <div>
        <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>
        <div class="clear">
        </div>
    </div>
    <div class="contactsBlock">
        <div class="imgBl defText">
            <iLightSite:ContentHtmlText ID="imgBl" runat="server" DefaultText="Место для картинки" SkinControl="true" />
            <div class="titlePages">
                <iLightSite:ContentHtmlText ID="titlePages" runat="server" SkinControl="true" SimpleEditor="true" />
            </div>
        </div>
        <div class="contactsBlockText">
            <div class="wid-6">
                <iLightSite:ContentHtmlText ID="contactsBlockTextLeft" runat="server" DefaultText="Введите текст сюда..." />
            </div>
            <div class="wid-6">
                <iLightSite:ContentHtmlText ID="contactsBlockTextRight" runat="server" DefaultText="Введите текст сюда..." />
            </div>
        </div>
        <div class="clear">
        </div>
        <!-- Map -->
        <section class="map">
            <iLightSite:ContentHtmlText ID="map" runat="server" SkinControl="true" />
        </section>
        <!-- END Map -->
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
