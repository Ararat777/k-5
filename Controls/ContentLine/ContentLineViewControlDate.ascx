<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineViewControlDate.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineViewControlDate" %>
    <link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/Styles/Style.css") %>'
    rel="stylesheet" />
<div id="ContentLineView">
    <asp:Repeater ID="rContentLines" runat="server" OnItemDataBound="rContentLines_ItemDataBound">
        <ItemTemplate>
            <div id="divOuter" class="month" runat="server" visible="false">
                <div class="left"></div>
                <div class="center">
                    <asp:Label ID="lMonth" runat="server"></asp:Label>
                </div>
                <div class="right"></div>
            </div>
            <div class="<%# GetRowStyleClass() %>">
                <div class="photo">
                    <asp:HyperLink ID="hlFoto" runat="server"></asp:HyperLink>
                </div>
                <div class="content">
                    <div class="calendar">
                        <asp:Label ID="lPublisMonth" runat="server" CssClass="month"></asp:Label>
                        <asp:Label ID="lPublisNumber" runat="server" CssClass="number"></asp:Label>
                    </div>
                    <a id="aTitle" runat="server" class="titel">
                        <asp:Label ID="lTitle" runat="server"></asp:Label></a>
                    <asp:Label ID="lPublishDate" runat="server" CssClass="date"></asp:Label>
                    <div class="description">
                        <asp:Literal ID="ltDescription" runat="server"></asp:Literal>
                    </div>
                    <div class="url-details">
                        <asp:HyperLink ID="hlURL" Text="#Details#" runat="server" />
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="clear">
    </div>
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <div class="row-bt editbuttons">
                <asp:Button ID="bEdit" runat="server" Text="#Edit#" meta:resourcekey="bEdit" Visible="true" CssClass="btn btn-default btn-sm"
                    OnClick="bEdit_Click" />
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
</div>
