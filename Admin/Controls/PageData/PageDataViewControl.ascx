<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageDataViewControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PageDataViewControl" %>
<style type="text/css">
    .page-data .data{margin:10px;}
    .page-data .title{font-weight:bold; padding-bottom:3px;}
    .page-data .value{padding-bottom:10px; font-weight:normal;}
</style>
<div class="page-data">
    <div class="data">
        <asp:Panel ID="pnMenuDisplayName" CssClass="title" GroupingText="#MenuDisplayName#"
            meta:resourcekey="pnMenuDisplayName" runat="server" Visible="false">
            <div class="value">
                <asp:Label ID="lValueMenuDisplayName" runat="server"></asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnMenuDescription" CssClass="title" GroupingText="#MenuDescription#"
            meta:resourcekey="pnMenuDescription" runat="server" Visible="false">
            <div class="value">
                <asp:Label ID="lValueMenuDescription" runat="server"></asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnPageTitle" CssClass="title" GroupingText="#PageTitle#" meta:resourcekey="pnPageTitle"
            runat="server" Visible="false">
            <div class="value">
                <asp:Label ID="lValuePageTitle" runat="server"></asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnMetaKeywords" CssClass="title" GroupingText="#MetaKeywords#"
            meta:resourcekey="pnMetaKeywords" runat="server" Visible="false">
            <div class="value">
                <asp:Label ID="lValueMetaKeywords" runat="server"></asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnMetaDescription" CssClass="title" GroupingText="#MetaDescription#"
            meta:resourcekey="pnMetaDescription" runat="server" Visible="false">
            <div class="value">
                <asp:Label ID="lValueMetaDescription" runat="server"></asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnNote" CssClass="title" GroupingText="#Note#" meta:resourcekey="pnNote"
            runat="server" Visible="false">
            <div class="value">
                <asp:Label ID="lValueNote" runat="server"></asp:Label>
            </div>
        </asp:Panel>
    </div>
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <div class="editbuttons">
                <asp:Button ID="bEdit" runat="server" Text="#Edit#" meta:resourcekey="bEdit" Visible="true" CssClass="btn btn-default btn-sm"
                    OnClick="bEdit_Click" />
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
</div>
