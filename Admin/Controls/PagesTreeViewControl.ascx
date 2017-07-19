<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagesTreeViewControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PagesTreeViewControl" %>
<script language="javascript" type="text/javascript">
    function SearchFieldsShowHide(fields, searchIcon) {
        if ($("#" + fields).is(":hidden")) {
            $("#" + fields).slideDown(300);
            $("#" + searchIcon).css("background-image", "url('../Admin/Styles/Images/sfMinus.GIF')");
        } else {
            $("#" + fields).slideUp(300);
            $("#" + searchIcon).css("background-image", "url('../Admin/Styles/Images/sfPlus.GIF')");
        }
    }
</script>
<div class="pages">
    <asp:TreeView ID="tvPages" runat="server" OnSelectedNodeChanged="tvPages_SelectedNodeChanged"
        OnTreeNodeExpanded="tvPages_TreeNodeExpanded">
        <NodeStyle CssClass="node" />
        <SelectedNodeStyle CssClass="node-sel" />
    </asp:TreeView>
</div>
