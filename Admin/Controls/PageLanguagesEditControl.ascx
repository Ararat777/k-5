<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageLanguagesEditControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PageLanguagesEditControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxcontrol" %>
<script type="text/javascript">
    function showHideUrl() {
        $("#<%= divRedirectURL.ClientID %>").toggle();
        document.getElementById('<%= rfvRedirectURL.ClientID %>').enabled = ($("#<%= divRedirectURL.ClientID %>").is(":visible"));

        $("#<%= divUrl.ClientID %>").toggle();
        document.getElementById('<%= rfvUrlPageName.ClientID %>').enabled = ($("#<%= divUrl.ClientID %>").is(":visible"));
        document.getElementById('<%= revUrlPageName.ClientID %>').enabled = ($("#<%= divUrl.ClientID %>").is(":visible"));
    }

    $(document).ready(function () {
        if ($("#<%= chUseRedirectURL.ClientID %>").attr("checked") != "checked") {
            $("#<%= divRedirectURL.ClientID %>").hide();
        }
        else {
            $("#<%= divUrl.ClientID %>").hide();
        }
    });
</script>
<style type="text/css">
    .displayNone{display:none}
</style>
<div class="languages-edit">
    <div id="divControlHeader" runat="server" class="header">
        <asp:Label ID="lPageLangEditControlHeader" runat="server" Text="#lPageLangEditControlHeader#"
            meta:resourcekey="lPageLangEditControlHeader"></asp:Label>
    </div>
    <div>
        <div id="divLanguages" runat="server" class="divItemLanguages">
            <asp:Label ID="lLanguageToFilling" runat="server" Text="#Language to filling#" meta:resourcekey="lLanguageToFilling"></asp:Label>
            <asp:DropDownList ID="ddlLangName" runat="server" DataTextField="LangNativeName"
                DataValueField="LanguageID" OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>
        </div>
        <div class="clear"></div>
        <div class="title">
            <asp:Label ID="lMenuDisplayName" runat="server" Text="#MenuDisplayName#" meta:resourcekey="lMenuDisplayName"></asp:Label>
        </div>
        <div class="value">
            <asp:TextBox ID="tbMenuDisplayName" runat="server" CssClass="width100" MaxLength="100"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                ID="rfvMenuDisplayName" ControlToValidate="tbMenuDisplayName" runat="server"
                ErrorMessage="#MenuDisplayName is required field!#" meta:resourcekey="rfvMenuDisplayName"></asp:RequiredFieldValidator>
            <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceMenuDisplayName" TargetControlID="rfvMenuDisplayName" PopupPosition="BottomLeft" />
        </div>
        <div class="title">
            <div class="float-left">
                <asp:Label ID="lUrlPageName" runat="server" Text="#UrlPageName#" meta:resourcekey="lUrlPageName"></asp:Label>
            </div>
            <div class="float-left useOuterLink">
                <asp:CheckBox ID="chUseRedirectURL" runat="server" Text="#Use redirect URL#" meta:resourcekey="chUseRedirectURL"
                    onclick="showHideUrl();" />
                <asp:Label ID="lHelpUseRedirectURL" runat="server" CssClass="help" ToolTip="#lHelpUseRedirectURL#" meta:resourcekey="lHelpUseRedirectURL"></asp:Label>
            </div>
            <div class="clear">
            </div>
        </div>
        <div id="divUrl" runat="server" class="value">
            <table style="width:100%;border:none">
                <tr>
                    <td>
                        <asp:TextBox ID="tbUrlPageName" runat="server" CssClass="width100" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                            ID="rfvUrlPageName" ControlToValidate="tbUrlPageName" runat="server" ErrorMessage="#UrlPageName is required field!#"
                            meta:resourcekey="rfvUrlPageName"></asp:RequiredFieldValidator>
                        <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceUrlPageName" TargetControlID="rfvUrlPageName"
                            PopupPosition="BottomLeft" />
                        <asp:RegularExpressionValidator ValidationGroup="ErrorValidationGroup" Display="None"
                            ID="revUrlPageName" ControlToValidate="tbUrlPageName" runat="server" ValidationExpression="(([^\# ||^\%||^\+||^\&||^\*]))*"
                            ErrorMessage="#(%, &, *, +, #) invalid characters for url!#" meta:resourcekey="revUrlPageName"></asp:RegularExpressionValidator>
                        <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceUrlPageName3" TargetControlID="revUrlPageName"
                            PopupPosition="BottomLeft" />
                    </td>
                    <td style="width:20px;max-width:20px;">
                        <asp:ImageButton ID="ibUpdateNameUrl" runat="server" ImageUrl="~/Admin/Styles/Images/reload.png"
                            ToolTip="#Update nameUrl#" meta:resourcekey="ibUpdateNameUrl" OnClick="ibUpdateNameUrl_OnClick"
                            CssClass="UpdateUrlName" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divRedirectURL" class="divRedirectURL" runat="server">
            <div class="title">
                <asp:CheckBox ID="chRedirectURLNewWindowOpen" Text="#RedirectURLNewWindowOpen#" CssClass="text-left"
                    runat="server" meta:resourcekey="chRedirectURLNewWindowOpen" /> 
                <asp:Label ID="lHelpRedirectURLNewWindowOpen" runat="server" CssClass="help" ToolTip="#lHelpRedirectURLNewWindowOpen#"
                    meta:resourcekey="lHelpRedirectURLNewWindowOpen"></asp:Label>
            </div>
            <div class="div-row">
                <div class="dRedirectURL">
                    <asp:TextBox ID="tbRedirectURL" runat="server" CssClass="width100"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" ID="rfvRedirectURL"
                        ForeColor="Red" ControlToValidate="tbRedirectURL" Display="None" runat="server" ErrorMessage="#RedirectURL is required field!#"
                        meta:resourcekey="rfvtbRedirectURL"></asp:RequiredFieldValidator>
                    <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceRedirectUrl" TargetControlID="rfvRedirectURL" PopupPosition="BottomLeft" />
                </div>
                <div class="clear-both">
                </div>
            </div>
        </div>
        <div id="divShowPage" runat="server" class="divShowPage">
            <asp:HyperLink ID="hlShowPage" runat="server" Text="#Show page#" meta:resourcekey="hlShowPage" Target="_blank"></asp:HyperLink>
        </div>
        <div class="title value">
            <asp:CheckBox ID="chDisplayPage" runat="server" Text="#Display page#" meta:resourcekey="chDisplayPage" />
            <asp:Label ID="lHelpDisplayPage" runat="server" CssClass="help" ToolTip="#lHelpDisplayPage#" meta:resourcekey="lHelpDisplayPage"></asp:Label>
        </div>
        <div class="title value">
            <asp:CheckBox ID="chbActivePage" runat="server" Text="#Active Page#" meta:resourcekey="chbActivePage" />
            <asp:Label ID="lActivePageHelp" runat="server" CssClass="help" ToolTip="#lActivePageHelp#" meta:resourcekey="lActivePageHelp"></asp:Label>
        </div>
        <div id="divPageMetaDataBlock">
            <div class="div-row">
                <asp:Label ID="lShowHideMetaData" runat="server" Text="#Show hide page meta data#"
                    meta:resourcekey="lShowHideMetaData" CssClass="labelAsLink" OnClick="ShowHidePanel('divPageMetaData');"></asp:Label>
            </div>
            <div class="divPageMetaData displayNone">
                <asp:Panel ID="pnMetaData" runat="server" GroupingText="#MetaData#" meta:resourcekey="pnMetaData" CssClass="pnPageMetaData">
                    <div class="title">
                        <asp:Label ID="lPageTitle" runat="server" Text="#PageTitle#" meta:resourcekey="lPageTitle"></asp:Label>
                    </div>
                    <div class="value">
                        <asp:TextBox ID="tbPageTitle" runat="server" CssClass="width100"></asp:TextBox>
                    </div>
                    <div class="title">
                        <asp:Label ID="lMetaKeywords" runat="server" Text="#MetaKeywords#" meta:resourcekey="lMetaKeywords"></asp:Label>
                    </div>
                    <div class="value">
                        <asp:TextBox ID="tbMetaKeywords" runat="server" CssClass="width100"></asp:TextBox>
                    </div>
                    <div class="title">
                        <asp:Label ID="lMetaDescription" runat="server" Text="#MetaDescription#" meta:resourcekey="lMetaDescription"></asp:Label>
                    </div>
                    <div class="value">
                        <asp:TextBox ID="tbMetaDescription" runat="server" CssClass="width100"></asp:TextBox>
                    </div>
                </asp:Panel>
                <div class="title">
                    <asp:Label ID="lMenuDescription" runat="server" Text="#MenuDescription#" meta:resourcekey="lMenuDescription"></asp:Label>
                </div>
                <div class="value">
                    <asp:TextBox ID="tbMenuDescription" runat="server" CssClass="width100"></asp:TextBox>
                </div>
                <div class="title">
                    <asp:Label ID="lNote" runat="server" Text="#Note#" meta:resourcekey="lNote"></asp:Label>
                </div>
                <div class="value">
                    <asp:TextBox ID="tbNote" runat="server" CssClass="width100"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div id="dFButtons" runat="server" class="buttons float-right">
        <asp:Button CssClass="button btn btn-primary" ID="bSave" runat="server" Text="#Save#" meta:resourcekey="bSave"
            OnClick="bSave_Click" ValidationGroup="ErrorValidationGroup" ToolTip="#To save changes#" />
        <asp:Button CssClass="button btn btn-default" ID="bDelete" runat="server" Text="#Delete#" meta:resourcekey="bDelete"
            OnClick="bDelete_Click" ToolTip="#To delete this item#" />
        <asp:Button CssClass="button btn btn-default" ID="bCancel" runat="server" Text="#Cancel#" meta:resourcekey="bCancel"
            OnClick="bCancel_Click" ToolTip="#To cancel changes#" />
    </div>
    <div class="clear-both">
    </div>
</div>
