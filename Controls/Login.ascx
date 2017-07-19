<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="i.LightSite.Web.Controls.Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControl" %>

<div id="divLogon" class="container">
    <script type="text/javascript">
        $(document).ready(function () {
            if ($('.validation-summary-errors').text() == 0) {
                $('.login__block .alert').css('display', 'none');
            };
        });

    </script>
    <style type="text/css">
        .panel-primary > .panel-heading {color: #ffffff;background-color: #0095b8;border-color: #0095b8;}
        .panel-primary {border-color: #0095b8;}
    </style>       
    <div id="divLoginField" runat="server" class="divLoginField">
        <asp:LoginView ID="lvLogin" runat="server">
            <LoggedInTemplate>
                <asp:HyperLink ID="hlMyProfile" runat="server" NavigateUrl="~/UserProfile.aspx">
                    <asp:LoginName ID="LoginName1" runat="server" />
                </asp:HyperLink>
                |
                <asp:LoginStatus ID="LoginStatus1" OnLoggingOut="LoginStatus1_LoggedOut" runat="server"
                    meta:resourcekey="LoginStatus1" />
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
    <div class="well-reg">
        <div>
            <%--<asp:Login ID="LoginUser" runat="server" DisplayRememberMe="false" CssClass="LoginUser" OnAuthenticate="LoginUser_Authenticate"
                OnLoggedIn="LoginUser_LoggedIn" meta:resourcekey="LoginUser">
            </asp:Login>--%>
            <asp:Login ID="LoginUser" runat="server" DisplayRememberMe="false" OnAuthenticate="LoginUser_Authenticate" RenderOuterTable="false" ViewStateMode="Disabled"
                OnLoggedIn="LoginUser_LoggedIn" meta:resourcekey="LoginUser" FailureTextStyle-CssClass="FailureTextStyle">
                <LayoutTemplate>
                    <div class="panel panel-primary">
                        <asp:label class="panel-heading" runat="server" meta:resourcekey="LogInForm" Text="#Log in Form#" ></asp:label>
                        <div class="login__block">
                            <div class="form-group">
                                <span class="glyphicon glyphicon-user"></span>
                                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="UserName" meta:resourcekey="LoginUserName" Text="#User name#" ></asp:Label>
                                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" placeholder="Login name" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" Display="Dynamic" ForeColor="Red" ErrorMessage="#The user name field is required.#" meta:resourcekey="loginErrorMessage" />
                            </div>
                            <div class="form-group">
                                <span class=" glyphicon glyphicon-log-in"></span>
                                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="Password" meta:resourcekey="LoginUserPassword" Text="#Password#" ></asp:Label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="Password" TextMode="Password" placeholder="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" Display="Dynamic" ForeColor="Red" ErrorMessage="#The password field is required.#" meta:resourcekey="passErrorMessage" />
                            </div>
                            <asp:Button runat="server" CssClass="btn btn-default btn-lg btn-block" CommandName="Login" Text="#Log in#" meta:resourcekey="LoginUserButton" />
                            <div class="alert alert-warning alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h5 class="validation-summary-errors">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </h5>
                            </div>
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:Login>
        </div>
        <div id="divbutton" runat="server" class="divbutton" visible="false">
            <asp:HyperLink ID="hlRegistration" runat="server" Text="#Regispration#" meta:resourcekey="hlRegistration"
                NavigateUrl="~/Registration.aspx"></asp:HyperLink>
            &nbsp;
            <asp:LinkButton ID="lbForgotPassword" runat="server" Text="# I forgot my password #"
                meta:resourcekey="lbForgotPassword" OnClick="lbForgotPassword_Click"></asp:LinkButton>
        </div>
    </div>
</div>
<div id="divForgotPassword" runat="server" visible="false">
    <table>
        <tr>
            <td>
                <asp:Label ID="lForgotPassword" runat="server" Text="# Enter your email: #" meta:resourcekey="lForgotPassword"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbUserEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserEmail" runat="server" ControlToValidate="tbUserEmail"
                    Display="None" ErrorMessage="#*#" meta:resourcekey="rfvUserEmail" ValidationGroup="vgForgotPassword"></asp:RequiredFieldValidator>
                <ajaxControl:ValidatorCalloutExtender runat="server" ID="vceUserEmail" TargetControlID="rfvUserEmail"
                    PopupPosition="BottomLeft" />
                <asp:RegularExpressionValidator ID="revUserEmail" runat="server" ControlToValidate="tbUserEmail"
                    Display="None" ErrorMessage="#*#" meta:resourcekey="revUserEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="vgForgotPassword"></asp:RegularExpressionValidator>
                <ajaxControl:ValidatorCalloutExtender runat="server" ID="vceUserEmail1" TargetControlID="revUserEmail"
                    PopupPosition="BottomLeft" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right">
                <div class="button">
                    <asp:LinkButton ID="lbGetNewPassword" runat="server" ValidationGroup="vgForgotPassword"
                        Text="# Continue #" meta:resourcekey="lbGetNewPassword" OnClick="lbGetNewPassword_Click"></asp:LinkButton>
                </div>
            </td>
        </tr>
    </table>
</div>
