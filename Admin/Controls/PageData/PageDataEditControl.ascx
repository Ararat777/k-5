<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageDataEditControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PageDataEditControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
    <style type="text/css">
        #data-page{width:750px;margin:0;font-size:12px;font-family:Arial, Sans-Serif}
        .value{padding-bottom:10px;}
        .title{padding-bottom:3px; font-weight:bold}
        .modalBackground{background:#444444 url('<%= ResolveClientUrl("~/StyleSheets/Images/modalB.png") %> ') 50% 50% repeat;opacity:.70;filter:Alpha(Opacity=70);position:fixed;top:0px;left:0px;z-index:600 !important}
        .modalPanelPopup{padding: 5px;background-color:#FFFFFF;z-index:601 !important}
        .header-control{text-transform:uppercase;font-weight:900;margin:0 0 10px 0;color:#6c6c6a}
        .page-edit-data{background-color:#edf5ff;padding:0.25em 0.5em}
        .header-control.panel-heading { margin-bottom:0;}
        .width100{width:728px}
        .rowe.buttons{padding:10px 0;text-align:right}
        textarea{resize:vertical}
    </style>
<div id="dPopupControl" runat="server" style="display:none" class="modalPanelPopup data-edit">
    <div id="data-page" class="panel panel-default">
        <div class="header-control panel-heading">
            <asp:Label ID="lHeaderTitle" runat="server" Text="#HeaderTitle#" meta:resourcekey="lHeaderTitle"></asp:Label>
        </div>
        <div class="page-edit-data panel-body">
            <div class="title">
                <asp:Label ID="lMenuDisplayName" runat="server" Text="#MenuDisplayName#" meta:resourcekey="lMenuDisplayName"
                    Visible="false"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbMenuDisplayName" runat="server" CssClass="width100 form-control input-sm" Visible="false"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvMenuDisplayName" ControlToValidate="tbMenuDisplayName" runat="server"
                    ErrorMessage="#MenuDisplayName is required field!#" meta:resourcekey="rfvMenuDisplayName"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceMenuDisplayName" TargetControlID="rfvMenuDisplayName" />
            </div>
            <div class="title">
                <asp:Label ID="lMenuDescription" runat="server" Text="#MenuDescription#" meta:resourcekey="lMenuDescription"
                    Visible="false"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbMenuDescription" runat="server" CssClass="width100 form-control input-sm" Visible="false"></asp:TextBox>
            </div>
            <div class="title">
                <asp:Label ID="lPageTitle" runat="server" Text="#PageTitle#" meta:resourcekey="lPageTitle"
                    Visible="false"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbPageTitle" runat="server" CssClass="width100 form-control input-sm" Visible="false" MaxLength="500"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvPageTitle" ControlToValidate="tbPageTitle" runat="server" ErrorMessage="#PageTitle is required field!#"
                    meta:resourcekey="rfvPageTitle"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vcePageTitle" TargetControlID="rfvPageTitle" />
            </div>
            <div class="title">
                <asp:Label ID="lMetaKeywords" runat="server" Text="#MetaKeywords#" meta:resourcekey="lMetaKeywords"
                    Visible="false"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbMetaKeywords" Rows="3" TextMode="MultiLine" runat="server" CssClass="width100 form-control input-sm"
                    Visible="false" onkeyup="maxLenghtControl(this,500)"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvMetaKeywords" ControlToValidate="tbMetaKeywords" runat="server" ErrorMessage="#MetaKeywords is required field!#"
                    meta:resourcekey="rfvMetaKeywords"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceMetaKeywords" TargetControlID="rfvMetaKeywords" />
            </div>
            <div class="title">
                <asp:Label ID="lMetaDescription" runat="server" Text="#MetaDescription#" meta:resourcekey="lMetaDescription"
                    Visible="false"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbMetaDescription" Rows="3" TextMode="MultiLine" runat="server"
                    CssClass="width100 form-control input-sm" Visible="false" onkeyup="maxLenghtControl(this,500)"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvMetaDescription" ControlToValidate="tbMetaDescription" runat="server"
                    ErrorMessage="#MetaDescription is required field!#" meta:resourcekey="rfvMetaDescription"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceMetaDescription" TargetControlID="rfvMetaDescription" />
            </div>
            <div class="title">
                <asp:Label ID="lNote" runat="server" Text="#Note#" meta:resourcekey="lNote" Visible="false"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbNote" runat="server" CssClass="width100" Visible="false"></asp:TextBox>
            </div>
        </div>
        <div class="rowe buttons panel-footer">
            <asp:Button ID="bSave" runat="server" ValidationGroup="ErrorValidationGroup" Text="#Save#" CssClass="btn btn-primary btn-sm"
                meta:resourcekey="bSave" OnClick="bSave_Click" Visible="true" />
            <asp:Button ID="bCancel" runat="server" Text="#Cancel#" meta:resourcekey="bCancel" CssClass="btn btn-default btn-sm"
                OnClick="bCancel_Click" Visible="true" />
        </div>
    </div>
</div>
<div style="visibility: hidden">
    <asp:LinkButton ID="FakeButton" runat="server" Text="Button" /></div>
<ajaxToolkit:ModalPopupExtender id="mpeEdit" runat="server" targetcontrolid="FakeButton"
    popupcontrolid="dPopupControl" backgroundcssclass="modalBackground" dropshadow="true" />

<script type="text/javascript">
    function maxLenghtControl(el, maxLenght) {
        var text = $(el).val();
        if (text.length > maxLenght) {
            $(el).val(text.substring(0, maxLenght));
            alert('Максимальная  длина для этого поля '+ 500 + ' символов');
        }
    }
</script>
