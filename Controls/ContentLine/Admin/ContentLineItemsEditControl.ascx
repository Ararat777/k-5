<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineItemsEditControl.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineItemsEditControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="iLightSite" TagName="scFileManager" Src="~/Controls/scFileManager.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ContentLineGroups" Src="~/Controls/ContentLine/Admin/ContentLineGroups/ContentLineGroups.ascx" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web" %>
<script type="text/javascript">
    function validateSaveWithoutStartEditContent() {
        var isValid = false;
        try {
            isValid = Page_ClientValidate("ErrorValidationGroup");
            if (!isValid)
                return false;
        }
        catch (e) {

        }
        try {
            isValid = Page_ClientValidate("SaveWithoutStartEditContentGroup");
            if (!isValid)
                return false;
        }
        catch (e) { }

        return isValid;
    }

    function validateSaveAndStartEditContent() {
        var isValid = true;
        return isValid;
    }
</script>
<div class="panel panel-default">
    <div class="panel-heading">
        <asp:Label ID="lHeader" runat="server" Text="#Header#" meta:resourcekey="lHeader"></asp:Label>
    </div>
    <div class="panel-body">
        <div class="items-edit">
            <div class="header">
            </div>
            <asp:UpdatePanel ID="upPopupPanelEdit" runat="server">
                <triggers>
                    <asp:PostBackTrigger ControlID="bSelectFoto" />
                    <asp:PostBackTrigger ControlID="chURL" />
                </triggers>
                <contenttemplate>
                    <div class="content-edit">
                        <div class="edit-fields">
                          <table class="table">
                              <tr>
                                  <td> 
                                      <div class="bl_left_cl">
                                        <asp:Panel ID="pnFoto" CssClass="panel-cl photo float-left" GroupingText="#Foto:#" runat="server"
                                            meta:resourcekey="pnFoto" Width="174">
                                            <div class="photo-block">
                                                <asp:Image AlternateText="#no foto#" ID="imgContentFoto" meta:resourcekey="imgContentFoto"
                                                    runat="server" />
                                            </div>
                                            <div class="text-center red margin5">
                                                <asp:Label ID="lRecommendedSizeImage" CssClass="text-bold" runat="server" Text=""></asp:Label>
                                            </div>
                                            <div class="text-center margin5">
                                                <asp:Button ID="bSelectFoto" runat="server" Text="#SelectFoto#" meta:resourcekey="bSelectFoto" CssClass="btn btn-default btn-xs"
                                                    OnClick="bSelectFoto_Click" />
                                            </div>
                                            <div class="text-center margin5">
                                                <asp:Button ID="bClearFoto" OnClick="bClearFoto_OnClick" runat="server" Text="#ClearFoto#" CssClass="btn btn-default btn-xs"
                                                    meta:resourcekey="bClearFoto" />
                                                <asp:HiddenField ID="hfSelectedFotoURL" EnableViewState="true" runat="server" />
                                            </div>
                                        </asp:Panel>
                                    </div>
                                  </td>
                                  <td>
                                <div class="leftSide">
                                <div class="parameters">
                                    <div class="name">
                                        <asp:Label ID="lTitle" runat="server"  Text="#Title#" meta:resourcekey="lTitle"></asp:Label>
                                    </div>
                                 <div class="value">
                                        <asp:TextBox ID="tbTitle" runat="server" CssClass="form-control input-sm" MaxLength="500"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                                            ID="rfvTitle" ControlToValidate="tbTitle" runat="server" ErrorMessage="#Title is required field!#"
                                            meta:resourcekey="rfvTitle"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceTitle" TargetControlID="rfvTitle"
                                            PopupPosition="BottomLeft" />
                                    </div>
                                </div>
                                <div id="divDetailPage" runat="server" class="parameters inputLineWidth">
                                    <div class="name">
                                        <asp:Label ID="lURL" runat="server" Text="#Detalization page#"  meta:resourcekey="lURL"></asp:Label>
                                        <span style="margin-left:10px;">  <asp:CheckBox ID="chURL" AutoPostBack="true" Checked="false"  runat="server" OnCheckedChanged="chURL_OnCheckedChanged"
                                            Text="#Page of site#" meta:resourcekey="chURL" /></span>
                                    </div>
                                    <div class="value">
                                        <asp:TextBox ID="tbURL" runat="server" cssClass="form-control input-sm" Visible="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                                            ID="rfvURL" ControlToValidate="tbURL" runat="server" ErrorMessage="#Details page is required field!#"
                                            meta:resourcekey="rfvURL"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceURL" TargetControlID="rfvURL"
                                            PopupPosition="BottomLeft" />
                                        
                                        <%--<asp:DropDownList ID="ddlURL" Rows="10" CssClass="form-control input-sm" runat="server" OnSelectedIndexChanged="ddlURL_OnSelectedIndexChanged"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                            <asp:RegularExpressionValidator ID="revDllURL" ControlToValidate="ddlURL" ValidationGroup="SaveWithoutStartEditContentGroup"
                                            Display="None" ValidationExpression="^[1-9]+[0-9]*$" ErrorMessage="#For save with <New page> option, use 'Save and start edit content' #"
                                            SetFocusOnError="true" runat="server" meta:resourcekey="revDllURL"></asp:RegularExpressionValidator>
                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceRevDllURL" TargetControlID="revDllURL"
                                            PopupPosition="BottomLeft" />
                                        <asp:RangeValidator ID="rvDllURL" ControlToValidate="ddlURL" MinimumValue="0" MaximumValue="0"
                                            ValidationGroup="SaveAndStartEditContentGroup" Type="Integer" Display="None"
                                            SetFocusOnError="true" runat="server" ErrorMessage="#Only <New page> can be selected when use 'Save and start edit content' #"
                                            meta:resourcekey="rvDllURL"></asp:RangeValidator>
                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceRvDllURL" TargetControlID="rvDllURL"
                                            PopupPosition="BottomLeft" />--%>


                                        <div id="divSelectingParentPageCode" runat="server"  class="divSelectingParentPageCode">
                                            
                                            <asp:TextBox ID="tbSelecedParentPageCode" runat="server" CssClass="form-control input-sm" ReadOnly="true" OnClick="ShowPagesTree()">
                                            </asp:TextBox>
                                            <asp:HiddenField ID="hfSelecedParentPage" runat="server" />
                                            <%--<asp:TextBox ID="tbSelecedParentPageLanguageID" runat="server" Style="display:none"></asp:TextBox>--%>
                                            <div id="divPagesTree" runat="server" class="divPagesTree">
                                                <asp:TreeView ID="tvPages" runat="server" OnSelectedNodeChanged="tvPages_SelectedNodeChanged" AutoPostBack="true">
                                                    <NodeStyle CssClass="node" />
                                                    <SelectedNodeStyle CssClass="node-sel" />
                                                </asp:TreeView>
                                            </div>
                                        </div>
                                        <asp:CustomValidator ID="cvDllURL" runat="server" ErrorMessage="#For save with <New page> option, use 'Save and start edit content' #"
                                            ValidateEmptyText="true" ControlToValidate="tbSelecedParentPageCode" ClientValidationFunction="cvDllURL_ClientValidate"
                                            Display="None" ValidationGroup="SaveWithoutStartEditContentGroup" meta:resourcekey="revDllURL">
                                        </asp:CustomValidator>
                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceRevDllURL" TargetControlID="cvDllURL"
                                            PopupPosition="BottomLeft" />
                                        <%--<asp:CustomValidator ID="cvDllURL1" runat="server" ErrorMessage="#Only <New page> can be selected when use 'Save and start edit content' #"
                                            ValidateEmptyText="true" ControlToValidate="tbSelecedParentPageCode" ClientValidationFunction="cvDllURL_ClientValidate1"
                                            Display="None" ValidationGroup="SaveAndStartEditContentGroup" meta:resourcekey="revDllURL">
                                        </asp:CustomValidator>
                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceRvDllURL" TargetControlID="cvDllURL1"
                                            PopupPosition="BottomLeft" />--%>
                                    </div>
                                </div>
                                    <div class="into_divDetailPage well">
                                    <asp:label id="into_divDetailPage" runat="server" Text="#При создании новой публикации используйте настройки заданные по-умолчанию и нажмите кнопку «продолжить»#" meta:resourcekey="into_divDetailPage" ></asp:label>
                                    </div>
                                    <div class="clear"></div>
                                <div id="divDuplicateToControl" runat="server" visible="false" class="parameters divDuplicateToControl">
                                    <asp:CheckBox ID="chbDuplicateToControl" runat="server" Checked="false" />
                                </div>
                                <div class="parameters dates">
                                    <div class="value">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                     <span class="name">
                                                        <asp:Label ID="lDisplayDates" runat="server" Text="#Display#" meta:resourcekey="lDisplayDates"></asp:Label>
                                                    </span> 
                                                    <div class="period" style="display: inline-block;">
                                                    <div>
                                                        <asp:Label ID="lFrom" CssClass="text-bold" runat="server" Text="#from#" meta:resourcekey="lFrom"></asp:Label>
                                                        <asp:TextBox ID="tbPublishDate" CssClass="date form-control input-sm" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ValidationGroup="ErrorValidationGroup" Display="None"
                                                            ID="rfvPublishDate" ControlToValidate="tbPublishDate" runat="server" ErrorMessage="#Publish date is required field!#"
                                                            meta:resourcekey="rfvPublishDate"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vcePublishDate" TargetControlID="rfvPublishDate"
                                                            PopupPosition="BottomLeft" />
                                                        <asp:RegularExpressionValidator ID="revPublishDate" ControlToValidate="tbPublishDate"
                                                            runat="server" ValidationExpression="\d{2}/\d{2}/\d{4} \d{2}:\d{2}" ValidationGroup="ErrorValidationGroup"
                                                            Display="None" ErrorMessage="#Wrong format of publish date!#" meta:resourcekey="revPublishDate"></asp:RegularExpressionValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vcePublishDateEx" TargetControlID="revPublishDate"
                                                            PopupPosition="BottomLeft" />
                                                        <ajaxToolkit:CalendarExtender runat="server" TargetControlID="tbPublishDate" CssClass="calendar"
                                                            Format="dd/MM/yyyy HH:mm" PopupButtonID="ibPublishDate" FirstDayOfWeek="Monday" />
                                                        <asp:ImageButton ID="ibPublishDate" CssClass="icon" ImageUrl="~/Controls/ContentLine/Admin/Styles/Images/Calendar.png"
                                                            runat="server" />
                                                    </div>
                                                    <div id="divExpireDate" runat="server" class="float-left">
                                                        <asp:Label ID="lTo" CssClass="text-bold" runat="server" Text="#to#" meta:resourcekey="lTo"></asp:Label>
                                                        <asp:TextBox ID="tbExpireDate" CssClass="date" runat="server"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="revExpireDate" ControlToValidate="tbExpireDate"
                                                            runat="server" ValidationExpression="\d{2}/\d{2}/\d{4} \d{2}:\d{2}" ValidationGroup="ErrorValidationGroup"
                                                            Display="None" ErrorMessage="#Wrong format of expire date!#" meta:resourcekey="revExpireDate"></asp:RegularExpressionValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vceExpireDateEx" TargetControlID="revExpireDate"
                                                            PopupPosition="BottomLeft" />
                                                        <ajaxToolkit:CalendarExtender runat="server" TargetControlID="tbExpireDate" CssClass="calendar"
                                                            Format="dd/MM/yyyy HH:mm" PopupButtonID="ibExpireDate" FirstDayOfWeek="Monday" />
                                                        <asp:ImageButton ID="ibExpireDate" CssClass="icon" ImageUrl="~/Controls/ContentLine/Admin/Styles/Images/Calendar.png"
                                                            runat="server" />
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                </div>
                                                </td>
                                                <td>
                                                       <div style="display:inline-block">
                                                       <span> <asp:Label ID="lSequenceNumber" CssClass="text-bold" runat="server" Text="#SequenceNumber#"
                                                            meta:resourcekey="lSequenceNumber"></asp:Label></span>
                                                       <div style="display: inline-block;">
                                                            <asp:TextBox ID="tbSequenceNumber" CssClass="number form-control input-sm" runat="server"></asp:TextBox>
                                                        </div>
                                                       </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="sortDescription">
                                        <asp:Label ID="lSortDescription" runat="server" 
                                            Text="#Sort items in the list Number descending then date of publication descending#"
                                            meta:resourcekey="lSortDescription"></asp:Label>
                                    </div>
                                </div>
                                <div id="divContentLineGroups" runat="server" visible="false">
                                    <iLightSite:ContentLineGroups ID="ucContentLineGroups" runat="server">
                                    </iLightSite:ContentLineGroups>
                                </div>
                                    <asp:Panel id="pnItemLanguages" runat="server" CssClass="pnItemLanguages" GroupingText="#Create to languages:#" meta:resourcekey="pnItemLanguages">
                                    <asp:CheckBoxList ID="chblItemLanguages" runat="server" RepeatDirection="Vertical" 
                                        DataTextField="LangNativeName" DataValueField="LanguageID">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                                <div>
                                    <asp:Panel ID="pnDescription" CssClass="pnDescription" GroupingText="#Description:#"
                                        runat="server">
                                        <CKEditor:CKEditorControl ID="ckeDescription" runat="server" Visible="true">
                                        </CKEditor:CKEditorControl>
                                        <asp:TextBox ID="tbDescription" runat="server" Visible="false" TextMode="MultiLine"
                                            Rows="10" Width="99%"></asp:TextBox>
                                    </asp:Panel>
                                    <div class="clear">
                                    </div>
                                </div>
                                
                            </div>
                                  </td>
                              </tr>
                          </table>
                            <div>
                                <asp:Panel ID="pnAdditionalFields" runat="server" CssClass="additionalFields"
                                    GroupingText="#AdditionalFields:#" meta:resourcekey="pnAdditionalFields" Visible="false">
                                    <div class="name">
                                        <asp:Label ID="lAdditionalField1" runat="server" Text="#Additional Field 1:#" meta:resourcekey="lAdditionalField1"></asp:Label>
                                    </div>
                                    <div class="value">
                                        <asp:TextBox ID="tbAdditionalField1" runat="server" MaxLength="250"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>
                            <asp:Panel ID="pnNote" CssClass="panel" GroupingText="#Note:#" runat="server" meta:resourcekey="pnNote">
                                <asp:TextBox CssClass="tbNote" ID="tbNote" TextMode="MultiLine" Rows="2" runat="server"></asp:TextBox>
                            </asp:Panel>
                            <div class="clear"></div>
                        </div>
                    </div>
                </contenttemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="uprPopupPanelEdit" runat="server" AssociatedUpdatePanelID="upPopupPanelEdit">
                <progresstemplate>
                    <div class="editpopup-panel-progress">
                    </div>
                    <div class="editpopup-panel-progress-image">
                    </div>
                </progresstemplate>
            </asp:UpdateProgress>
        </div>
    </div>
    <div class="panel-footer">
        <div class="buttons text-right">
            <asp:Button CssClass="button btn btn-primary btn-sm" ID="bSaveAndStartEditContent" runat="server" Text="#SaveAndStartEditContent#"
                meta:resourcekey="bSaveAndStartEditContent" OnClick="bSaveAndStartEditContent_Click"
                OnClientClick="return validateSaveAndStartEditContent();"
                ToolTip="#To save changes and to close editing page#" Visible="false" />
            <asp:Button CssClass="button btn btn-primary btn-sm" ID="bSave" runat="server" Text="#Save#" meta:resourcekey="bSave"
                OnClick="bSave_Click" OnClientClick="return validateSaveWithoutStartEditContent();"
                ValidationGroup="ErrorValidationGroup" ToolTip="#To save changes and to close editing page#" />
            <asp:Button CssClass="button btn btn btn-default btn-sm" ID="bDelete" runat="server" Text="#Delete#" meta:resourcekey="bDelete"
                OnClick="bDelete_Click" ToolTip="#To delete this item and to close editing page#" />
            <asp:Button CssClass="button btn btn-default btn-sm" ID="bCancel" runat="server" Text="#Cancel#" meta:resourcekey="bCancel"
                OnClick="bCancel_Click" ToolTip="#To cancel changes and to close editing page#" />
        </div>
    </div>
</div>

<div id="dFileManagerPopupControl_ContentLineItemsEditControl" runat="server" style="display: none"
    class="modalPanelPopup PopupFileManager">
    <iLightSite:scFileManager ID="ucFileManager" runat="server" Visible="false" />
</div>
<div style="display: none">
    <asp:LinkButton ID="FakeButton_FileManager" runat="server" Text="Button" />
</div>
<ajaxToolkit:ModalPopupExtender ID="mpeFileManager" runat="server" TargetControlID="FakeButton_FileManager"
    PopupControlID="dFileManagerPopupControl_ContentLineItemsEditControl" BackgroundCssClass="modalBackground"
    DropShadow="true" />
<script type="text/javascript">
    function ControlMaxLength(text, maxLength, messageText) {
        var curLength = text.value.length
        if (curLength > maxLength) {
            $("#" + text.getAttribute("ID")).val(text.value.substr(0, maxLength));
            alert(messageText);
        }
    };

    $(document).click(function (event) {
        if (!$(event.target).closest('.divPagesTree, input[id*="tbSelecedParentPageCode"]').length) {
            $('.divPagesTree').removeClass('display');
        }
    });

    function ShowPagesTree() {
        $('.divPagesTree').addClass('display');
        $('.divPagesTree').css('width', $('input[id*="tbSelecedParentPageCode"]').width() + 'px');
    }

    function cvDllURL_ClientValidate(source, arguments) {
        var VAL = $("#<%= hfSelecedParentPage.ClientID %>").val();
        var email = new RegExp('^[1-9]+[0-9]*$');
        if (email.test(VAL)) {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    <%--function cvDllURL_ClientValidate1(source, arguments) {
        var value = parseInt($("#<%= hfSelecedParentPage.ClientID %>").val());
        alert(value);
        if (value == 0) {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }--%>
</script>
