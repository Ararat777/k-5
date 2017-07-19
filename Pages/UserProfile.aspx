<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true"
    CodeBehind="UserProfile.aspx.cs" Inherits="i.LightSite.Web.UserProfile" %>

<%@ Register TagPrefix="iLightSite" TagName="emDisplayInfo" Src="~/ExceptionManager/emDisplayInfo.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControl" %>

<%@ Register TagPrefix="iLightSite" TagName="ImageCropper" Src="~/Controls/ImageCropper/ImageCropper.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <div>
        <iLightSite:emDisplayInfo ID="emDisplayInfo" runat="server">
        </iLightSite:emDisplayInfo>
        <div class="clear">
        </div>
    </div>
    <div id="profileInfo">
        <div id="divProfileFields" runat="server" visible="false">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lUserLogin" runat="server" Text="#Login#" meta:resourcekey="lUserLogin"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lUserLoginValue" runat="server" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lFirstName" runat="server" Text="#First Name#" meta:resourcekey="lFirstName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="tbFirstName"
                            Display="None" ErrorMessage="#*#" meta:resourcekey="rfvFirstName" ValidationGroup="vgEdit"></asp:RequiredFieldValidator>
                        <ajaxControl:validatorcalloutextender runat="server" id="vceFirstName" targetcontrolid="rfvFirstName"
                            popupposition="BottomLeft" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lLastName" runat="server" Text="#Last Name#" meta:resourcekey="lLastName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lTelephone" runat="server" Text="#Telephone#" meta:resourcekey="lTelephone"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbTelephone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lGender" runat="server" Text="#Gender#" meta:resourcekey="lGender"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lPhoto" runat="server" Text="#Photo#" meta:resourcekey="lPhoto"></asp:Label>
                    </td>
                    <td>
                        <div id="divPhotoBlock" runat="server" visible="false">
                            <div id="userPhoto">
                                <asp:Image ID="imPhoto" runat="server" />
                            </div>
                        </div>
                        <div id="divChangePhoto" runat="server">
                            <asp:LinkButton ID="lbChangePhoto" runat="server" Text="#Change photo#" meta:resourcekey="lbChangePhoto"
                                OnClick="lbChangePhoto_Click"></asp:LinkButton>
                        </div>
                        <div id="divUploadNewPhoto" runat="server" visible="false">
                            <div class="uploader">
                                <iLightSite:ImageCropper ID="ucImageCropper" runat="server"></iLightSite:ImageCropper>
                                <asp:HiddenField ID="hfImageCropperFileName" runat="server" />
                                <asp:FileUpload ID="fuPhoto" runat="server" />
                                <asp:Button ID="bUpload" runat="server" Text="#Upload#" meta:resourcekey="bUpload"
                                    OnClick="bUpload_Click" />
                            </div>
                            <asp:Button ID="bCancelNewUploading" runat="server" Text="#Cancel uploading#" meta:resourcekey="bCancelNewUploading"
                                OnClick="bCancelNewUploading_Click" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:LinkButton ID="lbShowChangePassword" runat="server" Text="# Change Password #"
                            meta:resourcekey="lbShowChangePassword" CssClass="lbShowChangePassword"></asp:LinkButton>
                    </td>
                </tr>
                <tr id="trSendLastestProducts" runat="server" visible="false">
                    <td colspan="2">
                        <asp:CheckBox ID="chbSendLastestProducts" runat="server" Text="##" meta:resourcekey="chbSendNews" />
                    </td>
                </tr>
                <tr id="trSendLastestNews" runat="server" visible="false">
                    <td colspan="2">
                        <asp:CheckBox ID="chbSendLastestNews" runat="server" Text="#Send lastest news#" meta:resourcekey="chbSendLastestNews" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <div class="button">
                            <asp:LinkButton ID="lbSave" runat="server" Text="#Save#" ValidationGroup="vgEdit"
                                meta:resourcekey="bSave" OnClick="bSave_Click"></asp:LinkButton>
                        </div>
                    </td>
                </tr>
            </table>
            <div style="height: 0; overflow: hidden">
                <ajaxControl:ModalPopupExtender ID="mpeChangePassword" runat="server" TargetControlID="lbShowChangePassword"
                    PopupControlID="dChangePassword" BackgroundCssClass="modalBackground" DropShadow="true" />
                <div id="dChangePassword" runat="server" class="dChangePassword modalPanelPopup">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lOldPassword" runat="server" Text="#Old Password#" meta:resourcekey="lOldPassword"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="tbOldPassword"
                                    ValidationGroup="vgChangePassword" ErrorMessage="# Old password is required #"
                                    meta:resourcekey="rfvRequierField" Display="None"></asp:RequiredFieldValidator>
                                <ajaxControl:ValidatorCalloutExtender runat="server" ID="vceOldPassword" TargetControlID="rfvOldPassword"
                                    PopupPosition="BottomLeft" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lNewPassword" runat="server" Text="#New password#" meta:resourcekey="lNewPassword"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="tbNewPassword"
                                    ValidationGroup="vgChangePassword" ErrorMessage="# New password is required #"
                                    meta:resourcekey="rfvRequierField" Display="None"></asp:RequiredFieldValidator>
                                <ajaxControl:ValidatorCalloutExtender runat="server" ID="vceNewPassword" TargetControlID="rfvNewPassword"
                                    PopupPosition="BottomLeft" />
                                <asp:RegularExpressionValidator ID="revNewPassword" runat="server" ControlToValidate="tbNewPassword"
                                    Display="None" ErrorMessage="#*#" meta:resourcekey="PasswordRegularExpression"
                                    ValidationGroup="vgChangePassword" ValidationExpression="[A-Za-z0-9_]{4,}"></asp:RegularExpressionValidator>
                                <ajaxControl:ValidatorCalloutExtender runat="server" ID="vceNewPassword1" TargetControlID="revNewPassword"
                                    PopupPosition="BottomLeft" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lConfirmNewPassword" runat="server" Text="#Confirm new password#"
                                    meta:resourcekey="lConfirmNewPassword"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbConfirmNewPAssword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmNewPAssword" runat="server" ControlToValidate="tbConfirmNewPAssword"
                                    ValidationGroup="vgChangePassword" ErrorMessage="# Confirm new password is required #"
                                    meta:resourcekey="rfvRequierField" Display="None"></asp:RequiredFieldValidator>
                                <ajaxControl:ValidatorCalloutExtender runat="server" ID="vceConfirmNewPAssword" TargetControlID="rfvConfirmNewPAssword"
                                    PopupPosition="BottomLeft" />
                                <asp:RegularExpressionValidator ID="revConfirmNewPAssword" runat="server" ControlToValidate="tbNewPassword"
                                    Display="None" ErrorMessage="#*#" meta:resourcekey="PasswordRegularExpression"
                                    ValidationGroup="vgChangePassword" ValidationExpression="[A-Za-z0-9_]{4,}"></asp:RegularExpressionValidator>
                                <ajaxControl:ValidatorCalloutExtender runat="server" ID="vceConfirmNewPAssword1"
                                    TargetControlID="revConfirmNewPAssword" PopupPosition="BottomLeft" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <div class="button">
                                    <asp:LinkButton ID="lbChangePassword" runat="server" ValidationGroup="vgChangePassword"
                                        Text="#Save password#" meta:resourcekey="lbChangePassword" OnClick="lbChangePassword_Click"></asp:LinkButton>
                                    <asp:LinkButton ID="lbCancel" runat="server" Text="#Cancel#" meta:resourcekey="lbCancel"
                                        OnClick="lbCancel_Click"></asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="divNoUser" runat="server" visible="false">
        <asp:Label ID="lNoUser" runat="server" Text="#You are not logged in, first sign in to access the profile.#"
            meta:resourcekey="lNoUser"></asp:Label>
    </div>
</asp:Content>
