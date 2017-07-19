<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="scFileManager.ascx.cs"
    Inherits="i.LightSite.Web.Controls.scFileManager" %>

<style type="text/css">
    #FileMenadger{font-size:12px;font-family:arial, sans-serif; width:1200px;}
    #FileMenadger span, #FileMenadger label{font-weight:normal;font-style:normal;font-family:Arial, Sans-Serif;font-size:12px;background-color:transparent}
    #FileMenadger a, #FileMenadger a:visited, #FileMenadger a:hover{color:Blue;font-size:12px;text-decoration:underline;font-style:normal;background-color:transparent;cursor:pointer}
    #FileMenadger a:active{color:red;cursor:pointer}
    #FileMenadger a img{border:none;}
    #FileMenadger .clear{clear:both}
    #FileMenadger .text-left{text-align:left}
    #FileMenadger .text-center{text-align:center}
    #FileMenadger .text-right{text-align:right}
    #FileMenadger .float-left{float:left}
    #FileMenadger .header{text-transform:uppercase;font-weight:900;margin:10px 0 10px 0;color:#6c6c6a;height:20px;background:none}
    #FileMenadger #up-part{padding:5px}
    #FileMenadger #dow-npart{padding:0 5px;}
    #FileMenadger #up-part .current-directory{width:590px;margin:0}
    #FileMenadger #up-part .up-panel{height:32px;margin-left:10px}
    #FileMenadger #up-part .up-panel .padding{padding-top:4px}
    #FileMenadger #up-part .current-directory .up-panel .padding{overflow-x:auto;width:550px;white-space:nowrap;}
    #FileMenadger #up-part .load-image{width:458px;margin:0}
    #FileMenadger fieldset{margin:0}
    #FileMenadger #directory-tree{float: left;width:367px}
    #FileMenadger #directory-tree .tree{height:383px;overflow:scroll;width:345px;}
    #FileMenadger #directory-tree .node{color:Blue;background:none;font-size:12px;}
    #FileMenadger #directory-tree .node-sel{color:White;background-color:#527de5}
    #FileMenadger .buttons{padding:5px 0 0 0}
    #FileMenadger .buttons .button{margin:0 5px;}
    #FileMenadger #image-view{float: left;width:680px}
    #FileMenadger #image-view .image-block{width:150px;min-height: 170px;min-width: 150px;border: 1px solid gray;margin:0 3px 11px 0}
    #FileMenadger #image-view .images{height:370px;overflow-x:auto;position:relative}
    #FileMenadger #image-view .images td{vertical-align:top}
    #FileMenadger #image-view .image{height: 150px;width: 150px;min-height: 150px;min-width: 150px;border-bottom:1px dotted black;background-position:center center;background-repeat: no-repeat;position:relative}
    #FileMenadger #image-view .delete{position: absolute;top: 0px;right: 0px}
    #FileMenadger #image-view .select{position: absolute;bottom:2px;right:2px}
    #FileMenadger #image-view .select input{margin:0}
    #FileMenadger #image-view .image-name{width: 140px;padding:0 5px;-ms-word-wrap:break-word; word-wrap:break-word;font-size:12px;}
    #FileMenadger #image-view #status{width: 370px;height:15px}
    #didCreateFolderDialog .dialog-panel{background:#fff;border-radius:5px;z-index:901 !important}
    #didCreateFolderDialog .dislog-body, #didCreateFolderDialog .dialog-title, #didCreateFolderDialog .dialog-footer{padding:15px}
    #didCreateFolderDialog .dialog-title{background:#909090;border-radius:5px;margin:2px}
    #didCreateFolderDialog .dialog-title span{color:#fff;font-weight:bold}
    #didCreateFolderDialog .dialog-footer{text-align:center}
    #didCreateFolderDialog .dialog-footer a{text-decoration:none;border-radius:5px;border:1px solid #464646;padding:7px 10px;background:#D0D0D0;color:#464646}



</style>
<script type="text/javascript">
    var maximumSelectedImageSize = '<%= MaximumSelectedImageSize %>';
    var maximumSelectedImageSizeConfirmText = '<%= String.Format(GetLocalizationString("MaximumSelectedImageSize.Text"), MaximumSelectedImageSize) %>';
    var ErrorMsg_NotSelectedFileText = '<%= GetLocalizationString("ErrorMsg_NotSelectedFile.Text") %>';
    var fileUploadControlClientId = '<%= FileUploadControlClientId %>';
    var alertNotSelectedUploadImageText = '<%= String.Format(GetLocalizationString("ErrorMsg_NotSelectedUploadImage.Text"), GetLocalizationString("bUploadFile.Text")) %>';
    var maxSizeToUploadFiles = '<%= MaxSizeToUploadFiles %>';
    var selectedBigFileText = '<%= SelectedBigFileText %>';
    var validUploadFilesExtentions = '<%= ValidUploadFilesExtentionsString %>';
    var alertNotCorrectFileExtentsion = '<%= String.Format(GetLocalizationString("ErrorMsg_NotCorrectFileExtentsion.Text"), ValidUploadFilesExtentionsString) %>';
    
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
        $('.image').find(':checkbox').each(function () {
            $(this).prop('checked', false);
        });
        $(sender).find(':checkbox').prop("checked", true);
    };

    function ValidateSelectedImage() {
        var selectDivImage = $(".image-block .image:has(input:checked):first").find("input[type = 'hidden']");
        if (selectDivImage.length) {
            var img = document.createElement("img");
            img.src = selectDivImage.val();
            return checkLoad(img);
        }
        else {
            alert(ErrorMsg_NotSelectedFileText);
            return false;
        }
    }

    function checkLoad(bigImage) {
        if (bigImage.complete) {
            var maxImgSize = maximumSelectedImageSize.split("x");
            if (maximumSelectedImageSize.length > 0 && maxImgSize[0] < bigImage.width || maxImgSize[1] < bigImage.height) {
                if (confirm(maximumSelectedImageSizeConfirmText)) {
                    var bSelect = $("input[id*='bOK']");
                    bSelect.attr("onclick", "");
                    bSelect.click();
                }
            }
            else {
                var bSelect = $("input[id*='bOK']");
                bSelect.attr("onclick", "");
                bSelect.click();
            }
            bigImage = null;
            return false;
        } else {
            setTimeout(function () { checkLoad(bigImage); }, 50);
            return false;
        }
    };


    var buttonUploadFileClick = false;
    function CheckUploadFileSize() {
        buttonUploadFileClick = true;

        var input, file;

        // (Can't use `typeof FileReader === "function"` because apparently
        // it comes back as "object" on some browsers. So just see if it's there
        // at all.)
        if (!window.FileReader) {
            //bodyAppend("p", "The file API isn't supported on this browser yet.");
            return true;
        }

        input = document.getElementById(fileUploadControlClientId);
        if (!input) {
            //bodyAppend("p", "Um, couldn't find the fileinput element.");
            return true;
        }
        else if (!input.files) {
            //bodyAppend("p", "This browser doesn't seem to support the `files` property of file inputs.");
            return true;
        }
        else if (!input.files[0]) {
            alert(alertNotSelectedUploadImageText);
            ClearFileInputField();
            return false;
        }
        else {
            file = input.files[0];
            if (ValidateFileExtensions(file.name)) {
                if (file.size > maxSizeToUploadFiles) {
                    alert(selectedBigFileText);
                    ClearFileInputField();
                    return false;
                }
            }
            else {
                alert(alertNotCorrectFileExtentsion);
                ClearFileInputField();
                return false;
            }
        }
        return true;
    };

    function ValidateFileExtensions(fileName) {
        var fileExtension = fileName.split('.')[fileName.split('.').length - 1].toLowerCase();
        var validFilesExtensions = validUploadFilesExtentions.split(",");
        if (validFilesExtensions.length > 0) {
            if (validFilesExtensions.indexOf(fileExtension) > -1) {
                return true;
            }
        }
        return false;
    };
    
    function ClearFileInputField() {
        if (!buttonUploadFileClick)
            document.getElementById("divflupUploadFile").innerHTML = document.getElementById("divflupUploadFile").innerHTML;
        buttonUploadFileClick = false;
        return true;
    };

</script>
<div id="didCreateFolderDialog" style="display:none" class="dialog-panel">
    <div class="dEditpopup-background">
    </div>
    <div class="dialog-panel">
        <asp:Panel ID="pnCreateDirectory" runat="server" DefaultButton="lbCreateDirectory">
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
        </asp:Panel>
    </div>
</div>
<div id="FileMenadger">
    <div class="panel panel-info">
         <div class="panel-heading">
            <asp:Label ID="lHeader" runat="server" Text="# Images menager #" meta:resourcekey="lHeader"></asp:Label>
         </div>
        <div class="panel-body">
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
                            <div style="display: inline" id="divflupUploadFile">
                                <asp:FileUpload ID="flupUploadFile" runat="server" /></div>
                            <asp:Button ID="bUploadFile" runat="server" Text="#bUploadFile#" meta:resourcekey="bUploadFile"
                                OnClick="ButtonUploadFileClick" OnClientClick="return CheckUploadFileSize();" CssClass="btn btn-success btn-xs" />
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
                        <asp:Button ID="bNewDirectory" runat="server" Text="#bNewDirectory#" meta:resourcekey="bNewDirectory"
                            OnClientClick="displayCreateDirectoryDialog(); return false;"
                            CssClass="button btn btn-success btn-xs" />
                        <asp:Button ID="bDeleteDirectory" runat="server" Text="#bDeleteDirectory#" meta:resourcekey="bDeleteDirectory"
                            OnClick="bDeleteDirectory_Click" OnClientClick="return bDeleteDirectoryClientClick();"
                            CssClass="button btn btn-warning btn-xs" />
                        <asp:HiddenField ID="hfDelDirMessageText" runat="server" />
                    </div>
                </asp:Panel>
            </div>
            <div id="image-view">
                <asp:Panel ID="pnFiles" runat="server" GroupingText="#Files#" meta:resourcekey="pnFiles">
                    
                    <div class="form-group">
                         <div style="padding:0 0 5px 0 ; display: inline-block;" class="input-group"> 
                        <span class="input-group-addon"> <asp:Label ID="lSort"  runat="server" Text="# Sort #" meta:resourcekey="lSort"></asp:Label></span>
                       
                        <asp:DropDownList ID="ddlSortValue" runat="server" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlSortValue_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    </div>
                    <div class="images">
                        <asp:DataList ID="dlFiles" RepeatColumns="4" runat="server" OnItemDataBound="dlFiles_ItemDataBound"
                            RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div class="image-block">
                                    <div runat="server" id="divImageFile" class="image" onclick="divImageFileOnClick(this);">
                                        <asp:CheckBox ID="chBoxSelectFile" class="select" runat="server" />
                                        <asp:ImageButton ID="ibDelete" class="delete" runat="server" ImageUrl="~/StyleSheets/Images/delete2.png"
                                            AlternateText="Delete" OnClick="ibDelete_Click" Visible="true" Width="16" Height="16" />
                                        <asp:HiddenField ID="hfImagePath" runat="server" />
                                    </div>
                                    <div class="image-name">
                                        <asp:Label ID="lImageFileName" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
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
            
         </div>
    </div>
   
    <div class="clear"></div>
    <div class="panel-footer">
    <div class="buttons">
        <div class="text-right">
            <asp:Button ID="bOK" runat="server" Text="#bOK#" OnClick="bOK_Click" OnClientClick="return ValidateSelectedImage();" meta:resourcekey="bOK" 
                CssClass="button btn btn-sm btn-primary" />
            <asp:Button ID="bCancel" runat="server" Text="#bCancel#" meta:resourcekey="bCancel"  CssClass="btn btn-sm btn-default"
                OnClick="bCancel_Click" />
        </div>
    </div>
        </div>
</div>
