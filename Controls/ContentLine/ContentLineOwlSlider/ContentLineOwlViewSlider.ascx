<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineOwlViewSlider.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineOwlSlider.ContentLineOwlViewSlider" %>
    
<script src='<%= ResolveClientUrl("~/Controls/ContentLine/ContentLineOwlSlider/Scripts/owl.carousel.min.js") %>' type="text/javascript"></script>
<link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/Styles/Style.css") %>' rel="stylesheet" />
<link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/ContentLineOwlSlider/Styles/owl.carousel.css") %>' rel="stylesheet" />

<div id="ContentLineOwlSlider">
    <div class="slider">
        <div id="page-preloader"><span class="spinner"></span></div>
        <asp:Repeater ID="rContentLines" runat="server" OnItemDataBound="rContentLines_ItemDataBound">
            <HeaderTemplate>
                <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="item">
                    <div class="photo">
                        <asp:HyperLink ID="hlFoto" runat="server"></asp:HyperLink>
                    </div>
                    <div class="text">
                        <asp:Label ID="lPublishDate" runat="server" CssClass="date"></asp:Label>
                        <a id="aTitle" runat="server" class="titel">
                            <asp:Label ID="lTitle" runat="server"></asp:Label></a>
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
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    <asp:PlaceHolder ID="phScripts" runat="server"></asp:PlaceHolder>    
    </div>
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
    <script>
        $(window).on('load', function () {
            var $preloader = $('#ContentLineOwlSlider #page-preloader'),
                $spinner = $preloader.find('.spinner');
            $spinner.fadeOut();
            $preloader.delay(350).fadeOut('slow');
        });
    </script>
</div>
