// CheckoutFeedbackForm
function ShowCheckoutFeedbackForm(clientControlID) {
    $("#" + clientControlID).show();
    $("#" + clientControlID + " .panel").center();
}

function HideCheckoutFeedbackForm(clientControlID) {
    $("#" + clientControlID).hide();
}

function ProductWasAddedToCart() {
    $('.divAddProductToCartInfo').slideDown("slow")
    setTimeout('HideProductWasAddedToCart()', 2500);
}

function HideProductWasAddedToCart() {
    $('.divAddProductToCartInfo').slideUp("slow");
}

function CheckMaxLengthTextarea(elem, maxLength, message) {
    var curLength = elem.value.length
    if (curLength > maxLength) {
        $("#" + elem.getAttribute("ID")).val(elem.value.substr(0, maxLength));
        alert(message);
    }
}

function ShowAllovedLanguage() {
    $('#allovedLanguage').css('display', 'block');
}


/**** admin side *****/
function ShowHidePanel(panelClassName) {
    var panelClassName = '.' + panelClassName;
    $(panelClassName).toggle("fast", function () {
        $("div.dEditpopup-panel").center();
    });
}
/**** admin side *****/
/*to top scripts*/
(function ($) {
    $.fn.UItoTop = function (options) {

        var defaults = {
            text: '',
            min: 500,
            scrollSpeed: 800,
            containerID: 'toTop',
            containerClass: 'toTop fa fa-angle-up',
            easingType: 'linear'

        };

        var settings = $.extend(defaults, options);
        var containerIDhash = '#' + settings.containerID;
        var containerHoverIDHash = '#' + settings.containerHoverID;

        $('body').append('<a href="top" id="' + settings.containerID + '" class="' + settings.containerClass + '" >' + settings.text + '</a>');

        $(containerIDhash).hide().click(function () {
            $('html, body').stop().animate({ scrollTop: 0 }, settings.scrollSpeed, settings.easingType);
            $('#' + settings.containerHoverID, this).stop().animate({ 'opacity': 0 }, settings.inDelay, settings.easingType);
            return false;
        })


        $(window).scroll(function () {
            var sd = $(window).scrollTop();
            if (typeof document.body.style.maxHeight === "undefined") {
                $(containerIDhash).css({
                    'position': 'absolute',
                    'top': $(window).scrollTop() + $(window).height() - 50
                });
            }
            if (sd > settings.min)
                $(containerIDhash).stop(true, true).fadeIn(600);
            else
                $(containerIDhash).fadeOut(800);
        });
    };
})(jQuery);
$(document).ready(function () {
    /*top top*/
    $().UItoTop({ easingType: 'easeOutQuart' });
    //======= login ======//
    if ($('table').is('.LoginUser'))
        $('.well-reg').addClass('well-regAc');
    //==========admin panel==============//
    if ($('#divEnableEditSkinControls label').length > 0) {
        $(".adminPanel").css('display', 'block');
        $('.fix_login ').addClass('show');
        $(".login-trigger").click(function (e) {
            e.preventDefault();
            $('#login-content,.fix_login,.adminPanel').toggleClass('active');
            $("#login-content").not($('.active')).animate({ 'margin-top': 0 }, { duration: 250 });
            $("#login-content.active").animate({ 'margin-top': -50 }, { duration: 250 });
            $(".adminPanel.active").animate({ 'height': 0 }, { duration: 250 });
            $(".adminPanel").not($('.active')).animate({ 'height': 50 }, { duration: 250 });
        })
    } 
    //==========end admin panel==============//
    /*scroll jakor*/
    var o = $("a[href^='#']");
    o.each(function () {
        var o = $(this);
        o.on("click", function (n) {
            var b = o.attr("href");
            if (b !== '#') {
                n.preventDefault();
                $("body, html").stop().animate({
                    scrollTop: $(o.attr("href")).offset().top
                }, 800);
            }

        })
    });
	
    /*banner a*/
    
    $('.banner1 .div-row').wrapAll("<a href='/akcii-i-skidki/akcii-i-skidki'></a>");
	if($(window).width() < 768){
		$("meta[name='viewport']").attr('content','width=device-width, initial-scale=1')
	}else{
		$("meta[name='viewport']").attr('content','width=1230')
	}

});

//$(document).ready(function () {
//    $('.toggle').click(function (e) {
//        e.preventDefault();
//        var tmp = $(this);
//        o.each(function () {
//            if ($(this).hasClass('active') && !$(this).is(tmp)) {
//                $(this).parent().find('.toggle_cont').slideToggle();
//                $(this).removeClass('active');
//            }
//        });
//        $(this).toggleClass('active');
//        $(this).parent().find('.toggle_cont').slideToggle();
//    });
//});


/*height*/
/*parsed HTML*/
$(function () {
    $("[data-equal-group]").each(function () {
        $(this).contents().wrapAll("<div class='box_inner'></div>");
    })
})
/*add event*/
$(window).bind("resize", height_handler).bind("load", height_handler)
function height_handler() {

    var groups = [];
    $("[data-equal-group]").each(function () {
        var g = $(this).data('equal-group');
        if (!groups[g]) {
            groups[g] = [];
        }
        groups[g].push(this);
    });

    var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

    if (width > 767) {
        $.each(groups, function () {
            $(this).equalHeights();
        })
    } else {
        $.each(groups, function () {
            $(this).css('height', 'auto');
        })
    }
}
/*glob function*/
(function ($) {
    $.fn.equalHeights = function (minHeight, maxHeight) {
        tallest = (minHeight) ? minHeight : 0;
        this.each(function () {
            if ($(">.box_inner", this).outerHeight() > tallest) {
                tallest = $(">.box_inner", this).outerHeight()
            }
        });
        if ((maxHeight) && tallest > maxHeight) tallest = maxHeight;
        return this.each(function () {
            $(this).height(tallest)
        })
    }
})(jQuery)
