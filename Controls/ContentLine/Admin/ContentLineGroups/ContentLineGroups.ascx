<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineGroups.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.Admin.ContentLine.ContentLineGroups.ContentLineGroups" %>
<%@ Register TagPrefix="iLightSite" TagName="ContentLineGroupsEdit" Src="~/Controls/ContentLine/Admin/ContentLineGroups/ContentLineGroupsEdit.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ContentLineGroupsView" Src="~/Controls/ContentLine/Admin/ContentLineGroups/ContentLineGroupsView.ascx"%>
<div class="contentLine-groups" >
    <iLightSite:ContentLineGroupsEdit ID="ucContentLineGroupsEdit"
        runat="server" Visible="false" />
    <iLightSite:ContentLineGroupsView ID="ucContentLineGroupsView" runat="server" Visible="true" />
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <div class="div-row editbuttons">
                <asp:Button ID="bEdit" runat="server" Text="#Edit#" CssClass="btn btn-default btn-sm" meta:resourcekey="bEdit"
                    Visible="true" OnClick="bEdit_Click" />
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
</div>
