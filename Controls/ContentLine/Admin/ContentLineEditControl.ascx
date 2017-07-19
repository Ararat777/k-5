<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineEditControl.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineEditControl" %>
<%@ Register TagPrefix="iLightSite" TagName="ucContentLineItemsEditView" Src="~/Controls/ContentLine/Admin/ContentLineItemsEditViewControl.ascx" %>
<link type="text/css" href='<%= ResolveClientUrl("~/Controls/ContentLine/Admin/Styles/Styles.css") %>'
    rel="stylesheet" />
<div id="ContentLineEdit"  class="popup-panel hidden-popup-panel">
    <div class="dEditpopup-background">
    </div>
    <div class="dEditpopup-panel">
        <div class="row-bt editbuttons">
            <asp:Button ID="bCancel" runat="server" Text="#Close editing#" meta:resourcekey="bCancel" CssClass="btn btn-default btn-sm "
                OnClick="bCancel_Click" Visible="false" />   
           
        </div>
        <iLightSite:ucContentLineItemsEditView ID="ucContentLineItemsEditView" runat="server"  />
        
    </div>
</div>
