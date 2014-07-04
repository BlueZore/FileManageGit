/// <reference path="../Scripts/jquery-1.4.1-vsdoc.js" />

/// 对话框1.0 完成于2011.1.25


/// 对话框1.1 完成于2011.1.25 徐松涛制
///于2011-11-8更新，增加 标题显示
///于2011-12-31更新，增加 针对IE6中有下拉框，起到遮盖Iframe

//;(function ($) {
$.fn.extend({
    JDialog: function (options) {
        options = $.extend({
            //基本
            marginLeft: 0, //距左距离
            marginTop: 0, //距顶距离

            //参数
            text: "", //显示文本
            html: "", //显示html
            width: 0, //窗口宽度
            height: 0, //窗口高度
            buttonClickVal: "", //事件参数
            tooltitle: "", //标题

            //对话布局
            topShow: "", //hidden隐藏
            bottomShow: "", //hidden隐藏

            //透明层使用
            opacityShow: "",

            //动画使用
            animate: "", //支持"show"、"fade"

            //对话框移动
            move: false, //

            //对框话类型
            confirm: false, //是否对话框

            //页面关闭后是否重新加载
            closeReLoad: false,

            //是否使用顶部右角关闭按钮事件
            isAClose:true,

            //事件
            buttonClick: function () {
                $.noop();
            }
        }, options);

        //加载弹出层
        $("body").prepend("<div class=\"JDialog_OpacityLayer\"></div><div class=\"JDialog_MainLayer\"><div class=\"JDialog_MainLayer_Shadow\"></div><div class=\"JDialog_MainLayer_Main\"><div class=\"JDialog_MainLayer_Main_Top\"><div></div><a href=\"#\">关闭</a></div><div class=\"JDialog_MainLayer_Main_Middle\"><p></p></div><div class=\"JDialog_MainLayer_Main_Botton\"><input type=\"button\" value=\"确定\" /></div><iframe class='JDialog_MainLayer_Iframe'></iframe></div></div>");

        if (window.navigator.userAgent.substring(0, 50).indexOf("MSIE 6.0") >= 1) {

            var _height = document.body.scrollHeight > document.documentElement.scrollHeight ? document.body.scrollHeight : document.documentElement.scrollHeight;
            //设置底层透明层高宽，主要是针对IE6无法识别left:0; right: 0; top: 0; bottom: 0;
            $(".JDialog_OpacityLayer").css({ "width": $("body").width(), "height": _height });
        }
        else {
            //透明层覆盖范围
            //.JDialog_OpacityLayer      left:0; right: 0; top: 0; bottom: 0; position:fixed;
            $(".JDialog_OpacityLayer").css({ "left": 0, "right": 0, "top": 0, "bottom": 0, "position": "fixed" });
        }

        //设置窗口距离位置
        options.marginLeft = ($(document).width() - (options.width == 0 ? $(".JDialog_MainLayer").width() : options.width)) / 2;
        options.marginTop = ($(window).height() - $(".JDialog_MainLayer").height()) / 2;
        $(".JDialog_MainLayer").css("margin-left", options.marginLeft > 0 ? options.marginLeft : 0);
        $(".JDialog_MainLayer").css("margin-top", options.marginTop > 0 ? options.marginTop : 0);


        //设置弹出窗口宽度
        if (options.width > $(".JDialog_MainLayer").width()) {
            var tmp = options.width + 4;
            $("[class^='JDialog_MainLayer']").width(tmp);
            $(".JDialog_MainLayer").width(tmp);
            //针对IE6中有下拉框，起到遮盖做用
            $(".JDialog_MainLayer_Iframe").width(tmp);
        }

        //隐藏透明层
        if (options.opacityShow == "hidden") {
            $(".JDialog_OpacityLayer").hide();
        }
        //隐藏对话框顶部
        if (options.topShow == "hidden") {
            $(".JDialog_MainLayer_Main_Top").height("0").hide();
        }
        //隐藏对话框底部
        if (options.bottomShow == "hidden") {
            $(".JDialog_MainLayer_Main_Botton").height("0").hide();
        }


        //设置弹出窗口高度
        if (options.height > $(".JDialog_MainLayer").height()) {
            $(".JDialog_MainLayer").height(options.height + 4);
            $(".JDialog_MainLayer_Shadow").height(options.height);
            $(".JDialog_MainLayer_Main").height(options.height);
            $(".JDialog_MainLayer_Main_Middle").height(options.height - 10 - $(".JDialog_MainLayer_Main_Top").height() - $(".JDialog_MainLayer_Main_Botton").height());
            //针对IE6中有下拉框，起到遮盖做用
            $(".JDialog_MainLayer_Iframe").height(options.height + 4);
        }

        //设置弹出窗口中显示内容
        if ($.trim(options.text).length > 0) {
            $(".JDialog_MainLayer_Main_Middle>p").html(options.text);
        }

        if (options.html.length > 0) {
            $(".JDialog_MainLayer_Main_Middle").html(options.html);
        }

        //设置弹出窗口标题
        if ($.trim(options.tooltitle).length > 0) {
            $(".JDialog_MainLayer_Main_Top>div").html(options.tooltitle);
            //计算标题DIV宽度，要减两20间距
            $(".JDialog_MainLayer_Main_Top>div").width($(".JDialog_MainLayer_Main_Top").width() - 20 - $(".JDialog_MainLayer_Main_Top>a").width() - 20);
        }

        //添加取消按钮
        if (options.confirm) {
            $(".JDialog_MainLayer_Main_Botton").append("&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" value=\"取消\" />");
        }


        if (options.isAClose) {
            //a关闭弹出层,判断页面需不需要重新加载
            $(".JDialog_MainLayer_Main_Top>a").click(function () {
                $(this).JDialogClose();

                //重新加载
                if (options.closeReLoad) {
                    location.reload();
                }

                return false;
            });
        }



        //button关闭弹出层
        $(".JDialog_MainLayer_Main_Botton>input:last").click(function () {
            $(this).JDialogClose();
        });

        //按钮添加事件
        if (options.confirm) {
            $(".JDialog_MainLayer_Main_Botton>input:first").click(function (i) {
                $(this).JDialogClose();
                options.buttonClick(options.buttonClickVal);
            });
        }

        //动画弹出效果
        switch (options.animate) {
            case "": break;
            case "show": $(".JDialog_MainLayer").hide();
                $(".JDialog_MainLayer").show("slow");
                break;
            case "fade": $(".JDialog_MainLayer").hide();
                $(".JDialog_MainLayer").fadeIn("slow");
                break;
        }

        //对话框支持拖拽
        if (options.move) {
            var moveState = false; //移动标记  
            var tmpX, tmpY; //鼠标离控件左上角的相对位置  
            $(".JDialog_MainLayer").click(function () {
                //点击（松开后触发）  
            }).mousedown(function (e) {
                $(".JDialog_MainLayer").css("cursor", "move");
                moveState = true;
                tmpX = e.pageX - parseInt($(".JDialog_MainLayer").css("left"));
                tmpY = e.pageY - parseInt($(".JDialog_MainLayer").css("top"));
            });
            $(document).mousemove(function (e) {
                if (moveState) {
                    var x = e.pageX - tmpX; //移动时根据鼠标位置计算控件左上角的绝对位置  
                    var y = e.pageY - tmpY;
                    $(".JDialog_MainLayer").css({ top: y, left: x }); //控件新位置  
                }
            }).mouseup(function () {
                moveState = false;
                $(".JDialog_MainLayer").css("cursor", "");
            });
        }
    },

    JDialogClose: function () {
        $(".JDialog_MainLayer").remove();
        $(".JDialog_OpacityLayer").remove();
    }
});
//})(jQuery);