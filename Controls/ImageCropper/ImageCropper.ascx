<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageCropper.ascx.cs" Inherits="i.LightSite.Web.Controls.ImageCropper.ImageCropper" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<link href='<%= ResolveClientUrl("~/Controls/ImageCropper/Styles/imgareaselect-animated.css") %>' rel="stylesheet" type="text/css" />
<script src='<%= ResolveClientUrl("~/Controls/ImageCropper/Scripts/jquery.imgareaselect.min.js") %>' type="text/javascript"></script>
<script src='<%= ResolveClientUrl("~/Controls/ImageCropper/Scripts/jquery.imgareaselect.pack.js") %>' type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var image = $('img[id*="imCropImage"]');
        var ratio = $('input[id*="hfScalarX"]').val() + ':' + $('input[id*="hfScalarY"]').val()
        var imageH = $(image).height();
        var imageW = $(image).width();

        $('input[id*="hfDisplayImageHeight"]').val(imageH);

        var x1Point = parseInt($('input[id*="hfX1"]').val());
        var y1Point = parseInt($('input[id*="hfY1"]').val());

        var x2Point = 50;
        var y2Point = 50;

        if (imageH > imageW) {
            x2Point = imageW;
            y2Point = parseInt(imageW * parseFloat($('input[id*="hfScalarY"]').val()));
        }
        else {
            y2Point = imageH;
            x2Point = parseInt(imageH * parseFloat($('input[id*="hfScalarX"]').val()));
        }

        $(image).imgAreaSelect({
            aspectRatio: ratio
            , parent: $("#imageCropperBox")
            , x1: x1Point
            , y1: y1Point
            , x2: x2Point + x1Point
            , y2: y2Point + y1Point
            , resizable: false
            , handles: true
            , onSelectChange: preview
            , persistent: true
        });

        var originalImageWigth = parseInt($('input[id*="hfOriginalImageWidth"]').val());
        var originalImageHeight = parseInt($('input[id*="hfOriginalImageHeight"]').val());
        var zoom = $('input[id*="hfZoomPersent"]').val();
        $('img[id*="imCropImage"] + div > img').css({
            width: Math.round(1 * originalImageWigth * zoom) + 'px',
            height: Math.round(1 * originalImageHeight * zoom) + 'px',
            marginLeft: '-' + Math.round(parseInt($('input[id*="hfX1"]').val())) + 'px',
            marginTop: '-' + Math.round(parseInt($('input[id*="hfY1"]').val())) + 'px'
        });
    });

    function preview(img, selection) {
        var scaleX = 1;
        var scaleY = 1;

        var image = $('img[id*="imCropImage"]');
        var previewImage = $('img[id*="imCropImage"] + div > img');
        
        var rateX = $(previewImage).width() / $(image).width();
        var rateY = $(previewImage).height() / $(image).height();

        var originalImageWigth = parseInt($('input[id*="hfOriginalImageWidth"]').val());
        var originalImageHeight = parseInt($('input[id*="hfOriginalImageHeight"]').val());

        console.log('rateX:' + rateX);
        console.log('rateY:' + rateY);

        $('input[id*="hfX1"]').val(Math.round(selection.x1 * (originalImageWigth / $(image).width())));
        $('input[id*="hfY1"]').val(Math.round(selection.y1 * (originalImageHeight / $(image).height())));

        var zoom = $('input[id*="hfZoomPersent"]').val();

        $(previewImage).css({
            width: Math.round(scaleX * originalImageWigth * zoom) + 'px',
            height: Math.round(scaleY * originalImageHeight * zoom) + 'px',
            marginLeft: '-' + Math.round(scaleX * selection.x1 * rateX) + 'px',
            marginTop: '-' + Math.round(scaleY * selection.y1 * rateY) + 'px'
        });
    }
</script>

<div id="divImageCropperForm" runat="server" visible="false">
    <div class="modalPanelPopup-background">
    </div>
    <style>
        #imageCropperBox {position:relative}
        #imageCropperBox img.imCropImage {max-width:400px;max-height:400px;float:left;margin-right:15px;border:1px dotted silver}
        #imageCropperBox {width:800px}
        #imageCropperBox .divImagePreview {float:left;position:relative;overflow:hidden;border:1px dotted silver}
    </style>
    <div id="imageCropperBox" class="modalPanelPopup">
        <asp:HiddenField ID="hfMaxWidth" runat="server" Value="0" />
        <asp:HiddenField ID="hfMaxHeight" runat="server" Value="0" />
        <asp:HiddenField ID="hfScalarX" runat="server" Value="1" />
        <asp:HiddenField ID="hfScalarY" runat="server" Value="1" />
        <asp:HiddenField ID="hfOriginalImageWidth" runat="server" Value="1" />
        <asp:HiddenField ID="hfOriginalImageHeight" runat="server" Value="1" />
        <asp:HiddenField ID="hfZoomPersent" runat="server" Value="1" />
        <asp:HiddenField ID="hfDisplayImageHeight" runat="server" />
        <asp:Image ID="imCropImage" runat="server" CssClass="imCropImage" />
        <div id="divImagePreview" runat="server" class="divImagePreview">
            <asp:Image ID="imResult" runat="server" />
        </div>
        <div style="clear:both"></div>

        <div class="messageButtons">
            <asp:Button ID="bOk" CssClass="button" runat="server" Text="#Ok#" meta:resourcekey="bOk" OnClick="bOk_Click"/>
            <asp:Button ID="bCancel" runat="server" CssClass="button" Text="Cancel" meta:resourcekey="bCancel" OnClick="bCancel_Click" />
        </div>
        <asp:HiddenField ID="hfX1" runat="server" Value="0" />
        <asp:HiddenField ID="hfY1" runat="server" Value="0" />
        <asp:HiddenField ID="hfImageName" runat="server" />
        <asp:HiddenField ID="hfImageCropperType" runat="server" />
    </div>
</div>
<ajaxToolkit:ModalPopupExtender runat="server" ID="mpeImageCropperBox" TargetControlID="hfX1"
    PopupControlID="divImageCropperForm" BackgroundCssClass="modalMessageBackground" >
</ajaxToolkit:ModalPopupExtender>