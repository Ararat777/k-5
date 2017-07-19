<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineViewControlTable.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineViewControlTable" %>
    <link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/Styles/Style.css") %>'
    rel="stylesheet" />
<div id="ContentLineView">
    <asp:Repeater ID="rContentLines" runat="server" OnItemDataBound="rContentLines_ItemDataBound">
        <HeaderTemplate>
            <table cellspacing="0">
                <tr class="header">
                    <td class="dateColumn">
                        <asp:Label ID="lDateHeader" runat="server" Text="#Date#" meta:resourcekey="lDateHeader"></asp:Label>
                    </td>
                    <td class="ef1">
                        <asp:Label ID="lAF1Header" runat="server" Text="#Other#" meta:resourcekey="lAF1Header"></asp:Label>
                    </td>
                    <td class="titleColumn">
                        <asp:Label ID="lTitleHeader" runat="server" Text="#Title#" meta:resourcekey="lTitleHeader"></asp:Label>
                    </td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr id="divOuter" runat="server" visible="false" class="month-row">
                <td  class="dateColumn">
                     <asp:Label ID="lMonth" runat="server"></asp:Label>
                </td>
                <td class="ef1">&nbsp;
                </td>
                <td class="titleColumn">&nbsp;</td>
            </tr>
            <tr class="<%# GetRowStyleClass() %>">
                <td  class="dateColumn">
                     <asp:Label ID="lPublishDate" runat="server" CssClass="date"></asp:Label>
                </td>
                <td class="ef1">
                    <asp:Label ID="lAdditionalField1" runat="server" ></asp:Label>
                </td>
                <td class="titleColumn">
                    <a id="aTitle" runat="server" class="titel">
                                <asp:Label ID="lTitle" runat="server"></asp:Label></a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
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
