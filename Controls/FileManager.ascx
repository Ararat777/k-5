<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileManager.ascx.cs"
    Inherits="i.LightSite.Web.Controls.FileManager" %>

<style type="text/css">
    #FileMenadger{width:1170px;font-size:12px;font-family:arial, sans-serif;margin:0 15px;}
    #FileMenadger span, #FileMenadger label{font-weight:normal;font-style:normal;font-family:Arial, Sans-Serif;font-size:12px;background-color:transparent}
    #FileMenadger a, #FileMenadger a:visited, #FileMenadger a:hover{color:Blue;font-size:12px;text-decoration:uhderline;font-style:normal;background-color:transparent;cursor:pointer}
    #FileMenadger a:active{color:red;cursor:pointer}
    #FileMenadger a img{border:none;}
    #FileMenadger .clear{clear:both}
    #FileMenadger .text-left{text-align:left}
    #FileMenadger .text-center{text-align:center}
    #FileMenadger .text-right{text-align:right}
    #FileMenadger .float-left{float:left}
    #FileMenadger .header{margin:10px 0 10px 0;height:20px;background:none}
    #FileMenadger .header span{text-transform:uppercase;font-weight:900;color:#6c6c6a;}
    #FileMenadger .content{background-color:#edf5ff;border:1px solid #808080;padding:3px 5px}
    #FileMenadger #up-part{padding:5px}
    #FileMenadger #dow-npart{padding:0 5px;}
    #FileMenadger #up-part .current-directory{width:590px;margin:0}
    #FileMenadger #up-part .up-panel{height:32px;margin-left:10px}
    #FileMenadger #up-part .up-panel .padding{padding-top:4px}
    #FileMenadger #up-part .current-directory .up-panel .padding{overflow-x:auto;width:550px;white-space:nowrap;}
    #FileMenadger #up-part .load-image{width:458px;margin:0}
    #FileMenadger fieldset{margin:0}
    #FileMenadger #directory-tree{float: left;width:367px}
    #FileMenadger #directory-tree .tree{height:351px;overflow:scroll;width:345px;}
    #FileMenadger #directory-tree .node{color:Blue;background:none;font-size:12px;}
    #FileMenadger #directory-tree .node-sel{color:White;background-color:#527de5}
    #FileMenadger .buttons{padding:5px 0 0 0}
    #FileMenadger .buttons .button{margin:0 5px;}
    #FileMenadger #file-view{float: left;width:680px}
    #FileMenadger #file-view .File-block{min-height: 170px;border: 1px solid gray;margin:0 3px 11px 0;width:100%}
    #FileMenadger #file-view .files{height: 360px;overflow-x:auto;position:relative}
    #FileMenadger #file-view .files .gridRow{background-color:#F5F5F5;border:1px solid silver}
    #FileMenadger #file-view .files .gridAltRow{background-color:#F0FFFF;border:1px solid silver}
    #FileMenadger #file-view .files .gridRow td, #FileMenadger #file-view .files .gridAltRow td{padding:3px;}
    #FileMenadger #file-view .files .fileManeFields span{font-weight:bold;font-size:14px;}
    #FileMenadger #file-view .select input{margin:0}
    #FileMenadger #file-view .image-name{width: 140px;padding:0 5px;-ms-word-wrap:break-word; word-wrap:break-word;font-size:12px;}
    #FileMenadger #file-view #status{width: 370px;height:15px}
    #didCreateFolderDialog .dialog-panel{background:#fff;border-radius:5px;z-index:901 !important}
    #didCreateFolderDialog .dislog-body, #didCreateFolderDialog .dialog-title, #didCreateFolderDialog .dialog-footer{padding:15px}
    #didCreateFolderDialog .dialog-title{background:#909090;border-radius:5px;margin:2px}
    #didCreateFolderDialog .dialog-title span{color:#fff;font-weight:bold}
    #didCreateFolderDialog .dialog-footer{text-align:center}
    #didCreateFolderDialog .dialog-footer a{text-decoration:none;border-radius:5px;border:1px solid #464646;padding:7px 10px;background:#D0D0D0;color:#464646}
</style>
<script type="text/javascript">
    function displayCreateDirectoryDialog() {
        $("#didCreateFolderDialog").css('display', 'block');
        $("div.dialog-panel").center();
    }

    function hideCreateDirectoryDialog() {
        $("#didCreateFolderDialog").css('display', 'none');
        $('#' + '<%= tbNewFolderName.ClientID %>').val('');
        $('#' + '<%= revalNewFolderName.ClientID %>').css('display', 'none');
        $('#' + '<%= reqFieldNewFolderName.ClientID %>').css('display', 'none');
    }

    function bDeleteDirectoryClientClick() {
        return confirm($('#' + '<%= hfDelDirMessageText.ClientID %>').val() + ' ' + $('#' + '<%= hfCurrentDirectory.ClientID %>').val() + ' ?');
    }
    function divImageFileOnClick(sender) {
        $('.files').find(':checkbox').each(function () {
            $(this).prop('checked', false);
        });
        $(sender).find(':checkbox').prop("checked", true);
    }
</script>
<div id="didCreateFolderDialog" style="display:none" class="dialog-panel">
    <div class="dEditpopup-background">
    </div>
    <div class="dialog-panel">
        <div class="dialog-title">
            <asp:Label ID="lTitle" runat="server" Text="#Title#" meta:resourcekey="lTitle"></asp:Label>
        </div>
        <div class="dislog-body">
            <div>
                <asp:Label ID="lNewFolderName" runat="server" Text="#lNewFolderName#" meta:resourcekey="lNewFolderName">
                </asp:Label>
                <asp:TextBox ID="tbNewFolderName" runat="server" ValidationGroup="vgNewFolderName"></asp:TextBox>
            </div>
            <div>
                <asp:RegularExpressionValidator ID="revalNewFolderName" ValidationGroup="vgNewFolderName"
                    runat="server" Display="Dynamic" ControlToValidate="tbNewFolderName" ForeColor="Red"
                    ErrorMessage="#revalNewFolderName#" ValidationExpression="[a-zA-Z0-9_]*$" meta:resourcekey="revalNewFolderName"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="reqFieldNewFolderName" ValidationGroup="vgNewFolderName"
                    runat="server" Display="Dynamic" ControlToValidate="tbNewFolderName" ForeColor="Red"
                    ErrorMessage="#reqFieldNewFolderName#" meta:resourcekey="reqFieldNewFolderName"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="dialog-footer">
            <asp:LinkButton ID="lbCreateDirectory" runat="server" Text="#OK#" meta:resourcekey="lbCreateDirectory"
                OnClick="bNewDirectory_Click" ValidationGroup="vgNewFolderName"></asp:LinkButton>
            <asp:LinkButton ID="lbCancelCreateDirectory" runat="server" Text="#Cancel#" meta:resourcekey="lbCancelCreateDirectory"
                OnClientClick="hideCreateDirectoryDialog(); return false;"></asp:LinkButton>
        </div>
    </div>
</div>
<div id="FileMenadger" class="4">
    <div class="header">
        <asp:Label ID="lHeader" runat="server" Text="# Images menager #" meta:resourcekey="lHeader"></asp:Label>
    </div>
    <div class="content">
        <div id="up-part">
            <div class="float-left current-directory">
                <asp:Panel ID="pnCurDir" runat="server" GroupingText="#Current directory#" meta:resourcekey="pnCurDir">
                    <div class="up-panel">
                        <div class="padding">
                            <asp:Label CssClass="float-left" ID="lSelectCurDirText" runat="server"></asp:Label>
                            <asp:Label ID="lCurrentDirectory" runat="server" Text=""></asp:Label>
                            <asp:HiddenField ID="hfCurrentDirectory" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="float-left load-image">
                <asp:Panel ID="pnUpload" runat="server" GroupingText="#Upload file#" meta:resourcekey="pnUpload">
                    <div class="up-panel">
                        <div class="padding">
                            <asp:FileUpload ID="flupUploadFile" runat="server" />
                            <asp:Button ID="bUploadFile" runat="server" Text="#bUploadFile#" meta:resourcekey="bUploadFile"
                                OnClick="ButtonUploadFileClick" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="clear">
            </div>
        </div>
        <div id="dow-npart">
            <div id="directory-tree">
                <asp:Panel ID="pnFolders" runat="server" GroupingText="#Folders#" meta:resourcekey="pnFolders">
                    <div class="tree">
                        <asp:TreeView ID="trvDirectoryStructure" runat="server" OnSelectedNodeChanged="TreeViewDirectoryStructureSelectedNodeChanged"
                            SelectedNodeStyle-BackColor="Highlight" SelectedNodeStyle-ForeColor="HighlightText">
                            <NodeStyle CssClass="node" />
                            <SelectedNodeStyle CssClass="node-sel" />
                        </asp:TreeView>
                    </div>
                    <div class="buttons text-center">
                        <%--<asp:Button ID="bNewDirectory" runat="server" Text="#bNewDirectory#" meta:resourcekey="bNewDirectory"
                            OnClientClick="bNewDirectoryClick(); return false;" OnClick="bNewDirectory_Click"
                            CssClass="button" />--%>
                        <asp:Button ID="bNewDirectory" runat="server" Text="#bNewDirectory#" meta:resourcekey="bNewDirectory"
                            OnClientClick="displayCreateDirectoryDialog(); return false;" CssClass="button" />
                        <asp:HiddenField ID="hfNewDirectoryName" runat="server" />
                        <asp:Button ID="bDeleteDirectory" runat="server" Text="#bDeleteDirectory#" meta:resourcekey="bDeleteDirectory"
                            OnClick="bDeleteDirectory_Click" OnClientClick="return bDeleteDirectoryClientClick();"
                            CssClass="button" />
                        <asp:HiddenField ID="hfDelDirMessageText" runat="server" />
                    </div>
                </asp:Panel>
            </div>
            <div id="file-view">
                <asp:Panel ID="pnFiles" runat="server" GroupingText="#Files#" meta:resourcekey="pnFiles">
                    <div class="files">
                        <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="false" GridLines="None"
                            ShowHeader="false" onrowdatabound="gvFiles_RowDataBound" Width="100%">
                            <AlternatingRowStyle CssClass="gridAltRow" />
                            <RowStyle CssClass="gridRow" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chBoxSelectFile" class="select" runat="server" onclick="divImageFileOnClick(this);" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="fileInfo">
                                            <div class="fileManeFields">
                                                <asp:Label ID="lFileNameField" runat="server" meta:resourcekey="lFileNameField"></asp:Label>
                                                <asp:Label ID="lFileName" runat="server"></asp:Label>
                                            </div>
                                            <div class="row">
                                                <asp:Label ID="lFileSize" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <%--<asp:ImageButton ID="ibAddLink" runat="server" ImageUrl="~/StyleSheets/Images/AddLinks.png" CssClass="addlink" 
                                            AlternateText="#insert link#" ToolTip="#insert link#" OnCommand="ibAddLink_OnCommand" Visible="true" Width="16" Height="16"  meta:resourcekey="ibAddLink"/>--%>
                                        <asp:ImageButton ID="ibDelete" class="delete" runat="server" ImageUrl="~/StyleSheets/Images/delete2.png"
                                                AlternateText="Delete" ToolTip="Delete" OnClick="ibDelete_Click" Visible="true" Width="16" Height="16" meta:resourcekey="ibDelete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="status" class="float-left text-left">
                        <asp:Label ID="lStatus" EnableViewState="false" runat="server"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="buttons">
        <div class="text-right">
            <asp:Button ID="bOK" runat="server" Text="#bOK#" OnClick="bOK_Click"  meta:resourcekey="bOK"
                CssClass="button" />
            <asp:Button ID="bCancel" runat="server" Text="#bCancel#" meta:resourcekey="bCancel"
                OnClick="bCancel_Click" />
        </div>
    </div>
</div>
