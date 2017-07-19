<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagesEditControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PagesEditControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxcontrol" %>
<%@ Register TagPrefix="contr" TagName="ucPageLanguagesControl" Src="~/Admin/Controls/PageLanguagesControl.ascx" %>
<script type="text/javascript">
    function Count(text, long) {
        var maxlength = new Number(long); // Change number to your max length. 
        var len = text.value.replace(/\n/g, "\n\r").length;
        if (len > maxlength) {
            text.value = text.value.substring(0, maxlength);
            alert(" Only " + long + " chars");
        }
    }
</script>
<div class="page-edit">
    <div class="header">
        <asp:Label ID="lPageEditControlHeader" runat="server" Text="#lPageEditControlHeader#"
            meta:resourcekey="lPageEditControlHeader"></asp:Label>
    </div>
    <div class="content-edit">
        <div class="Padd10">
            <div id="divAvtoFilling" runat="server" class="divAvtoFilling">
                <div class="title">
                    <asp:Label ID="lAutoFillingPageName" runat="server" Text="#Auto Filling Page Name#" meta:resourcekey="lAutoFillingPageName"></asp:Label>
                </div>
                <div class="value">
                    <asp:TextBox ID="tbAutoFillingPageName" runat="server" CssClass="width100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAutoFillingPageName" runat="server" ControlToValidate="tbAutoFillingPageName"
                        Display="None" ErrorMessage="#Auto Filling Page Name is required field#" ValidationGroup="vgAutoFilling"
                        meta:resourcekey="rfvAutoFillingPageName"></asp:RequiredFieldValidator>
                    <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceAutoFillingPageName"
                        TargetControlID="rfvAutoFillingPageName" PopupPosition="BottomLeft" />
                </div>
                <div class="value">
                    <asp:Button ID="bAutoFilling" CssClass="btn btn-default" runat="server" Text="#Auto filling#" meta:resourcekey="bAutoFilling"
                        ValidationGroup="vgAutoFilling" OnClick="bAutoFilling_Click" />
                </div>
            </div>
            <div class="title">
                <asp:Label ID="lPageCode" runat="server" Text="#PageCode#" meta:resourcekey="lPageCode"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbPageCode" runat="server" CssClass="width100" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvPageCode" ControlToValidate="tbPageCode" runat="server" ErrorMessage="#PageCode is required field!#"
                    meta:resourcekey="rfvPageCode"></asp:RequiredFieldValidator>
                <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vcePageCode" TargetControlID="rfvPageCode" PopupPosition="BottomLeft" />
            </div>
            <div class="title">
                <asp:Label ID="lPageFileName" runat="server" Text="#PageFileName#" meta:resourcekey="lPageFileName"></asp:Label>
                <asp:Label ID="lHelpPageFileName" runat="server" CssClass="help" meta:resourckey="lHelpPageFileName"></asp:Label>
            </div>
            <div class="value">
                <asp:DropDownList ID="ddlPageFileNames" runat="server" CssClass="width100">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvPageFileName" ControlToValidate="ddlPageFileNames" runat="server" ErrorMessage="#PageFileName is required field!#"
                    meta:resourcekey="rfvPageFileName"></asp:RequiredFieldValidator>
                <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vcePageFileName" TargetControlID="rfvPageFileName" PopupPosition="BottomLeft"/>
            </div>
            <div class="title">
                <asp:Label ID="lMenuForDisplay" runat="server" Text="#lMenuForDisplay#" meta:resourcekey="lMenuForDisplay"></asp:Label>
                <asp:Label ID="lHelpMenuForDisplay" runat="server" CssClass="help" meta:resourcekey="lHelpMenuForDisplay"></asp:Label>
            </div>
            <div class="value">
                <asp:DropDownList ID="ddlMenuForDisplay" runat="server" CssClass="width100">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvMenuForDisplay" ControlToValidate="ddlMenuForDisplay" runat="server" ErrorMessage="#MenuForDisplay is required field!#"
                    meta:resourcekey="rfvMenuForDisplay"></asp:RequiredFieldValidator>
                <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceMenuForDisplay" TargetControlID="rfvMenuForDisplay" PopupPosition="BottomLeft" />
            </div>
            <div class="title value">
                <asp:CheckBox ID="cbStartPage" CssClass="text-left" Text="#Is StartPage#" Enabled="false"
                    meta:resourcekey="cbStartPage" runat="server" />
                <asp:Label ID="lHelpStartPage" runat="server" CssClass="help" ToolTip="lHelpStartPage" meta:resourcekey="lHelpStartPage"></asp:Label>
            </div>
            <div class="title">
                <asp:Label ID="lSequenceNumber" runat="server" Text="#sequence number#" meta:resourcekey="lSequenceNumber"></asp:Label>
                <asp:Label ID="lHelpSequenceNumber" runat="server" CssClass="help" meta:resourcekey="lHelpSequenceNumber"></asp:Label>
            </div>
            <div class="value">
                <asp:TextBox ID="tbSequenceNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                    ID="rfvSequenceNumber" ControlToValidate="tbSequenceNumber" runat="server" ErrorMessage="#SequenceNumber is required field!#"
                    meta:resourcekey="revSequenceNumber"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revSequenceNumber" ControlToValidate="tbSequenceNumber"
                    ValidationGroup="ErrorValidationGroup" Display="None" ValidationExpression="\d+"
                    ErrorMessage="#SequenceNumber must be numeric digits" SetFocusOnError="true"
                    runat="server" meta:resourcekey="revSequenceNumber" />
                <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceSequenceNumber" TargetControlID="revSequenceNumber" PopupPosition="BottomLeft" />
                <ajaxcontrol:ValidatorCalloutExtender runat="server" ID="vceSequenceNumber2" TargetControlID="rfvSequenceNumber" PopupPosition="BottomLeft" />
            </div>
            <div class="title">
                <asp:Label ID="lParent" runat="server" Text="#Parent#" meta:resourcekey="lParent"></asp:Label>
                <asp:Label ID="lHelpParent" runat="server" CssClass="help" meta:resourckey="lHelpParent"></asp:Label>
            </div>
            <div class="value">
                <%--<asp:DropDownList ID="ddlParentPageCode" runat="server" CssClass="width100" DataValueField="Key"
                    DataTextField="Value">
                </asp:DropDownList>--%>

                <div id="divSelectingParentPageCode">
                    <asp:TextBox ID="tbSelecedParentPageCode" runat="server" ReadOnly="true" OnClick="ShowPagesTree()">
                    </asp:TextBox>
                    <asp:HiddenField ID="hfSelecedParentPage" runat="server" />
                    <div id="divPagesTree" runat="server" class="divPagesTree">
                        <asp:TreeView ID="tvPages" runat="server" OnSelectedNodeChanged="tvPages_SelectedNodeChanged">
                            <NodeStyle CssClass="node" />
                            <SelectedNodeStyle CssClass="node-sel" />
                        </asp:TreeView>
                    </div>
                </div>


            </div>
            <div style="display: none">
                <div class="title">
                    <asp:Label ID="lNote" runat="server" Text="#Note#" meta:resourcekey="lNote"></asp:Label>
                </div>
                <div class="value">
                    <asp:TextBox ID="tbNote" runat="server" Rows="3" CssClass="width100" TextMode="MultiLine"
                        onKeyUp="Count(this,200)" onChange="Count(this,200)"></asp:TextBox>
                </div>
            </div>
            <div class="language-control">
                <div class="border">
                    <contr:ucPageLanguagesControl ID="ucPageLanguages" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <div class="buttons float-right">
        <asp:Button CssClass="button btn btn-primary" ID="bSave"  runat="server" Text="#Save#" meta:resourcekey="bSave"
            OnClick="bSave_Click" ValidationGroup="ErrorValidationGroup" ToolTip="#To save changes#" />
        <asp:Button CssClass="button btn btn-default" ID="bDelete" runat="server" Text="#Delete#" meta:resourcekey="bDelete"
            OnClick="bDelete_Click" ToolTip="#To delete this item#" />
        <asp:Button CssClass="button btn btn-default" ID="bCancel" runat="server" Text="#Cancel#" meta:resourcekey="bCancel"
            OnClick="bCancel_Click" ToolTip="#To cancel changes#" />
    </div>
    <div class="clear-both">
    </div>
</div>
