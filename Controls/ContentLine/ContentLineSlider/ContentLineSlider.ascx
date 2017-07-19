<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineSlider.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineSlider.ContentLineSlider" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineEdit" Src="~/Controls/ContentLine/Admin/ContentLineEditControl.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ContentLineViewSlider" Src="~/Controls/ContentLine/ContentLineSlider/ContentLineViewSlider.ascx" %>
<div class="pageitem">
    <asp:LoginView ID="LoginView2" runat="server">
        <LoggedInTemplate>
            <div class="control-name">
                <asp:Label ID="lbNameTypeControl" runat="server"></asp:Label>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
    <iLightSite:ucContentLineEdit ID="ucContentLineEdit" runat="server" Visible="false" />
    <iLightSite:ContentLineViewSlider ID="ucContentLineViewSlider" runat="server" Visible="true" />
</div>
