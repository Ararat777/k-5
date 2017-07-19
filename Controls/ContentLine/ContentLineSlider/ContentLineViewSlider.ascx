<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineViewSlider.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineSlider.ContentLineViewSlider" %>

<link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/Styles/Style.css") %>' rel="stylesheet" />
<link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/ContentLineSlider/Styles/Style.css") %>' rel="stylesheet" />
<script src='<%= ResolveClientUrl("~/Controls/ContentLine/ContentLineSlider/Scripts/rcarousel/lib/jquery.ui.core.min.js") %>' type="text/javascript"></script>
<script src='<%= ResolveClientUrl("~/Controls/ContentLine/ContentLineSlider/Scripts/rcarousel/lib/jquery.ui.widget.min.js") %>' type="text/javascript"></script>
<script src='<%= ResolveClientUrl("~/Controls/ContentLine/ContentLineSlider/Scripts/rcarousel/lib/jquery.ui.rcarousel.min.js") %>' type="text/javascript"></script>
<link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/ContentLineSlider/Scripts/rcarousel/css/rcarousel.css") %>' rel="stylesheet" />

<div id="ContentLineSlider">
    <div class="slider">
        <div id="page-preloader"><span class="spinner"></span></div>
        <asp:Repeater ID="rContentLines" runat="server" OnItemDataBound="rContentLines_ItemDataBound">
            <HeaderTemplate>
                <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="slide_list">
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
    <script type="text/javascript">
        $(window).on('load', function () {
            var $preloader = $('#ContentLineSlider #page-preloader'),
                $spinner = $preloader.find('.spinner');
            $spinner.fadeOut();
            $preloader.delay(350).fadeOut('slow');
        });
        $(document).ready(function () {
            $('.slider a[class^="ui-carousel"]').click(function () {
                $('.slide_list .text').fadeOut(100);
            });
        })
    </script>
</div>
