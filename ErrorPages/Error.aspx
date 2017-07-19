<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master"
    AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="i.LightSite.Web.ErrorPages.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <meta name="robots" content="noindex,nofollow" />
    <style type="text/css">
        .errorpage .lError {font-size: 24px;}
        .errorpage .l1 {font-size: 12px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div id="bRightL">
        <div id="bRightR">
            <div id="contentText" class="wrapper">
                <div class="errorpage">
                    <asp:Label ID="lError" runat="server" CssClass="lError" Text="Sorry, an error" meta:resourcekey="lError"></asp:Label>
                    <br />
                    <br />
                    <div>
                        <asp:Label ID="l1" runat="server" CssClass="l1" Font-Size="12" Text="For more rapid correction, please let us know about it."
                            meta:resourcekey="l1"></asp:Label>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
