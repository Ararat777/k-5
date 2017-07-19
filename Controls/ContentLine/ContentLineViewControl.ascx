<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineViewControl.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineViewControl" %>
    <link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/Styles/Style.css") %>'
    rel="stylesheet" />

<%@ Register TagPrefix="iLightSite" TagName="ContentLinePager" Src="~/Controls/ContentLine/ContentLinePager/ContentLinePager.ascx" %>

<div id="ContentLineView">
    <asp:Repeater ID="rContentLines" runat="server" OnItemDataBound="rContentLines_ItemDataBound">
        <ItemTemplate>
            <div id="divGroups" class="groups" runat="server" visible="false">
                <div class="left">
                </div>
                <div class="center">
                    <asp:Label ID="lGroupName" runat="server"></asp:Label>
                </div>
                <div class="right">
                </div>
            </div>
            <div id="divOuter" class="month" runat="server" visible="false">
                <div class="left">
                </div>
                <div class="center">
                    <asp:Label ID="lMonth" runat="server"></asp:Label>
                </div>
                <div class="right">
                </div>
            </div>
            <div class="<%# GetRowStyleClass() %> " data-equal-group="1" >
                <div id="divImage" runat="server" class="photo">
                    <asp:HyperLink ID="hlFoto" runat="server"></asp:HyperLink>
                </div>
                <div class="content">
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
        <iLightSite:ContentLinePager ID="ucContentLinePager" runat="server"></iLightSite:ContentLinePager>
    </div>
    <div id="divContentLinePager">
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
