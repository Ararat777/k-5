<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLineItemsViewControl.ascx.cs"
    Inherits="i.LightSite.ContentLine.Controls.ContentLine.ContentLineItemsViewControl" %>
<div class="items">
    <div class="panel panel-default">
          <div class="panel-heading">
        <asp:Label ID="lHeaderTitle" runat="server" Text="#HeaderTitle#" meta:resourcekey="lHeaderTitle"></asp:Label>
          </div>
  <div class="panel-body">
     <asp:LoginView ID="LoginView2" runat="server">
        <LoggedInTemplate>
            <div class="buttons">
                <asp:Button ID="bAdd" runat="server" Text="#Add#" meta:resourcekey="bAdd" OnClick="bAdd_Click" CssClass="btn btn-primary btn-sm"
                    ToolTip="#To add the new item to content line#" />
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
    <asp:GridView ID="gvContentLine" runat="server" CssClass="grid" ShowHeader="false"
        meta:resourcekey="gvContentLine" AutoGenerateColumns="False" DataKeyNames="ContentLineID"
        AllowPaging="True" AllowSorting="True" EmptyDataText="#No Data#">
        <PagerSettings Mode="NumericFirstLast" FirstPageText="#First#" LastPageText="#Last#"
            PageButtonCount="10" />
        <RowStyle CssClass="rowe" />
        <AlternatingRowStyle CssClass="rowe-alt" />
        <PagerStyle CssClass="pager" />
        <EmptyDataRowStyle CssClass="rowe-empty" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div>
                        <asp:Panel ID="pnFoto" CssClass="photo float-left" GroupingText="#Foto:#" runat="server"
                            meta:resourcekey="pnFoto">
                            <div class="photo-block">
                                <asp:Image AlternateText="#select foto#" ID="imgContentFoto" meta:resourcekey="imgContentFoto"
                                    runat="server" />
                            </div>
                        </asp:Panel>
                        <div class="left-block">
                            <asp:Panel ID="pnTitle" runat="server" GroupingText="#title#" meta:resourcekey="pnTitle" >
                                <asp:Label ID="lTitle" runat="server"></asp:Label>
                            </asp:Panel>
                            <div class="propertis">
                                <asp:Label CssClass="text-bold" ID="lDisplayDates" runat="server" Text="#Display#"
                                    meta:resourcekey="lDisplayDates"></asp:Label>
                                <asp:Label CssClass="text-bold" ID="lFrom" runat="server" Text="#from#" meta:resourcekey="lFrom"></asp:Label>
                                <asp:Label ID="lPublishDate" runat="server" Text="#Value#"></asp:Label>
                                <asp:Label CssClass="text-bold" ID="lTo" runat="server" Text="#to#" meta:resourcekey="lTo"
                                    Visible="false"></asp:Label>
                                <asp:Label ID="lExpireDate" runat="server" Text="#Value#" Visible="false"></asp:Label>
                            </div>
                            <div class="propertis">
                                <asp:Label CssClass="text-bold" ID="lSequenceNumber" runat="server" Text="#SequenceNumber#"
                                    meta:resourcekey="lSequenceNumber"></asp:Label>
                                <asp:Label ID="lSequenceNumberValue" runat="server" Text="#Value#"></asp:Label>
                            </div>
                            <div id="divGroupBlock" runat="server" visible="false" class="propertis">
                                <asp:Label CssClass="text-bold" ID="lGroup" runat="server" Text="#Group#"
                                    meta:resourcekey="lGroup"></asp:Label>
                                <asp:Label ID="lGroupValue" runat="server"></asp:Label>
                            </div>
                            <div class="propertis">
                                <asp:Label CssClass="text-bold" ID="lURL" runat="server" Text="#Detalization page#"
                                    meta:resourcekey="lURL"></asp:Label>
                                <asp:LinkButton ID="lbURL" Text="#Details#" runat="server" />
                            </div>
                            <div class="propertis">
                                <asp:Label CssClass="text-bold float-left" ID="lNote" runat="server" Text="#Note#"
                                    meta:resourcekey="lNote" Visible="false"></asp:Label>
                                <asp:Label ID="lNoteValue" runat="server" Visible="false"></asp:Label>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <asp:Panel ID="pnDescription" CssClass="panel-bt" GroupingText="#Description#" meta:resourcekey="pnDescription"
                        runat="server">
                        <asp:Literal ID="ltDescription" runat="server"></asp:Literal>
                    </asp:Panel>
                    <div class="buttons text-right">
                        <asp:Button ID="bEdit" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-default btn-sm"
                            Text="#Edit#" ToolTip="#To edit this item#" meta:resourcekey="bEdit"></asp:Button>
                        <asp:Button ID="bDelete" runat="server" Text="#Delete#" meta:resourcekey="bDelete" CssClass="btn btn-default btn-sm"
                            CommandName="Delete" ToolTip="#To delete this item#"></asp:Button>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <div class="buttons">
                <asp:Button ID="bAdd" runat="server" Text="#Add#" meta:resourcekey="bAdd" OnClick="bAdd_Click" CssClass="btn btn-primary btn-sm "
                    ToolTip="#To add the new item to content line#" />
            </div>
        </LoggedInTemplate>
    </asp:LoginView>

   
  </div>

   
</div>

    

</div>
