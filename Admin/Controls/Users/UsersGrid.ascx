<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UsersGrid.ascx.cs"
    Inherits="i.LightSite.SiteAdministration.Admin.Controls.Users.UsersGrid" %>
<div class="users">
    <div class="content">
        <asp:GridView ID="gvUsers" runat="server" CssClass="grid table" AutoGenerateColumns="False"
            DataKeyNames="UserID" AllowPaging="True" PageSize="25" GridLines="None" AllowSorting="True" EmptyDataText="#No Data#">
            <PagerSettings Mode="NumericFirstLast" FirstPageText="#First#" LastPageText="#Last#"
                PageButtonCount="10" />
            <HeaderStyle CssClass="header" />
            <RowStyle CssClass="rowe" />
            <AlternatingRowStyle CssClass="rowe-alt" />
            <SelectedRowStyle CssClass="rowe-sel" />
            <PagerStyle CssClass="pager" />
            <EmptyDataRowStyle CssClass="rowe-empty" />
            <Columns>
                <asp:BoundField HeaderText="#ID#" meta:resourcekey="GridColHeaderTextID" DataField="UserID"
                    SortExpression="UserID" />
                <asp:BoundField HeaderText="#Login#" meta:resourcekey="GridColHeaderTextLogin"
                    DataField="Login" SortExpression="Login" />
                <asp:BoundField HeaderText="#FirstName#" meta:resourcekey="GridColHeaderTextFirstName"
                    DataField="FirstName" SortExpression="FirstName" />
                <asp:BoundField HeaderText="#LastName#" meta:resourcekey="GridColHeaderTextLastName"
                    DataField="LastName" SortExpression="LastName" />
                <asp:BoundField HeaderText="#Email#" meta:resourcekey="GridColHeaderTextEmail"
                    DataField="Email" SortExpression="Email" />
                <asp:CheckBoxField HeaderText="#SysAdmin#" meta:resourcekey="GridColHeaderTextSysAdmin"
                    DataField="SysAdmin" SortExpression="SysAdmin" ItemStyle-CssClass="text-center" ItemStyle-Width="80px" />
                <asp:CheckBoxField HeaderText="#ValidatedEmail#" meta:resourcekey="GridColHeaderTextValidatedEmail"
                    DataField="ValidatedEmail" SortExpression="ValidatedEmail" ItemStyle-CssClass="text-center" ItemStyle-Width="80px" />
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
                        OnClick="bAdd_Click" ToolTip="#To add the new user#" />
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</div>
