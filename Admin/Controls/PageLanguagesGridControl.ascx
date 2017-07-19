<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageLanguagesGridControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PageLanguagesGridControl" %>
<div class="languages">
    <div class="header">
        <asp:Label ID="lHeaderTitle" runat="server" Text="#HeaderTitle#" meta:resourcekey="lHeaderTitle"></asp:Label>
    </div>
    <asp:GridView ID="gvLangPages" GridLines="Both" runat="server" CssClass="grid" AutoGenerateColumns="False"
        DataKeyNames="PageLanguageID" AllowPaging="True" AllowSorting="True" EmptyDataText="#No Data#"
        OnRowDataBound="gvLangPages_RowDataBound">
        <PagerSettings Mode="NumericFirstLast" FirstPageText="#First#" LastPageText="#Last#"
            PageButtonCount="10" />
        <HeaderStyle CssClass="header" />
        <RowStyle CssClass="rowe" />
        <AlternatingRowStyle CssClass="rowe-alt" />
        <SelectedRowStyle CssClass="rowe-sel" />
        <PagerStyle CssClass="pager" />
        <EmptyDataRowStyle CssClass="rowe-empty" />
        <Columns>
            <asp:TemplateField>
                <ItemStyle Width="65px" CssClass="text-center" />
                <ItemTemplate>
                    <asp:HyperLink ID="hlViewPage" runat="server" meta:resourcekey="hlViewPage" Text="#View#"
                        Target="_blank"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Button CssClass="button btn btn-default" ID="lbSelect" runat="server" Text="#Select#" meta:resourcekey="lbSelect"
                        CommandName="Select" CommandArgument='<%# Eval("PageLanguageID") %>' ToolTip="#Choice of this item and close window with a choice of items#" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="#MenuDisplayName#" meta:resourcekey="GridColHeaderTextMenuDisplayName" SortExpression="MenuDisplayName" >
                <ItemTemplate>
                    <asp:Label ID="lMenuDisplayName" runat="server" Text='<%# Bind("MenuDisplayName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="#UrlPageName#" meta:resourcekey="GridColHeaderTextUrlPageName"
                DataField="UrlPageName" SortExpression="UrlPageName" />
            <asp:TemplateField HeaderText="#PageTitle#" meta:resourcekey="GridColHeaderTextPageTitle"
                SortExpression="PageTitle">
                <ItemTemplate>
                    <asp:Label ID="lPageTitle" runat="server" Text='<%# Bind("PageTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="#LangNativeName#" meta:resourcekey="GridColHeaderTextLangNativeName"
                DataField="LangNativeName" SortExpression="LangNativeName">
                <ItemStyle Width="100px" CssClass="text-center" />
            </asp:BoundField>
            <asp:CheckBoxField HeaderStyle-Width="76px" HeaderText="#DisplayPage#" meta:resourcekey="GridColHeaderTextLangDisplayPage"
                DataField="DisplayPage" SortExpression="DisplayPage" ItemStyle-CssClass="text-center" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ibEdit" runat="server" meta:resourcekey="GridColEditText" CommandName="Edit" ToolTip="#Edit#"
                            ImageUrl="~/Admin/Styles/Images/edit/pencil.png"/>
                </ItemTemplate>
                <ItemStyle Width="20px" CssClass="text-center" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" meta:resourcekey="lbDelete" CommandName="Delete"
                        ToolTip="#To delete this item#">
                        <asp:Image ID="imgDelete" runat="server" ImageUrl="~/Admin/Styles/Images/edit/delete.png" />
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="20px" CssClass="text-center" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <%--<div class="buttons">
                <asp:Button CssClass="button" ID="bAdd" runat="server" Text="#Add#" meta:resourcekey="bAdd"
                    OnClick="bAdd_Click" ToolTip="#To add the new item#" />
            </div>--%>
        </LoggedInTemplate>
    </asp:LoginView>
</div>
