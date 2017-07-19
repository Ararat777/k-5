<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineTable.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineTable" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineEdit" Src="~/Controls/ContentLine/Admin/ContentLineEditControl.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineViewTable" Src="~/Controls/ContentLine/ContentLineViewControlTable.ascx" %>
<div class="pageitem">
    <asp:LoginView ID="LoginView2" runat="server">
        <LoggedInTemplate>
            <div class="control-name">
                <asp:Label ID="lbNameTypeControl" runat="server"></asp:Label>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
    <iLightSite:ucContentLineEdit ID="ucContentLineEdit" runat="server" Visible="false" />
    <iLightSite:ucContentLineViewTable ID="ucContentLineViewTable" runat="server" Visible="true" />
</div>
