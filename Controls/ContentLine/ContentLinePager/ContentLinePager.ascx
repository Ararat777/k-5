<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLinePager.ascx.cs" Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLinePager.ContentLinePager" %>

<div class="page-pager">
    <div class="pager-numeric">
        <asp:HyperLink ID="hlFirstPage" CssClass="first" runat="server" meta:resourcekey="hlFirstPage"></asp:HyperLink>
        <asp:HyperLink ID="hlPrevPage" CssClass="prev" runat="server" meta:resourcekey="hlPrevPage" Visible="true"></asp:HyperLink>
        <asp:HyperLink ID="hlMorePagesMinus" CssClass="more-minus" runat="server" meta:resourcekey="hlMorePagesMinus"
            Visible="false"></asp:HyperLink>
        <asp:Repeater ID="rPages" runat="server">
            <ItemTemplate>
                <asp:HyperLink ID="hlPage" CssClass="<%# GetCssClass(Convert.ToInt32(Container.DataItem)) %>" runat="server" Text="<%# (string)Container.DataItem %>"
                    NavigateUrl="<%# GetURLForPage(Convert.ToInt32(Container.DataItem)) %>"></asp:HyperLink>
            </ItemTemplate>
        </asp:Repeater>
        <asp:HyperLink ID="hlMorePagesPlus" CssClass="more-plus" runat="server" meta:resourcekey="hlMorePagesPlus"
            Visible="false"></asp:HyperLink>
        <asp:HyperLink ID="hlNextPage" CssClass="next" runat="server" meta:resourcekey="hlNextPage" Visible="true"></asp:HyperLink>
        <asp:HyperLink ID="hlLastPage" CssClass="last" runat="server" meta:resourcekey="hlLastPage"></asp:HyperLink>
    </div>
</div>