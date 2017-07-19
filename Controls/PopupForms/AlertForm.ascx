<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlertForm.ascx.cs" Inherits="i.LightSite.Web.Controls.PopupForms.AlertForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<div id="messageform" runat="server" visible="false">
    <div id="messageBox" class="modalPanelPopup">
        <div class="messageTitle">
            <asp:Label ID="lTitle" runat="server" Text="#message title#"></asp:Label>
        </div>
        <div class="message">
            <asp:Label ID="lMessage" runat="server" Text="#Message#"></asp:Label>
        </div>
        <div class="messageButtons">
            <asp:Button ID="bOk" CssClass="button btn btn-default btn-sm" runat="server" Text="#Ok#"  meta:resourcekey="bOk" />
        </div>
    </div>
</div>
<ajaxToolkit:ModalPopupExtender runat="server" ID="mpeAlertBox" TargetControlID="lTitle"
    PopupControlID="messageform" BackgroundCssClass="modalMessageBackground" CancelControlID="bOk">
</ajaxToolkit:ModalPopupExtender>