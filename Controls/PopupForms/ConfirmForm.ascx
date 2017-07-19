<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfirmForm.ascx.cs" Inherits="i.LightSite.Web.Controls.PopupForms.ConfirmForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<div id="messageform" runat="server">
<div id="messageBox">
    <div class="messageTitle">
        <asp:Label ID="lTitle" runat="server" Text="#message title#"></asp:Label>
    </div>
    <div class="message">
        <asp:Label ID="lMessage" runat="server" Text="#Message#"></asp:Label>
    </div>
    <div class="messageButtons">
        <asp:Button ID="bOk" CssClass="button" runat="server" Text="#Ok#" meta:resourcekey="bOk" />
        <asp:Button ID="bCancel" CssClass="button" runat="server" Text="#Cancel# " 
            meta:resourcekey="bCancel" />
    </div>
</div>
</div>
<ajaxToolkit:ModalPopupExtender runat="server" ID="mpeConfirmBox" TargetControlID="lTitle" PopupControlID="messageform"
     BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>