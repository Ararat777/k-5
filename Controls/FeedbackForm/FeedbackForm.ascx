<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackForm.ascx.cs"
    Inherits="k_5_com_ua.Controls.FeedbackForm.FeedbackForm" %>
<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>
<div id="FeedbackForm">
    <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server"></iLightSite:emDisplayInfo>

    <div class="title">
        <asp:Label ID="lTitle" runat="server" Text="#lTitle#" meta:resourcekey="lTitle"></asp:Label>
    </div>
    <div class="wid-12" style="margin-top:15px;">
        <div class="div-row position">
            <asp:Label ID="lName" runat="server" Text="#lName#" meta:resourcekey="lName"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="*" CssClass="l-required"></asp:Label><br />
            <asp:TextBox ID="tbName" CssClass="input-sm form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ValidationGroup="RequiredValidationGroup" SetFocusOnError="true" CssClass="mfValidation  error"
                Display="Dynamic" ControlToValidate="tbName" ErrorMessage="#Required field!#" meta:resourcekey="rfvName"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="blF2 wid-6" style="margin-top:15px;">
        <div class="div-row position">
            <asp:Label ID="lPhone" runat="server" Text="#lPhone#" meta:resourcekey="lPhone"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="*" CssClass="l-required"></asp:Label><br />
            <asp:TextBox ID="tbPhone" CssClass="input-sm form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ValidationGroup="RequiredValidationGroup" CssClass="mfValidation  error" SetFocusOnError="true"
                Display="Dynamic" ControlToValidate="tbPhone" ErrorMessage="#Required field!#" meta:resourcekey="rfvPhone"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="blF2 wid-6" style="margin-top:15px;">
        <div class="div-row position">
            <asp:Label ID="lEmail" runat="server" Text="#lEmail#" meta:resourcekey="lEmail"></asp:Label>
            <asp:TextBox ID="tbEmail" CssClass="input-sm form-control" runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="clear"></div>
    <div class="blF2 wid-6" style="margin-top:15px;">
        <div class="div-row position">
            <asp:Label ID="lData" runat="server" Text="#lData#" meta:resourcekey="lData"></asp:Label>
            <asp:TextBox ID="tbData" CssClass="input-sm form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="blF2 wid-6" style="margin-top:15px;">
        <div class="div-row position">
            <asp:Label ID="lTime" runat="server" Text="#lTime#" meta:resourcekey="lTime"></asp:Label>
            <asp:TextBox ID="tbTime" CssClass="input-sm form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="clear"></div>
    <div class="div-row position wid-12" style="margin-top:15px;">
        <asp:Label ID="lComments" runat="server" Text="#lComments#" meta:resourcekey="lComments"></asp:Label><br />
        <asp:TextBox ID="tbComments" runat="server"  CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
    </div>
    <div class="wid-12" style="margin-top:15px;">
        <asp:Label ID="recommendText" runat="server" Text="#recommendText#" meta:resourcekey="recommendText" ></asp:Label>
    </div>
    <div class="clear"></div>
    <div class="row-bt buttons" style="margin:15px 0;">
        <asp:Button CssClass="button" ID="bSendFeedback" runat="server" Text="#bSendFeedback#"
            meta:resourcekey="bSendFeedback" OnClick="bSendFeedback_Click" ValidationGroup="RequiredValidationGroup" />
    </div>
</div>

