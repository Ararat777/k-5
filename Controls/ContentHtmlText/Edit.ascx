<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="i.LightSite.Web.Controls.ContentHtmlText.Edit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<div id="dPopupControl" runat="server" style="display: none" class="modalPanelPopup">
    <div class="editFileld">
        <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Visible="true" height="330px">
        </CKEditor:CKEditorControl>
        <asp:TextBox ID="tbEditor1" runat="server" Visible="false" TextMode="MultiLine" CssClass="EditorLight" Rows="5"></asp:TextBox>
    </div>
    <div class="bt-row editbuttons">
        <asp:Button ID="bSave" runat="server" Text="#Save#" meta:resourcekey="bSave" OnClick="bSave_Click" CssClass="btn btn-primary btn-sm"
            Visible="true" />
        <asp:Button ID="bCancel" runat="server" Text="#Cancel#" meta:resourcekey="bCancel"  CssClass="btn btn-default btn-sm"  
            OnClick="bCancel_Click" Visible="true" />
    </div>
</div>
<div style="visibility: hidden">
    <asp:LinkButton ID="FakeButton" runat="server" Text="Button" /></div>
<ajaxToolkit:ModalPopupExtender id="mpeEdit" runat="server" targetcontrolid="FakeButton"
    popupcontrolid="dPopupControl" backgroundcssclass="modalBackground" dropshadow="true" />