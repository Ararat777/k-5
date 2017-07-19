<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagesControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PagesControl" %>
<%@ Register TagPrefix="contr" TagName="ucPagesEditControl" Src="~/Admin/Controls/PagesEditControl.ascx" %>
<%@ Register TagPrefix="contr" TagName="ucPagesGridControl" Src="~/Admin/Controls/PagesGridControl.ascx" %>
<%@ Register TagPrefix="contr" TagName="ucPagesTreeViewControl" Src="~/Admin/Controls/PagesTreeViewControl.ascx" %>
<div id="divPages" class="pageitem">
    <div class="leftSide">
        <asp:Panel ID="pPages" runat="server" GroupingText="#Pages#" meta:resourcekey="pPages">
            <div class="contet-edit">
                <div class="divAddPageButton">
                    <asp:Button ID="bAddPage" runat="server" CssClass="btn btn-default" Text="#add page#" meta:resourcekey="bAddPage"
                        OnClick="bAddPage_Click" />
                </div>
                <contr:ucPagesTreeViewControl ID="ucPagesTreeViewControl" runat="server" />
            </div>
        </asp:Panel>
    </div>
    <div class="rightSide">
        <contr:ucPagesEditControl ID="ucPagesEdit" runat="server" Visible="false" />
        <contr:ucPagesGridControl ID="ucPagesGrid" runat="server" Visible="true" />
    </div>
    <div class="clear"></div>
</div>
