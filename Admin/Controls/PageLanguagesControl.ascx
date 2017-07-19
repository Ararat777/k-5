<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageLanguagesControl.ascx.cs" Inherits="i.LightSite.SiteAdministration.Admin.Controls.PageLanguagesControl" %>
<%@ Register TagPrefix="contr" TagName="ucPageLanguagesEditControl" Src="~/Admin/Controls/PageLanguagesEditControl.ascx" %>
<%@ Register TagPrefix="contr" TagName="ucPageLanguagesGridControl" Src="~/Admin/Controls/PageLanguagesGridControl.ascx" %>
<div>
    <div class="tabsConteiner">
        <div id="divTabs" runat="server" class="tabs">
            <asp:LinkButton ID="lbDisplayEditControl" runat="server" Text="#lbDisplayEditControl#" CssClass="activeTab"
                Enabled="false" meta:resourcekey="lbDisplayEditControl" OnClick="lbDisplayEditControl_Click"></asp:LinkButton>
            <asp:LinkButton ID="lbDisplayGridControl" runat="server" Text="#lbDisplayGridControl#"
                meta:resourcekey="lbDisplayGridControl" OnClick="lbDisplayGridControl_Click"></asp:LinkButton>
        </div>
        <div id="divTabPanel" runat="server" class="tabPanel">
            <div class="contet-edit">
                <contr:ucPageLanguagesEditControl ID="ucPageLanguagesEdit" runat="server" Visible="false" />
                <contr:ucPageLanguagesGridControl ID="ucPageLanguagesGrid" runat="server" Visible="true" />
            </div>
        </div>
    </div>
</div>