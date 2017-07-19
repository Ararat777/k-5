<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagesGridControl.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.PagesGridControl" %>
<script language="javascript" type="text/javascript">

    function SetVisibleFilterField(fields, searchIcon) {
        $("#" + fields).slideDown(1);
        $("#" + searchIcon).css("background-image", "url('../Admin/Styles/Images/sfMinus.GIF')");
    }
    
    function SearchFieldsShowHide(fields, searchIcon) {
        if ($("#" + fields).is(":hidden")) {
            $("#" + fields).slideDown(300);
            $("#" + searchIcon).css("background-image", "url('../Admin/Styles/Images/sfMinus.GIF')");
        } else {
            $("#" + fields).slideUp(300);
            $("#" + searchIcon).css("background-image", "url('../Admin/Styles/Images/sfPlus.GIF')");
        }
    }
</script>
<div class="pages">
    <div>
        <div class="float-left header">
            <asp:Label ID="lHeaderTitle" runat="server" Text="#HeaderTitle#" meta:resourcekey="lHeaderTitle"></asp:Label>
        </div>
        <%--<div class="float-right">
            <asp:DropDownList ID="ddlSystemLanguages" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSystemLanguages_OnSelectedIndexChanged">
            </asp:DropDownList>
        </div>--%>
        <div class="clear-both">
        </div>
    </div>
    <div class="content">
        <div class="search">
            <div id="header">
                <div id="searchIcon" class="float-left" onclick="SearchFieldsShowHide('fields', 'searchIcon');">
                </div>
                <div class="title">
                    <asp:Label ID="lSearchFieldsTitle" runat="server" Text="#SearchFieldsTitle#" meta:resourcekey="lSearchFieldsTitle"></asp:Label>
                </div>
            </div>
            <div id="fields">
                <table cellspacing="5" class="table">
                    <tr>
                        <td class="title">
                            <asp:Label ID="lPageTemplateSearchFilter" runat="server" Text="#Page template#" meta:resourcekey="lPageTemplateSearchFilter"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPageTemplateSearchFilter" runat="server" CssClass="form-control" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            <asp:Label ID="lSearchKeyWordField" runat="server" Text="#lSearchKeyWordField#"
                                meta:resourcekey="lSearchKeyWordField"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbSearchKeyWordSearchField" runat="server" CssClass="value form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right">
                            <asp:Button ID="bClearFilter" runat="server" Text="#Clear filter" CssClass="button btn btn-default" OnClick="bClearFilter_Click"
                                meta:resourcekey="bClearFilter" ToolTip="#Clear all fields of filter#" />
                            <asp:Button ID="bSearch" runat="server" Text="Search" CssClass="button btn btn-default" OnClick="bSearch_Click"
                                meta:resourcekey="bSearch" ToolTip="#Search of items in the set parametres#" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="buttons">
            <asp:LoginView ID="LoginView2" runat="server">
                <LoggedInTemplate>
                    <div>
                        <asp:Button ID="bAddTop" runat="server" Text="#Add#" meta:resourcekey="bAdd" CssClass="btn btn-default" OnClick="bAdd_Click"
                            ToolTip="#To add the new page#" />
                    </div>
                </LoggedInTemplate>
            </asp:LoginView>
        </div>
        <asp:GridView ID="gvPages" runat="server" CssClass="grid table" AutoGenerateColumns="False"
            DataKeyNames="PageID" AllowPaging="True" PageSize="25" GridLines="None" AllowSorting="True" EmptyDataText="#No Data#">
            <PagerSettings Mode="NumericFirstLast" FirstPageText="#First#" LastPageText="#Last#"
                PageButtonCount="10" />
            <HeaderStyle CssClass="header" />
            <RowStyle CssClass="rowe" />
            <AlternatingRowStyle CssClass="rowe-alt" />
            <SelectedRowStyle CssClass="rowe-sel" />
            <PagerStyle CssClass="pager" />
            <EmptyDataRowStyle CssClass="rowe-empty" />
            <Columns>
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:Button CssClass="button btn btn-default" ID="lbSelect" runat="server" Text="#Select#" meta:resourcekey="lbSelect" 
                            CommandName="Select" CommandArgument='<%# Eval("PageID") %>' ToolTip="#Choice of this item and close window with a choice of items#" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="#PageCode#" meta:resourcekey="GridColHeaderTextPageCode" SortExpression="PageCode">
                    <ItemTemplate>
                        <asp:Label ID="lPageCode" runat="server" Text='<%# Bind("PageCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="#MenuForDisplay#" meta:resourcekey="GridColHeaderTextMenuForDisplay"
                    DataField="MenuForDisplay" SortExpression="MenuForDisplay" />
                <asp:TemplateField HeaderText="#MenuDisplayName#" meta:resourcekey="GridColHeaderTextMenuDisplayName">
                    <ItemTemplate>
                        <asp:Label ID="lbMenuDisplayName" runat="server" Text='<%# Bind("MenuDisplayName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="#UrlPageName#" meta:resourcekey="GridColHeaderTextUrlPageName"
                    DataField="UrlPageName" />
                <asp:TemplateField HeaderText="#PageFileName#" meta:resourcekey="GridColHeaderTextPageFileName"
                    SortExpression="PageFileName">
                    <ItemTemplate>
                        <asp:Label ID="lTemplatePage" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="#ParentPageCode#" meta:resourcekey="GridColHeaderTextParentPageCode" SortExpression="ParentPageCode">
                    <HeaderStyle Width="150px"></HeaderStyle>
                    <ItemTemplate>
                        <asp:Label ID="lParentPageCode" runat="server" Text='<%# Bind("ParentPageCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField HeaderText="#StartPage#" meta:resourcekey="GridColHeaderTextStartPage"
                    SortExpression="StartPage" DataField="StartPage" ItemStyle-CssClass="text-center" HeaderStyle-Width="55px" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ibCopy" runat="server" CommandArgument='<%# Bind("PageID") %>'
                            meta:resourcekey="ibCopy" ImageUrl="~/Admin/Styles/Images/copy.gif" OnCommand="ibCopy_OnCommand" />
                    </ItemTemplate>
                    <ItemStyle Width="20px" CssClass="text-center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="20px" CssClass="text-center" />
                    <ItemTemplate>
                        <asp:ImageButton ID="ibEdit" runat="server" meta:resourcekey="GridColEditText" CommandName="Edit" ToolTip="#Edit#"
                            ImageUrl="~/Admin/Styles/Images/edit/pencil.png"/>
                    </ItemTemplate>
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
    </div>
    <div class="buttons">
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <div>
                    <asp:Button ID="bAdd" CssClass="btn btn-default" runat="server" Text="#Add#" meta:resourcekey="bAdd"
                        OnClick="bAdd_Click" ToolTip="#To add the new page#" />
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
    <div id="divIndexesButton" runat="server" class="divIndexesButton" visible="false">
        <asp:Label ID="lIndex" runat="server" Text="# index content#" meta:resourcekey="lIndex"></asp:Label>
        <asp:Button ID="bIndexAll" runat="server" CssClass="btn btn-default" Text=" # Index All # " 
            meta:resourcekey="bIndexAll" onclick="bIndexAll_Click" />
    </div>
    <div id="divLogo" runat="server" class="divLogo">
        <asp:Panel ID="pnLogo" runat="server" GroupingText="# Logo #" meta:resourcekey="pnLogo">
            <div class="logo">
                <asp:Image ID="imLogo" runat="server" />
            </div>
            <div class="uploadLogo">
                <asp:FileUpload ID="fuLogo" runat="server" />
                <asp:Button ID="bUpload" runat="server" CssClass="btn btn-default" Text="# Upload #" meta:resourcekey="bUpload"
                    OnClick="bUpload_Click" />
            </div>
            <div class="clear"></div>
        </asp:Panel>
    </div>
</div>
