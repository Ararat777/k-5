<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="emDisplayInfo.ascx.cs"
    Inherits="i.LightSite.ExceptionManager.emDisplayInfo" EnableViewState="false" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions" %>
    <div id="divUserMessage" runat="server" visible="false" class="divUserMessageInfo">
    <div class="divUserMessageLabel">
        <div class="parent">
            <div class="child">
                <asp:Label ID="lUserMessage" runat="server"></asp:Label>
            </div>
            <div class="helper">
            </div>
        </div>
    </div>
   
</div>
