<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Users.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.Users.Users" %>
<%@ Register TagPrefix="contr" TagName="ucUsersEdit" Src="~/Admin/Controls/Users/UsersEdit.ascx" %>
<%@ Register TagPrefix="contr" TagName="ucUsersGrid" Src="~/Admin/Controls/Users/UsersGrid.ascx" %>
<div class="pageitem">
        <contr:ucUsersEdit ID="ucUsersEdit" runat="server" Visible="false" />
        <contr:ucUsersGrid ID="ucUsersGrid" runat="server" Visible="true" />
</div>
