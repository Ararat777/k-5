<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master"
    AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="i.LightSite.Web.ErrorPages.Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <meta name="robots" content="noindex,nofollow" />
    <style type="text/css">
        .error404   {     }
        .l404 {font-size: 100pt;color: #ccc; text-align:center;}
        .l404v{font-size: 24pt; display: block; text-align: center; border-bottom:2px solid #ccc; text-transform: uppercase;}
        .l404p1{  font-size: 12pt; display: block; text-align: center;   }
        .toMain404 { background: url(../StyleSheets/images/toMain404.png) no-repeat 100% 1px;  padding-right:20px; font-size:12pt; color:#787878; -moz-transition: color 0.2s ease-in; -o-transition: color 0.2s ease-in; -webkit-transition: color 0.2s ease-in; transition: color 0.2s ease-in;}
        .toMain404:hover { background: url(../StyleSheets/images/toMain404.png) no-repeat 100% -33px; padding-right:20px; color:#000; text-decoration:none; }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div id="bRightL">
        <div id="bRightR">
            <div id="contentText">
                <div class="error404 ">
                    <div class="l404"> 404</div>
                    <asp:Label ID="lPageNotFound" runat="server" CssClass="l404v" Text=": page not found"
                        meta:resourcekey="lPageNotFound"></asp:Label>
                    <br />
                    <asp:Label ID="l404p1" runat="server" CssClass="l404p1" Text="#Probably, the desired page is removed as obsolete or has been moved to another location.#"
                        meta:resourcekey="l404p1"></asp:Label>
                    <br />
                    <br />
                    <div class="text-center">
                         <asp:HyperLink ID="toMain404" runat="server" CssClass="toMain404" NavigateUrl="~/" Text="#ПЕРЕЙТИ НА ГЛАВНУЮ#" meta:resourcekey="toMain404" ></asp:HyperLink>
                    </div>
                   <%-- <br />
                    <asp:Label ID="l404p2" runat="server" Text=" or mistake in the address." Font-Size="12"
                        meta:resourcekey="l404p2"></asp:Label>--%>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
