<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentHtmlText.ascx.cs"
    Inherits="i.LightSite.Web.Controls.ContentHtmlText.ContentHtmlText" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentHtmlTextEditControl" Src="Edit.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentHtmlTextViewControl" Src="View.ascx" %>
<div id="pageitem" runat="server" class="pageitem">
    <asp:LoginView ID="LoginView2" runat="server">
        <LoggedInTemplate>
            <div class="control-name">
                <asp:Label ID="lbNameTypeControl" runat="server" CssClass="contentHtmlNameType"></asp:Label>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
    <iLightSite:ucContentHtmlTextEditControl ID="ucContentHtmlTextEditControl" runat="server"
        Visible="false" />
    <iLightSite:ucContentHtmlTextViewControl ID="ucContentHtmlTextViewControl" runat="server"
        Visible="true" />
</div>
