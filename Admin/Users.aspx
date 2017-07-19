<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="i.LightSite.SiteAdministration.Admin.Users"
    MasterPageFile="~/Admin/MasterPages/Admin.Master" %>

<%@ Register TagPrefix="iLightSite" TagName="ucUsers" Src="~/Admin/Controls/Users/Users.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class="adminpages">
        <div class="text-left">
            <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>
        </div>
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <iLightSite:ucUsers ID="ucUsers" runat="server" />
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</asp:Content>
