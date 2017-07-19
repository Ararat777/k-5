<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLine.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLine" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineEdit" Src="~/Controls/ContentLine/Admin/ContentLineEditControl.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineView" Src="~/Controls/ContentLine/ContentLineViewControl.ascx" %>
<div class="pageitem">
    <asp:LoginView ID="LoginView2" runat="server">
        <LoggedInTemplate>
            <div class="control-name">
                <asp:Label ID="lbNameTypeControl" runat="server"></asp:Label>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
    <iLightSite:ucContentLineEdit ID="ucContentLineEdit" runat="server" Visible="false" />
    <iLightSite:ucContentLineView ID="ucContentLineView" runat="server" Visible="true" />
</div>
