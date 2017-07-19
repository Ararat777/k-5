<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineNavigator.ascx.cs" Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineNavigator.ContentLineNavigator" %>

<div id="divContentLineNavigator">
    <div class="divBackToList">
        <asp:HyperLink ID="hlBackToList" runat="server"></asp:HyperLink>
    </div>
    <div class="divPrevious">
        <asp:HyperLink ID="hlPrevious" runat="server"></asp:HyperLink>
    </div>
    <div class="divNext">
        <asp:HyperLink ID="hlNext" runat="server"></asp:HyperLink>
    </div>
    <div class="clear"></div>
</div>