<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageData.ascx.cs" Inherits="i.LightSite.SiteAdministration.Admin.Controls.PageData" %>
<%@ Register TagPrefix="iLightSite" TagName="ucPageDataEditControl" Src="~/Admin/Controls/PageData/PageDataEditControl.ascx" %>
<%@ Register TagPrefix="iLightSite" TagName="ucPageDataViewControl" Src="~/Admin/Controls/PageData/PageDataViewControl.ascx" %>
<div class="pageitem">
    <iLightSite:ucPageDataEditControl ID="ucPageDataEditControl" runat="server" Visible="false" />
    <iLightSite:ucPageDataViewControl ID="ucPageDataViewControl" runat="server" Visible="true" />
</div>
