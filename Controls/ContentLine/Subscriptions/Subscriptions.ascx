<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Subscriptions.ascx.cs" Inherits="i.LightSite.ContentLine.Controls.ContentLine.Subscriptions.Subscriptions" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxcontrol" %>

<div id="SubscriptionsControl">
    <div class="divSubscriptionDescr">   
        <asp:Label ID="lDescription" runat="server" Text="# subscribe to news #" meta:resourcekey="lDescription"></asp:Label>
    </div>
    <div class="divSubscriptionEmail">
        <asp:TextBox ID="tbSubscriptionEmail" runat="server" MaxLength="120"></asp:TextBox>
        <ajaxcontrol:TextBoxWatermarkExtender ID="tbweSubscriptionEmail" runat="server" TargetControlID="tbSubscriptionEmail"
                WatermarkText="#Enter email#" WatermarkCssClass="watermarked" meta:resourcekey="tbweSubscriptionEmail" />
        <asp:RequiredFieldValidator ID="rfvSubscriptionEmail" runat="server" ControlToValidate="tbSubscriptionEmail"
            Display="None" ValidationGroup="vgAddSubscription" SetFocusOnError="true"
            ErrorMessage="# First enter email #" meta:resourcekey="rfvSubscriptionEmail">
        </asp:RequiredFieldValidator>
        <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceSubscriptionEmail" TargetControlID="rfvSubscriptionEmail"
            PopupPosition="BottomLeft" />
        <asp:RegularExpressionValidator ID="revSubscriptionEmail" runat="server" ControlToValidate="tbSubscriptionEmail"
            Display="None" ValidationGroup="vgAddSubscription" SetFocusOnError="true"
            ErrorMessage="# Wrong email format #" meta:resourcekey="revSubscriptionEmail" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vcerevSubscriptionEmail" TargetControlID="revSubscriptionEmail"
            PopupPosition="BottomLeft" />
    </div>
    <div class="button">
        <asp:LinkButton ID="lbSubscription" runat="server" Text="# Subscription #" meta:resourcekey="lbSubscription"
            ValidationGroup="vgAddSubscription" OnClick="lbSubscription_Click"></asp:LinkButton>
    </div>
</div>