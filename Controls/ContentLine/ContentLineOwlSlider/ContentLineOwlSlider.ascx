<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineOwlSlider.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineOwlSlider.ContentLineOwlSlider" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineEdit" Src="~/Controls/ContentLine/Admin/ContentLineEditControl.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ContentLineOwlViewSlider" Src="~/Controls/ContentLine/ContentLineOwlSlider/ContentLineOwlViewSlider.ascx" %>
<div class="pageitem">
    <asp:LoginView ID="LoginView2" runat="server">
        <LoggedInTemplate>
            <div class="control-name">
                <asp:Label ID="lbNameTypeControl" runat="server"></asp:Label>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
    <iLightSite:ucContentLineEdit ID="ucContentLineEdit" runat="server" Visible="false" />
    <iLightSite:ContentLineOwlViewSlider ID="ucContentLineOwlViewSlider" runat="server" Visible="true" />
</div>
