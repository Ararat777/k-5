<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineDate.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineDate" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineEdit" Src="~/Controls/ContentLine/Admin/ContentLineEditControl.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineViewDate" Src="~/Controls/ContentLine/ContentLineViewControlDate.ascx" %>
<div class="pageitem">
    <asp:LoginView ID="LoginView2" runat="server">
        <LoggedInTemplate>
            <div class="control-name">
                <asp:Label ID="lbNameTypeControl" runat="server"></asp:Label>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
    <iLightSite:ucContentLineEdit ID="ucContentLineEdit" runat="server" Visible="false" />
    <iLightSite:ucContentLineViewDate ID="ucContentLineViewDate" runat="server" Visible="true" />
</div>
