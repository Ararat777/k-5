<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineItemsEditViewControl.ascx.cs" Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineItemsEditViewControl" %>
<%@ Register TagPrefix="contr" TagName="ucContentLineItemsEdit" Src="~/Controls/ContentLine/Admin/ContentLineItemsEditControl.ascx" %>
<%@ Register TagPrefix="contr" TagName="ucContentLineItemsView" Src="~/Controls/ContentLine/Admin/ContentLineItemsViewControl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControl" %>
<div>
   
    <contr:ucContentLineItemsView ID="ucContentLineItemsView" runat="server" Visible="true" />
         <contr:ucContentLineItemsEdit ID="ucContentLineItemsEdit" runat="server" Visible="false" />
</div>