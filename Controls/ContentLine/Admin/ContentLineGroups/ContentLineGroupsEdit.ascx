<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineGroupsEdit.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.Admin.ContentLine.ContentLineGroups.ContentLineGroupsEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControl" %>
<div class="dEditpopup-background">
</div>
<div class="dEditpopup-panel">
    <div id="contentLine-groups-edit">
        <div class="items-edit">
            <div class="buttons text-right">
                <asp:Button CssClass="button" ID="bCancel" runat="server" Text="#Cancel#" meta:resourcekey="bCancel"
                    OnClick="bCancel_Click" ToolTip="#To cancel changes and to close editing page#" />
            </div>
            <asp:UpdatePanel ID="upPopupPanelEdit" runat="server">
                <ContentTemplate>
                    <div class="header">
                        <asp:Label ID="lGalleryImgGroupEditHeader" runat="server" Text="# edit image groups #"
                            meta:resourcekey="lGalleryImgGroupEditHeader"></asp:Label>
                    </div>
                    <div class="content-edit">
                        <div class="groups-tree float-left">
                            <asp:Panel ID="pGroupTree" runat="server" meta:resourcekey="pGroupTree" GroupingText="#ImageGroup#" CssClass="contentLineGroupList">
                                <asp:Repeater ID="rpGroups" runat="server" OnItemDataBound="rpGroups_ItemDataBound">
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr class="<%# GetRowStyleClass() %>">
                                            <td>
                                                <asp:Label ID="lName" runat="server" Text='<%# Eval("Name") %>' ></asp:Label>
                                            </td>
                                            <td class="buttonsColumn">
                                                <asp:ImageButton ID="ibEdit" runat="server" CommandArgument='<%# Eval("ContentLineGroupID") %>'
                                                    ImageUrl="~/Controls/ContentLine/Admin/Styles/Images/pencil.png"
                                                    AlternateText="#Edit#" meta:resourcekey="ibEdit" ToolTip="#to delete this item#"
                                                    OnCommand="ibEdit_Command" />
                                                <asp:ImageButton ID="ibDelete" runat="server" CommandArgument='<%# Eval("ContentLineGroupID") %>'
                                                    ImageUrl="~/Controls/ContentLine/Admin/Styles/Images/delete.png"
                                                    AlternateText="#Delete#" meta:resourcekey="ibDelete" ToolTip="#to delete this item#" 
                                                    OnCommand="ibDelete_Command"/>
                                            </td>
                                        </tr>    
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                        </div>
                        <div class="groups-edit-fields">
                            <asp:Panel ID="pFieldsEdit" runat="server" meta:resourcekey="pFieldsEdit" GroupingText="#Edit fields#">
                                <div class="name">
                                    <asp:Label ID="lGroupName" runat="server" Text="#Group name#" meta:resourcekey="lGroupName"></asp:Label>
                                </div>
                                <div class="value">
                                    <asp:TextBox ID="tbGroupName" runat="server" CssClass="width600" MaxLength="500"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNewImgGroupName" runat="server" ControlToValidate="tbGroupName"
                                        ErrorMessage="#Required field#" Display="None" ValidationGroup="vgEdigContentLineGroup"
                                        meta:resourcekey="rfvNewImgGroupName"></asp:RequiredFieldValidator>
                                    <ajaxControl:validatorcalloutextender runat="server" id="vceNewImgGroupName" targetcontrolid="rfvNewImgGroupName"
                                        PopupPosition="BottomLeft" />
                                </div>
                                <div class="name">
                                    <asp:Label ID="lGroupDesc" runat="server" Text="#Description#" meta:resourcekey="lGroupDesc"></asp:Label>
                                </div>
                                <div class="value ckeEditor">
                                    <asp:TextBox ID="tbDescription" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                                <div class="name">
                                    <asp:Label ID="lSequenceNumber" runat="server" Text="#Sequence number#" meta:resourcekey="lSequenceNumber"></asp:Label>
                                </div>
                                <div class="value">
                                    <asp:TextBox ID="tbSequenceNumber" runat="server" CssClass="width155"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSequenceNumber" runat="server" ControlToValidate="tbSequenceNumber"
                                        ErrorMessage="#Required field#" Display="None" ValidationGroup="vgEdigContentLineGroup"
                                        meta:resourcekey="rfvSequenceNumber"></asp:RequiredFieldValidator>
                                    <ajaxControl:validatorcalloutextender runat="server" id="vceSequenceNumber" targetcontrolid="rfvSequenceNumber"
                                        PopupPosition="BottomLeft" />
                                    <%--<asp:RegularExpressionValidator ID="revSequenceNumber" runat="server" ControlToValidate="tbSequenceNumber"
                                        ErrorMessage="#Sequence number must be integer.#" Display="None" ValidationGroup="vgEdigContentLineGroup"
                                        meta:resourcekey="revSequenceNumber" ValidationExpression="([\d])+"></asp:RegularExpressionValidator>--%>
                                    <asp:RangeValidator ID="rvSequenceNumber" runat="server" ControlToValidate="tbSequenceNumber"
                                        ErrorMessage="#Sequence number must be integer.#" Display="None" ValidationGroup="vgEdigContentLineGroup"
                                        meta:resourcekey="rvSequenceNumber" Type="Integer" MinimumValue="0" MaximumValue="1000"></asp:RangeValidator>
                                    <ajaxControl:validatorcalloutextender runat="server" id="vceSequenceNumber1" targetcontrolid="rvSequenceNumber"
                                        PopupPosition="BottomLeft" />
                                </div>
                                <div class="status">
                                    <asp:Label ID="lStatus" runat="server" Text="" ViewStateMode="Disabled"></asp:Label>
                                </div>
                                <div class="dControlButtons">
                                    <asp:Button ID="bSave" runat="server" Text="#Save#" meta:resourcekey="bSave" OnClick="bSave_Click"
                                        ValidationGroup="vgEdigContentLineGroup" />
                                    <asp:Button ID="bCancelEditing" runat="server" Text="#Cancel#" meta:resourcekey="bCancelEditing"
                                        OnClick="bCancelEditing_Click" />
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="uprogEditProduct" runat="server" AssociatedUpdatePanelID="upPopupPanelEdit">
                <ProgressTemplate>
                    <div class="editpopup-panel-progress">
                    </div>
                    <div class="editpopup-panel-progress-image">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</div>
