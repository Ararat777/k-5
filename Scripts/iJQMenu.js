﻿/*
 * jQuery Superfish Menu Plugin - v1.7.4
 * Copyright (c) 2013 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 *	http://www.opensource.org/licenses/mit-license.php
 *	http://www.gnu.org/licenses/gpl.html
 */

(function ($, window) {
    "use strict";

    var methods = (function () {
        // private properties and methods go here
        var c = {
            bcClass: 'sf-breadcrumb',
            menuClass: 'sf-js-enabled',
            anchorClass: 'sf-with-ul',
            menuArrowClass: 'sf-arrows'
        },
            ios = (function () {
                var ios = /iPhone|iPad|iPod/i.test(navigator.userAgent);
                if (ios) {
                    // iOS clicks only bubble as far as body children
                    $(window).load(function () {
                        $('body').children().on('click', $.noop);
                    });
                }
                return ios;
            })(),
            wp7 = (function () {
                var style = document.documentElement.style;
                return ('behavior' in style && 'fill' in style && /iemobile/i.test(navigator.userAgent));
            })(),
            toggleMenuClasses = function ($menu, o) {
                var classes = c.menuClass;
                if (o.cssArrows) {
                    classes += ' ' + c.menuArrowClass;
                }
                $menu.toggleClass(classes);
            },
            setPathToCurrent = function ($menu, o) {
                return $menu.find('li.' + o.pathClass).slice(0, o.pathLevels)
                    .addClass(o.hoverClass + ' ' + c.bcClass)
                    .filter(function () {
                        return ($(this).children(o.popUpSelector).hide().show().length);
                    }).removeClass(o.pathClass);
            },
            toggleAnchorClass = function ($li) {
                $li.children('a').toggleClass(c.anchorClass);
            },
            toggleTouchAction = function ($menu) {
                var touchAction = $menu.css('ms-touch-action');
                touchAction = (touchAction === 'pan-y') ? 'auto' : 'pan-y';
                $menu.css('ms-touch-action', touchAction);
            },
            applyHandlers = function ($menu, o) {
                var targets = 'li:has(' + o.popUpSelector + ')';
                if ($.fn.hoverIntent && !o.disableHI) {
                    $menu.hoverIntent(over, out, targets);
                }
                else {
                    $menu
                        .on('mouseenter.superfish', targets, over)
                        .on('mouseleave.superfish', targets, out);
                }
                var touchevent = 'MSPointerDown.superfish';
                if (!ios) {
                    touchevent += ' touchend.superfish';
                }
                if (wp7) {
                    touchevent += ' mousedown.superfish';
                }
                $menu
                    .on('focusin.superfish', 'li', over)
                    .on('focusout.superfish', 'li', out)
                    .on(touchevent, 'a', o, touchHandler);
            },
            touchHandler = function (e) {
                var $this = $(this),
                    $ul = $this.siblings(e.data.popUpSelector);

                if ($ul.length > 0 && $ul.is(':hidden')) {
                    $this.one('click.superfish', false);
                    if (e.type === 'MSPointerDown') {
                        $this.trigger('focus');
                    } else {
                        $.proxy(over, $this.parent('li'))();
                    }
                }
            },
            over = function () {
                var $this = $(this),
                    o = getOptions($this);
                clearTimeout(o.sfTimer);

                $this.siblings().superfish('hide').end().superfish('show');
            },
            out = function () {
                var $this = $(this),
                    o = getOptions($this);
                if (ios) {
                    $.proxy(close, $this, o)();
                }
                else {
                    clearTimeout(o.sfTimer);
                    o.sfTimer = setTimeout($.proxy(close, $this, o), o.delay);
                }

            },
            close = function (o) {
                o.retainPath = ($.inArray(this[0], o.$path) > -1);

                this.superfish('hide');

                if (!this.parents('.' + o.hoverClass).length) {
                    o.onIdle.call(getMenu(this));
                    if (o.$path.length) {
                        $.proxy(over, o.$path)();
                    }
                }
            },
            getMenu = function ($el) {
                return $el.closest('.' + c.menuClass);
            },
            getOptions = function ($el) {
                return getMenu($el).data('sf-options');
            },
            resizeBg = function () {
                if ($(window).width() > 767 && $.fn.superfish.defaults.fakeBg) {
                    var page = $($.fn.superfish.defaults.fakeBgLimiter);
                    var obj = $('.sub-menu');

                    var offset = $(page).offset();

                    var x = offset.left;
                    var x1 = $(obj).offset().left;
                    var width = $(page).width();

                    $('.fake-bg').css(
                        {
                            left: (x - x1),
                            width: width
                        }
                    );
                }
            };

        return {
            // public methods
            hide: function (instant) {
                if (this.length) {
                    var $this = this,
                        o = getOptions($this);
                    if (!o) {
                        return this;
                    }
                    var not = (o.retainPath === true) ? o.$path : '',
                        $ul = $this.find('li.' + o.hoverClass).add(this).not(not).removeClass(o.hoverClass).children(o.popUpSelector),
                        speed = o.speedOut;

                    if (instant) {
                        $ul.show();
                        speed = 0;
                    }
                    o.retainPath = false;
                    o.onBeforeHide.call($ul);

                    $ul.children('li').css({ opacity: 0 });

                    $ul.stop(true, true).animate(o.animationOut, {
                        duration: speed,
                        complete: function () {
                            var $this = $(this);
                            o.onHide.call($this);
                        }
                    });
                }
                return this;
            },
            show: function () {
                var o = getOptions(this);
                if (!o) {
                    return this;
                }
                var $this = this.addClass(o.hoverClass),
                    $ul = $this.children(o.popUpSelector);

                o.onBeforeShow.call($ul);

                $ul.stop(true, true).animate(o.animation, {
                    duration: o.speed,
                    step: function () {
                        if ($(this).css('display') != 'none') {
                            resizeBg();
                        }
                    },
                    complete: function () {
                        o.onShow.call($ul);
                        $ul.children('li').animate({ opacity: 1 }, 'normal');
                    }
                });
                return this;
            },
            destroy: function () {
                return this.each(function () {
                    var $this = $(this),
                        o = $this.data('sf-options'),
                        $hasPopUp;
                    if (!o) {
                        return false;
                    }
                    $hasPopUp = $this.find(o.popUpSelector).parent('li');
                    clearTimeout(o.sfTimer);
                    toggleMenuClasses($this, o);
                    toggleAnchorClass($hasPopUp);
                    toggleTouchAction($this);
                    // remove event handlers
                    $this.off('.superfish').off('.hoverIntent');
                    // clear animation's inline display style
                    $hasPopUp.children(o.popUpSelector).attr('style', function (i, style) {
                        return style.replace(/display[^;]+;?/g, '');
                    });
                    // reset 'current' path classes
                    o.$path.removeClass(o.hoverClass + ' ' + c.bcClass).addClass(o.pathClass);
                    $this.find('.' + o.hoverClass).removeClass(o.hoverClass);
                    o.onDestroy.call($this);
                    $this.removeData('sf-options');
                });
            },
            init: function (op) {
                if ($.fn.superfish.defaults.fakeBg) {
                    $(window).on('resize', resizeBg);
                    $(window).on('orientationchange', resizeBg);

                    $('.sub-menu').prepend('<div class="fake-bg"></div>');

                    resizeBg();
                }

                return this.each(function () {
                    var $this = $(this);
                    if ($this.data('sf-options')) {
                        return false;
                    }
                    var o = $.extend({}, $.fn.superfish.defaults, op),
                        $hasPopUp = $this.find(o.popUpSelector).parent('li');
                    o.$path = setPathToCurrent($this, o);

                    $this.data('sf-options', o);

                    toggleMenuClasses($this, o);
                    toggleAnchorClass($hasPopUp);
                    toggleTouchAction($this);
                    applyHandlers($this, o);

                    $hasPopUp.not('.' + c.bcClass).superfish('hide', true);

                    o.onInit.call(this);
                });
            }
        };
    })();

    $.fn.superfish = function (method, args) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        }
        else if (typeof method === 'object' || !method) {

            return methods.init.apply(this, arguments);
        }
        else {
            return $.error('Method ' + method + ' does not exist on jQuery.fn.superfish');
        }
    };

    $.fn.superfish.defaults = {
        popUpSelector: 'ul,.sf-mega', // within menus context
        hoverClass: 'sfHover',
        pathClass: 'overrideThisToUse',
        fakeBg: false,
        fakeBgLimiter: '#page',
        pathLevels: 1,
        delay: 800,
        animation: { height: 'show' },
        animationOut: { height: 'hide' },
        speed: 'normal',
        speedOut: 'fast',
        cssArrows: true,
        disableHI: false,
        onInit: $.noop,
        onBeforeShow: $.noop,
        onShow: $.noop,
        onBeforeHide: $.noop,
        onHide: $.noop,
        onIdle: $.noop,
        onDestroy: $.noop
    };

    // soon to be deprecated
    $.fn.extend({
        hideSuperfishUl: methods.hide,
        showSuperfishUl: methods.show
    });

})(jQuery, window);


$(window).load(function () {
    $('.sf-menu').superfish();
});


///*fix nav*/
//$(document).ready(function () {
//    //$('.iJQMenu_horiz ul li').hover(
//    //    function () {

//    //        $(this).find('ul:first').stop(true, true);
//    //        $(this).find('ul:first').slideDown();
//    //    },
//    //    function () {
//    //        $(this).find('ul:first').slideUp('fast');
//    //    }
//    //);
//    //    //$('.iJQMenu_horiz li:has(ul)').find('a:first').append("<div class='mvHasChild'></div>");
//    //    $('.iJQMenu_horiz li:has(ul)').find(':first').append("<div class='mvHasChild'></div>");
//    $('#stuck_container').TMStickUp({})
//});

//(function ($, undefined) {
//    var
//		def = {
//		    stuckClass: 'isStuck'
//		}
//		, doc = $(document), anim = false;

//    $.fn.TMStickUp = function (opt) {
//        opt = $.extend(true, {}, def, opt)

//        $(this).each(function () {
//            var $this = $(this)
//				, posY//=$this.offset().top+$this.outerHeight()
//				, isStuck = false
//				, clone = $this.clone().appendTo($this.parent()).addClass(opt.stuckClass)
//				, height//=$this.outerHeight()
//				, stuckedHeight = clone.outerHeight()
//				, opened//=$.cookie&&$.cookie('panel1')==='opened'
//				, tmr

//            $(window).resize(function () {
//                clearTimeout(tmr)
//                clone.css({ top: isStuck ? 0 : -stuckedHeight, visibility: isStuck ? 'visible' : 'hidden' })
//                tmr = setTimeout(function () {
//                    posY = $this.offset().top//+$this.outerHeight()				
//                    height = $this.outerHeight()
//                    stuckedHeight = clone.outerHeight()
//                    opened //= $.cookie && $.cookie('panel1') === 'opened'

//                    clone.css({ top: isStuck ? 0 : -stuckedHeight })
//                }, 40)
//            }).resize()

//            clone.css({
//                position: 'fixed'
//				, width: '100%'
//            })

//            $this
//				.on('rePosition', function (e, d) {
//				    if (isStuck)
//				        clone.animate({ marginTop: d }, { easing: 'linear' })
//				    if (d === 0)
//				        opened = false
//				    else
//				        opened = true
//				})

//            doc
//				.on('scroll', function () {
//				    var scrollTop = doc.scrollTop()

//				    if (scrollTop >= posY && !isStuck) {
//				        clone
//							.stop()
//							.css({ visibility: 'visible' })
//							.animate({
//							    top: 0
//								, marginTop: opened ? 50 : 0
//							}, {

//							})

//				        isStuck = true
//				    }

//				    if (scrollTop < posY + height && isStuck) {
//				        $('.sf-menu ul').css('display', 'none');

//				        var sf = $('.search-form');
//				        if (sf.length > 0) {
//				            sf.find('input').blur();
//				        }

//				        clone
//							.stop()
//							.animate({
//							    top: -stuckedHeight
//								, marginTop: 0
//							}, {
//							    duration: 200
//								, complete: function () {
//								    clone.css({ visibility: 'hidden' })
//								}
//							});

//				        isStuck = false;

//				    }
//				})
//				.trigger('scroll')
//        })
//    }
//})(jQuery)



///*
// * Author: Evgeniy Gusarov StMechanus (Diversant)
// * Under the MIT License
// *
// * Version: 1.0.1
// *
// */


//;
//(function ($) {

//    var settings = {
//        cntClass: 'rd-mobilemenu',
//        menuClass: 'rd-mobilemenu_ul',
//        submenuClass: 'rd-mobilemenu_submenu',
//        panelClass: 'rd-mobilepanel',
//        toggleClass: 'rd-mobilepanel_toggle',
//        titleClass: 'rd-mobilepanel_title'
//    },
//        lastY, dir;


//    var RDMobileMenu = function (element, options) {
//        this.options = options;

//        this.$source = $(element);
//    };

//    RDMobileMenu.prototype = {
//        init: function () {
//            var nav = this;
//            nav.createDOM();
//            nav.createListeners();
//        },

//        createDOM: function () {
//            var nav = this;

//            $('body')
//                .append($('<div/>', {
//                    'class': settings.cntClass
//                }).append(nav.createNavDOM()))
//                .append($('<div/>', {
//                    'class': settings.panelClass
//                })
//                    .append($('<button/>', {
//                        'class': settings.toggleClass
//                    }).append($('<span/>')))
//                    .append($('<h2/>', {
//                        'class': settings.titleClass,
//                        'text': document.title
//                    })));
//        },

//        createNavDOM: function () {
//            var nav = this;

//            var menu = $('<ul>', { 'class': settings.menuClass });

//            var li = nav.$source.children();
//            for (var i = 0; i < li.length; i++) {
//                var o = li[i].children,
//                    item = null;
//                for (var j = 0; j < o.length; j++) {
//                    if (o[j].tagName) {
//                        if (!item) {
//                            item = document.createElement('li');
//                            if (li[i].className.indexOf('active') > -1) {
//                                item.className = 'active';
//                            }
//                        }

//                        switch (o[j].tagName.toLowerCase()) {
//                            case 'a':
//                                var link = o[j].cloneNode(true);
//                                item.appendChild(link);
//                                break;
//                            case 'ul':
//                                var submenu = o[j].cloneNode(true);
//                                submenu.className = settings.submenuClass;
//                                $(submenu).css({ "display": "none" });
//                                item.appendChild(submenu);
//                                $(item).find('> a')
//                                    .each(function () {
//                                        $this = $(this);
//                                        $this.addClass('rd-with-ul')
//                                            .append($('<span/>', { class: 'rd-submenu-toggle' }))
//                                            .find('.rd-submenu-toggle')
//                                            .on('click', function (e) {
//                                                e.preventDefault();
//                                                $this = $(this).parent();

//                                                if ($this.hasClass('rd-with-ul') && !$this.hasClass('active')) {
//                                                    $('.rd-with-ul').removeClass('active');
//                                                    var submenu = $this.addClass('active').parent().find('.' + settings.submenuClass);
//                                                    submenu.stop().slideDown();
//                                                    $('.' + settings.submenuClass).not(submenu).stop().slideUp();
//                                                } else {
//                                                    var submenu = $this.removeClass('active').parent().find('.' + settings.submenuClass);
//                                                    submenu.stop().slideUp();
//                                                }
//                                            });
//                                    });

//                                break;
//                            default:
//                                break;
//                        }
//                    }
//                }

//                if (item) {
//                    menu.append(item);
//                }
//            }

//            return menu;
//        },

//        createListeners: function () {
//            var nav = this;

//            nav.createToggleListener();
//            nav.createResizeListener();
//        },

//        createToggleListener: function () {
//            var nav = this,
//                type;

//            if (nav.isMobile()) {
//                type = 'touchstart';
//            } else {
//                type = 'click';
//            }

//            $('body').delegate('.' + settings.toggleClass, type, function () {
//                var o = $('.' + settings.cntClass);
//                $(this).toggleClass('active');

//                if (o.hasClass('active')) {
//                    $(this).removeClass('active');
//                    o.removeClass('active');
//                    $('body').undelegate('*', 'mousewheel', nav.scroll);
//                    $('body').undelegate('*', 'touchmove', nav.scroll);
//                    $('body').undelegate('*', 'touchend', nav.touchend);
//                    $('body').undelegate('*', 'touchstart', nav.close);
//                    $('body').undelegate('*:not(.' + settings.toggleClass + ' span)', 'click', nav.close);
//                } else {
//                    $(this).addClass('active');
//                    o.addClass('active');
//                    $('body').delegate('*', 'mousewheel', nav.scroll);
//                    $('body').delegate('*', 'touchmove', nav.scroll);
//                    $('body').delegate('*', 'touchend', nav.touchend);
//                    $('body').delegate('*', 'touchstart', { type: type }, nav.close);
//                    $('body').delegate('*:not(.' + settings.toggleClass + ' span)', 'click', { type: type }, nav.close);
//                }
//            });
//        },

//        createResizeListener: function () {
//            var nav = this;

//            $(window).on('resize', function () {
//                var o = $('.' + settings.cntClass);

//                if (o.css('display') == 'none') {
//                    o.removeClass('active');
//                    $('.' + settings.toggleClass).removeClass('active');
//                    $('body').undelegate('*', 'mousewheel', nav.scroll);
//                    $('body').undelegate('*', 'touchmove', nav.scroll);
//                    $('body').undelegate('*', 'touchend', nav.touchend);
//                    $('body').undelegate('*', 'touchstart', nav.close);
//                    $('body').undelegate('*:not(.' + settings.toggleClass + ' span)', 'click', nav.close);
//                }
//            });
//        },

//        scroll: function (e) {
//            e.preventDefault();
//            var menu = $('.' + settings.menuClass);

//            var x = e.originalEvent.targetTouches ? e.originalEvent.targetTouches[0].pageX : e.pageX,
//                y = e.originalEvent.targetTouches ? e.originalEvent.targetTouches[0].pageY : e.pageY;

//            if (
//                y > menu.offset().top &&
//                y < (menu.offset().top + menu.outerHeight()) &&
//                x > menu.offset().left &&
//                x < (menu.offset().left + menu.outerWidth())
//            ) {
//                var delta = 0;
//                if (e.originalEvent.targetTouches) {
//                    if (!lastY) lastY = y;
//                    delta = (lastY - y);

//                    lastY = y;
//                    dir = delta > 0;

//                } else {
//                    delta = (e.originalEvent.wheelDelta || -e.originalEvent.detail) * (-50)
//                }

//                menu.stop().scrollTop(menu.scrollTop() + delta);
//            }
//            return false;
//        },

//        touchend: function (e) {
//            var menu = $('.' + settings.menuClass);

//            menu.stop().animate({
//                scrollTop: menu.scrollTop() + (dir ? 100 : -100)
//            }, 3000, 'easeOutQuint');
//            lastY = undefined;
//        },

//        close: function (e) {
//            if (!e.originalEvent) {
//                return;
//            }

//            var menu = $('.' + settings.menuClass);
//            var x = e.originalEvent.targetTouches ? e.originalEvent.targetTouches[0].pageX : e.pageX,
//                y = e.originalEvent.targetTouches ? e.originalEvent.targetTouches[0].pageY : e.pageY;

//            if (!(
//                y > menu.offset().top &&
//                y < (menu.offset().top + menu.outerHeight()) &&
//                x > menu.offset().left &&
//                x < (menu.offset().left + menu.outerWidth())
//                )
//            ) {
//                $('.' + settings.toggleClass).trigger(e.data.type);
//            }
//        },

//        isMobile: function () {
//            return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
//        }
//    };

//    $.fn.rdparallax = function (option) {
//        var o = this;
//        if (o.length) {
//            new RDMobileMenu(o[0]).init();
//        }
//        return o;
//    };

//    window.RDMobilemenu_autoinit = function (selector) {
//        var o = $(selector);
//        if (o.length) {
//            new RDMobileMenu(o[0]).init();
//        }
//    };
//})(jQuery);

//$(document).ready(function () {
//    RDMobilemenu_autoinit('[data-type="navbar"]');
//});
