<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="i.LightSite.Web.Controls.ContentHtmlText.View" %>
<div class="HtmlTextView">    
    <div class="div-row">
        <asp:Literal ID="HtmlText" runat="server"></asp:Literal>
        <div id="divDefaultText" runat="server" class="divDefaultText" visible="false">
            <asp:LinkButton ID="lbDefaultText" runat="server" OnClick="bEdit_Click" ></asp:LinkButton>
        </div>
    </div>
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <div class="row-bt editbuttons">
                <asp:Button ID="bEdit" runat="server"  Text="#Edit#" meta:resourcekey="bEdit" Visible="true" CssClass="btn btn-default btn-sm"
                    OnClick="bEdit_Click" />
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
</div>
