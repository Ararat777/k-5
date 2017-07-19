<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="i.LightSite.SiteAdministration.Admin.Pages"
    MasterPageFile="~/Admin/MasterPages/Admin.Master" %>

<%@ Register TagPrefix="iLightSite" TagName="ucPagesControl" Src="~/Admin/Controls/PagesControl.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class="adminpages">
        <div class="text-left">
            <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>
        </div>
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <iLightSite:ucPagesControl ID="ucPages" runat="server" />
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</asp:Content>
