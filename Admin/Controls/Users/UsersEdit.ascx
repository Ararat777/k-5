<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UsersEdit.ascx.cs" Inherits="i.LightSite.SiteAdministration.Admin.Controls.Users.UsersEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxcontrol" %>
<%@ Register TagPrefix="contr" TagName="ucPageLanguagesControl" Src="~/Admin/Controls/PageLanguagesControl.ascx" %>
<div class="page-edit">
    <div class="content-edit">
        <div class="Padd10">
            <div id="divUserInformationBlock" runat="server" class="divUserInformationBlock">
                <table class="table">
                    <tr>
                        <td>
                            <asp:Label ID="lUserLoginDescr" runat="server" Text="#Login#" meta:resourcekey="lUserLogin"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbUserLogin" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserLogin" runat="server" ControlToValidate="tbUserLogin"
                                Display="None" ErrorMessage="#*#" meta:resourcekey="rfvUserLogin" ValidationGroup="vgEdtUser"></asp:RequiredFieldValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceUserLogin" targetcontrolid="rfvUserLogin"
                                popupposition="BottomLeft" />
                            <asp:RegularExpressionValidator ID="revUserLogin" runat="server" ControlToValidate="tbUserLogin"
                                Display="None" ErrorMessage="#*#" meta:resourcekey="revUserLogin" ValidationGroup="vgEdtUser"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceUserLogin1" targetcontrolid="revUserLogin"
                                popupposition="BottomLeft" />
                        </td>
                    </tr>
                    <tr runat="server" id="trPassword" visible="false">
                        <td>
                            <asp:Label ID="lPassword" runat="server" Text="#Password#" meta:resourcekey="lPassword"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPasswords" runat="server" ControlToValidate="tbPassword"
                                Display="None" ErrorMessage="#Password is required field#" meta:resourcekey="rfvPasswords"
                                ValidationGroup="vgEdtUser"></asp:RequiredFieldValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceUserPassword" targetcontrolid="rfvPasswords"
                                popupposition="BottomLeft" />
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="tbPassword"
                                Display="None" ErrorMessage="#*#" meta:resourcekey="revPassword" ValidationGroup="vgEdtUser"
                                ValidationExpression="[A-Za-z0-9_]{4,}"></asp:RegularExpressionValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceUserPassword1" targetcontrolid="revPassword"
                                popupposition="BottomLeft" />
                        </td>
                    </tr>
                    <tr runat="server" id="trConfirmPassword" visible="false">
                        <td>
                            <asp:Label ID="lConfirmPassord" runat="server" Text="#lConfirmPassord#" meta:resourcekey="lConfirmPassord"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvConfirmPassord" runat="server" ControlToValidate="tbConfirmPassword"
                                Display="None" ErrorMessage="#Confirm Password is required field#" meta:resourcekey="rfvConfirmPassord"
                                ValidationGroup="vgEdtUser"></asp:RequiredFieldValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceConfirmPassword" targetcontrolid="rfvConfirmPassord"
                                popupposition="BottomLeft" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lFirstName" runat="server" Text="#First Name#" meta:resourcekey="lFirstName"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="tbFirstName"
                                Display="None" ErrorMessage="#*#" meta:resourcekey="rfvFirstName" ValidationGroup="vgEdtUser"></asp:RequiredFieldValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceFirstName" targetcontrolid="rfvFirstName"
                                popupposition="BottomLeft" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lLastName" runat="server" Text="#Last Name#" meta:resourcekey="lLastName"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="tbLastName"
                                Display="None" ErrorMessage="#*#" meta:resourcekey="rfvLastName" ValidationGroup="vgEdtUser"></asp:RequiredFieldValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceLastName" targetcontrolid="rfvLastName"
                                popupposition="BottomLeft" />
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
                                <asp:HiddenField ID="hfTmpFileName" runat="server" />
                                <asp:HiddenField ID="hfOriginalFileName" runat="server" />
                            </div>
                            <div id="divChangePhoto" runat="server">
                                <asp:LinkButton ID="lbChangePhoto" runat="server" Text="#Change photo#" meta:resourcekey="lbChangePhoto"
                                    OnClick="lbChangePhoto_Click"></asp:LinkButton>
                            </div>
                            <div id="divUploadNewPhoto" runat="server" visible="false">
                                <div class="uploader">
                                    <asp:FileUpload ID="fuPhoto" runat="server" />
                                    <asp:Button ID="bUpload" runat="server" Text="#Upload#" CssClass="btn btn-default" meta:resourcekey="bUpload"
                                        OnClick="bUpload_Click" />
                                </div>
                                <asp:Button ID="bCancelNewUploading" runat="server" CssClass="btn btn-default" Text="#Cancel uploading#" meta:resourcekey="bCancelNewUploading"
                                    OnClick="bCancelNewUploading_Click" />
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lDiscount" runat="server" Text="#lDiscount#" meta:resourcekey="lDiscount"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbDiscount" runat="server"></asp:TextBox>
                            <span>%</span>
                            <asp:RangeValidator ID="rvDiscount" runat="server" ControlToValidate="tbDiscount"
                                Display="None" ErrorMessage="#Discount have to be double betwen 0 and 100#" MinimumValue="0"
                                MaximumValue="100" Type="Double" ValidationGroup="vgEdtUser" meta:resourcekey="rvDiscount">
                            </asp:RangeValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceDiscount" targetcontrolid="rvDiscount"
                                popupposition="BottomLeft" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lReceiveNewsNewProducts" runat="server" Text="#ReceiveNewsNewProducts#"
                                meta:resourcekey="lReceiveNewsNewProducts"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chbReceiveNewsNewProducts" runat="server"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lReceiveNewNews" runat="server" Text="#ReceiveNewNews#" meta:resourcekey="lReceiveNewNews"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chbReceiveNewNews" runat="server"></asp:CheckBox>
                        </td>
                    </tr>
                </table>
                <div id="divChangePassword" runat="server" visible="false">
                    <asp:LinkButton ID="lbShowChangePassword" runat="server" Text="#Change password#" meta:resourcekey="lbShowChangePassword"
                        OnClick="lbShowChangePassword_Click"></asp:LinkButton>
                </div>
            </div>
            <div id="dChangePassword" runat="server" visible="false" class="dChangePassword modalPanelPopup">
                <table class="table">
                    <tr>
                        <td>
                            <asp:Label ID="lNewPassword" runat="server" Text="#New password#" meta:resourcekey="lPassword"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbChangePassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="tbChangePassword"
                                Display="None" ErrorMessage="#Password is required field#" meta:resourcekey="rfvPasswords"
                                ValidationGroup="vgEdtUser"></asp:RequiredFieldValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceNewPassword" targetcontrolid="rfvNewPassword"
                                popupposition="BottomLeft" />
                            <asp:RegularExpressionValidator ID="revNewPassword" runat="server" ControlToValidate="tbChangePassword"
                                Display="None" ErrorMessage="#*#" meta:resourcekey="revPassword" ValidationGroup="vgEdtUser"
                                ValidationExpression="[A-Za-z0-9_]{4,}"></asp:RegularExpressionValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceNewPassword1" targetcontrolid="revNewPassword"
                                popupposition="BottomLeft" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lConfirmNewPassword" runat="server" Text="#Confirm new password#"
                                meta:resourcekey="lConfirmPassord"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbConfirmChangePassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvConfirmNewPAssword" runat="server" ControlToValidate="tbConfirmChangePassword"
                                Display="None" ErrorMessage="#Password is required field#" meta:resourcekey="rfvConfirmNewPAssword"
                                ValidationGroup="vgEdtUser"></asp:RequiredFieldValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceConfirmNewPAssword" targetcontrolid="rfvConfirmNewPAssword"
                                popupposition="BottomLeft" />
                            <asp:RegularExpressionValidator ID="revConfirmNewPAssword" runat="server" ControlToValidate="tbConfirmChangePassword"
                                Display="None" ErrorMessage="#*#" meta:resourcekey="revPassword" ValidationGroup="vgEdtUser"
                                ValidationExpression="[A-Za-z0-9_]{4,}"></asp:RegularExpressionValidator>
                            <ajaxcontrol:validatorcalloutextender runat="server" id="vceConfirmNewPAssword1"
                                targetcontrolid="revConfirmNewPAssword" popupposition="BottomLeft" />
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
            <div class="roles">
                <div class="title">
                    <asp:Label ID="lRolesTitle" runat="server" Text="#User roles#" meta:resourcekey="lRolesTitle"></asp:Label>
                </div>
                <div class="values">
                    <asp:CheckBoxList ID="chblUserRoles" runat="server" DataValueField="RoleID" DataTextField="Name">
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
    </div>
    <div class="buttons float-right">
        <asp:Button CssClass="button btn btn-primary" ID="bSave"  runat="server" Text="#Save#" meta:resourcekey="bSave"
            OnClick="bSave_Click" ValidationGroup="vgEdtUser" />
        <asp:Button CssClass="button btn btn-default" ID="bDelete" runat="server" Text="#Delete#" meta:resourcekey="bDelete"
            OnClick="bDelete_Click"  />
        <asp:Button CssClass="button btn btn-default" ID="bCancel" runat="server" Text="#Cancel#" meta:resourcekey="bCancel"
            OnClick="bCancel_Click" />
    </div>
    <div class="clear-both">
    </div>
</div>
