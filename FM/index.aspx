<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="/js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/js/Guid.js" type="text/javascript"></script>
    <link href="/js/JDialog/JDialogCss.css" rel="stylesheet" />
    <script src="/js/JDialog/Jquery_Fn_Dialog.js" type="text/javascript"></script>
    <link href="js/ztree/zTreeStyle.css" rel="stylesheet" />
    <link href="js/ztree/demo.css" rel="stylesheet" />
    <script src="js/ztree/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
    <script src="js/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <script src="js/uploadify/swfobject.js" type="text/javascript"></script>
    <link href="js/uploadify/uploadify.css" rel="stylesheet" />
    <script src="js/uploadify/uploadify.js" type="text/javascript"></script>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        .fm_main_alert {
            width: 269px;
            background-color: #ba8e35;
            color: #fff;
            font-size: 12px;
            height: 25px;
            line-height: 25px;
            margin: 30px 45%;
            position: absolute;
            text-align: center;
            display: none;
        }

        .fm_main_top {
            background: url("/images/outer_bn2_8960d8f.gif") repeat-x scroll left -53px #f7f7f7;
            border-bottom: 1px solid #d2d2d2;
            height: 50px;
            line-height: 50px;
        }

        .fm_main_top_left {
            float: left;
            width: 200px;
            margin-left: 10px;
        }

        .fm_main_top_left_a1 {
            background: url(/images/btn_icon.gif) 0 -416px no-repeat;
            display: inline-block;
            width: 65px;
            height: 28px;
            line-height: 26px;
            line-height: 29px\9;
            padding-left: 31px;
            color: #666;
            vertical-align: middle;
            margin: 0 0 0 5px;
            _position: relative;
            _top: 12px;
            font-size: 12px;
            cursor: pointer;
        }

            .fm_main_top_left_a1:hover {
                background-position: 0 -448px;
            }

        .fm_main_top_left_a2 {
        }

            .fm_main_top_left_a2:hover {
            }

        .fm_main_top_right {
            float: right;
        }

        .fm_main_top_right_a1 {
            background: url("/images/btn_icon.gif") no-repeat scroll -100px -268px;
            float: right;
            height: 29px;
            margin: 12px 18px 0 0;
            width: 32px;
        }

        .fm_main_top_right_a1_hover {
            background-position: -100px -238px;
        }

        .fm_main_top_right_a2 {
            background: url("/images/btn_icon.gif") no-repeat scroll -66px -238px;
            float: right;
            height: 29px;
            margin: 12px 0 0;
            width: 32px;
        }

        .fm_main_top_right_a2_hover {
            background-position: -66px -268px;
        }

        .fm_main_file {
            font-size: 12px;
            padding: 15px;
        }

        .fm_main_file_opare {
            background: none repeat scroll 0 0 #f2f6ff;
            border: 1px solid #d2d2d2;
            border-radius: 2px;
            color: #666;
            height: 41px;
            left: 0;
            line-height: 41px;
            margin: 0 10px;
        }

        .fm_main_file_area {
            height: 500px;
            overflow: auto;
            overflow-x: hidden;
            margin: 0 15px;
        }

            .fm_main_file_area li {
                list-style: none;
                float: left;
                height: 122px;
                margin: 4px 4px 0 0;
                text-align: center;
                width: 143px;
            }

        .fm_main_file_area_li_div1 {
            background: url("/images/spritenew-f.gif") no-repeat scroll -24px 0;
            width: 90px;
            height: 92px;
            margin-left: 26px;
            border: 2px solid #fff;
        }

            .fm_main_file_area_li_div1 span {
                background: url("/images/btn_icon.gif") no-repeat scroll 6px -305px;
                height: 30px;
                position: absolute;
                width: 30px;
                margin-left: -53px;
                margin-top: -8px;
                display: none;
            }

        .fm_main_file_area_li_div2 {
            background: none;
            font-size: 12px;
            width: 100%;
            height: 25px;
            margin-left: 0px;
            margin-top: 5px;
        }

        .fm_main_file_area_li_div3 {
            text-align: left;
        }

        .fm_main_file_area_li_div4 {
            background: url("/images/spritenew-f.gif") no-repeat scroll -24px 0;
            width: 90px;
            height: 92px;
            margin-left: 26px;
            border: 2px solid #fff;
        }

        .box {
            background: none repeat scroll 0 0 #fff;
            border: 1px solid #d2d2d2;
            height: 18px;
            padding: 2px 3px;
            vertical-align: middle;
            width: 75px;
        }

        .sure {
            background: url("/images/btn_icon.gif") repeat scroll 0 -512px;
            cursor: pointer;
            display: inline-block;
            height: 22px;
            vertical-align: middle;
            width: 22px;
        }

        .cancel {
            background: url("/images/btn_icon.gif") repeat scroll -27px -512px;
            cursor: pointer;
            display: inline-block;
            height: 22px;
            vertical-align: middle;
            width: 22px;
        }

        .fm_main_menu {
            height: 180px;
            width: 100px;
            border-top: #d2d2d2 1px solid;
            border-left: #d2d2d2 1px solid;
            border-right: #d2d2d2 1px solid;
            font-size: 12px;
            position: absolute;
            display: none;
            z-index: 99;
        }

            .fm_main_menu li {
                list-style: none;
                border-bottom: #d2d2d2 1px solid;
                background-color: #fff;
                height: 25px;
            }

                .fm_main_menu li a {
                    cursor: pointer;
                    text-decoration: none;
                    display: inline-block;
                    padding-left: 25px;
                    padding-top: 3px;
                    padding-bottom: 3px;
                    height: 18px;
                    width: 75px;
                }

                    .fm_main_menu li a:hover {
                        background-color: #e9e9e9;
                    }

        .fm_main_menu_check {
            display: inline-block;
            float: left;
            margin-left: 10px;
            margin-right: 5px;
            margin-top: 14px;
        }

        .fm_main_menu_font {
            float: left;
            font-size: 12px;
        }

        .fm_main_menu_btn {
            height: 28px;
            width: 450px;
            margin-top: 5px;
            margin-left: 10px;
            display: none;
            float: left;
        }

            .fm_main_menu_btn li {
                list-style: none;
                float: left;
                margin-right: 6px;
                width: 69px;
                height: 100%;
            }

                .fm_main_menu_btn li a {
                    padding-left: 61px;
                    padding-top: 11px;
                    cursor: pointer;
                    text-decoration: none;
                }

                    .fm_main_menu_btn li a.fxbtn {
                        background-image: url("/images/fx001.png");
                    }

                        .fm_main_menu_btn li a.fxbtn:hover {
                            background-image: url("/images/fx002.png");
                        }

                    .fm_main_menu_btn li a.xzbtn {
                        background-image: url("/images/xz001.png");
                    }

                        .fm_main_menu_btn li a.xzbtn:hover {
                            background-image: url("/images/xz002.png");
                        }

                    .fm_main_menu_btn li a.scbtn {
                        background-image: url("/images/sc001.png");
                    }

                        .fm_main_menu_btn li a.scbtn:hover {
                            background-image: url("/images/sc002.png");
                        }

                    .fm_main_menu_btn li a.fzbtn {
                        background-image: url("/images/fz001.png");
                    }

                        .fm_main_menu_btn li a.fzbtn:hover {
                            background-image: url("/images/fz002.png");
                        }

                    .fm_main_menu_btn li a.ydbtn {
                        background-image: url("/images/yd001.png");
                    }

                        .fm_main_menu_btn li a.ydbtn:hover {
                            background-image: url("/images/yd002.png");
                        }

                    .fm_main_menu_btn li a.cmmbtn {
                        background-image: url("/images/cmm001.png");
                    }

                        .fm_main_menu_btn li a.cmmbtn:hover {
                            background-image: url("/images/cmm002.png");
                        }
    </style>


    <script type="text/javascript">

        //选中记录
        var li_selected = "";
        //1添加，2修改
        var addOrUpdate = 0;
        //文件夹名
        var fileName = "";
        //1复制，2移动
        var copyOrMove = 0;
        //选中树节点ID
        var treeNodeID_selected = "";

        $(function () {

            getFiles($("#hidParentID").val());

            //LI文件夹层移入移出
            $(".fm_main_file_area li").live("mouseover", function () {
                var index = $(".fm_main_file_area li").index($(this));
                if (li_selected.indexOf("|" + index + "|") < 0) {
                    $(this).find(".fm_main_file_area_li_div1").eq(0).css("border", "2px solid #2e80dc").find("span").eq(0).show();
                }
            });
            $(".fm_main_file_area li").live("mouseout", function () {
                var index = $(".fm_main_file_area li").index($(this));
                if (li_selected.indexOf("|" + index + "|") < 0) {
                    $(this).find(".fm_main_file_area_li_div1").eq(0).css("border", " 2px solid #fff").find("span").eq(0).hide();
                }
            });

            $(".fm_main_file_area_li_div1").live("click", function () {
                if ($(this).parent().attr("state") == "0") {
                    location.href = "index.aspx?file=" + $(this).parents("li").attr("fid");
                }
            });

            //LI文件夹点击记录
            $(".fm_main_file_area_li_div1 span").live("click", function () {
                var index = $(".fm_main_file_area li").index($(this).parents("li"));
                if (li_selected.indexOf("|" + index + "|") > -1) {
                    $(this).hide().css("background-position", "6px -305px").parent().css("border", "2px solid #fff");
                    li_selected = li_selected.replace("|" + index + "|", "");
                }
                else {
                    $(this).show().css("background-position", "6px -340px").parent().css("border", "2px solid #2e80dc");
                    li_selected += "|" + index + "|";
                }

                FileSizeAndDelBtn();
                return false;
            });

            //文件夹/文件全选
            $(".fm_main_menu_check").bind("click", function () {
                li_selected = "";
                var tf = $(this).is(":checked");
                $(".fm_main_file_area li").each(function (i) {
                    if (tf) {
                        $(this).find(".fm_main_file_area_li_div1").css("border", "2px solid #2e80dc").find("span").show().css("background-position", "6px -340px");
                        li_selected += "|" + i + "|";
                    }
                    else {
                        $(this).find(".fm_main_file_area_li_div1").css("border", "2px solid #fff").find("span").hide().css("background-position", "6px -305px");
                        li_selected = "";
                    }

                });

                FileSizeAndDelBtn();
            });

            //鼠标右键层
            $(".fm_main_file_area li").live("contextmenu", function (e) {
                if (e.which == 3) {
                    //获取序号
                    var index = $(".fm_main_file_area li").index($(this));
                    if (li_selected.indexOf("|" + index + "|") < 0) {
                        //清除选中样式
                        $(".fm_main_file_area_li_div1").css("border", "2px solid #fff");
                        $(".fm_main_file_area_li_div1 span").hide().css("background-position", "6px -305px");
                        //设置选中样式
                        $(this).find(".fm_main_file_area_li_div1").css("border", "2px solid #2e80dc").find("span").show().css("background-position", "6px -340px");
                        li_selected = "|" + index + "|";
                    }
                    if ($(this).attr("state") == "1") {
                        $(".fm_main_menu li:eq(0)").css("color", "#c0c0c0").find("a").unbind("click");//打开
                        $(".fm_main_menu li:eq(5)").removeAttr("style").find("a").bind("click", fm_main_menu_down);//下载
                    }
                    else {
                        $(".fm_main_menu li:eq(0)").removeAttr("style").find("a").bind("click", fm_main_menu_open);//打开
                        $(".fm_main_menu li:eq(5)").css("color", "#c0c0c0").find("a").unbind("click");//下载
                    }
                    $(".fm_main_menu").css({ "margin-top": e.clientY - 20, "margin-left": e.clientX - 10 }).show();
                }
                return false;
            });

            //鼠标移出菜单层，隐藏
            $(".fm_main_menu").bind("mouseleave", function () {
                $(".fm_main_menu").hide();
            });



            //创建临时文件夹
            $(".fm_main_top_left_a1").bind("click", function () {
                var html = "";
                html += "<li fid='" + Guid.NewGuid().ToString("D") + "' state=\"0\">";
                html += "   <div class=\"fm_main_file_area_li_div4\">";
                html += "       <span></span>";
                html += "   </div>";
                html += "   <div class=\"fm_main_file_area_li_div3\">";
                html += "       <input class=\"box\" type=\"text\" value=\"新建文件夹\" />";
                html += "       <span class=\"sure\" />";
                html += "       <span class=\"cancel\" />";
                html += "   </div>";
                html += "</li>";
                $(".fm_main_file_area").prepend(html);
                $(".fm_main_top_left_a1").unbind("click");
                addOrUpdate = 1;
            });

            //确认
            $(".sure").live("click", function () {
                var fileID = $(this).parents("li").attr("fid");
                fileName = $(this).prev().val();
                var parentID = $("#hidParentID").val();
                switch (addOrUpdate) {
                    case 1:
                        addFiles(fileID, parentID);
                        break;
                    case 2:
                        ReNameFile(fileID);
                        break;
                }
                addOrUpdate = 0;
                $(".fm_main_top_left_a1").bind("click");
            });

            //取消
            $(".cancel").live("click", function () {
                switch (addOrUpdate) {
                    case 1:
                        $(this).parents("li").remove();
                        break;
                    case 2:
                        reNameReplace();
                        break;
                }
                addOrUpdate = 0;
                $(".fm_main_top_left_a1").bind("click");
            });

            //打开
            function fm_main_menu_open() {
                var index = li_selected.substring(0, li_selected.length - 1).substring(1);
                var $li = $(".fm_main_file_area li:eq(" + index + ")");
                location.href = "index.aspx?file=" + $li.attr("fid");
            }

            //复制
            $(".fm_main_menu a:eq(1)").bind("click", function () {
                copyOrMove = 1;
                filesDialogShow();
                $(".fm_main_menu").hide();
            });

            //移动
            $(".fm_main_menu a:eq(2)").bind("click", function () {
                copyOrMove = 2;
                filesDialogShow();
                $(".fm_main_menu").hide();
            });

            //重命名
            $(".fm_main_menu a:eq(3)").bind("click", function () {
                var index = li_selected.substring(0, li_selected.length - 1).substring(1);
                var $li = $(".fm_main_file_area li:eq(" + index + ")");
                fileName = $li.find(".fm_main_file_area_li_div2").html();
                var html = "";
                html += "   <div class=\"fm_main_file_area_li_div3\">";
                html += "       <input class=\"box\" type=\"text\" value=\"" + fileName + "\" />";
                html += "       <span class=\"sure\" />";
                html += "       <span class=\"cancel\" />";
                html += "   </div>";
                $(".fm_main_file_area li:eq(" + index + ")").find(".fm_main_file_area_li_div2").replaceWith(html);
                $(".fm_main_menu").hide();
                addOrUpdate = 2;
            });

            //删除-AJAX-隐藏菜单
            $(".fm_main_menu a:eq(4)").bind("click", function () {
                var index = li_selected.substring(0, li_selected.length - 1).substring(1);
                var $li = $(".fm_main_file_area li:eq(" + index + ")");
                DeleteFile($li.attr("fid"));
                $(".fm_main_menu").hide();
            });

            //下载
            function fm_main_menu_down() {
                var index = li_selected.substring(0, li_selected.length - 1).substring(1);
                var $li = $(".fm_main_file_area li:eq(" + index + ")");
                window.location.href = "/upload/" + $li.attr("fid") + "." + $li.attr("type");
                $(".fm_main_menu").hide();
            }

            //分享
            $(".fm_main_menu a:eq(6)").bind("click", function () {
                var index = li_selected.substring(0, li_selected.length - 1).substring(1);
                var $li = $(".fm_main_file_area li:eq(" + index + ")");
                $(".fm_main_menu").hide();
            });

            //多文件删除
            $(".scbtn").bind("click", function () {
                var tf = true;
                var fileIDs = "";
                $(".fm_main_file_area_li_div1 span:visible").each(function () {
                    if ($(this).parents("li").attr("state") == "0") {
                        tf = false;
                        return;
                    }
                    else {
                        fileIDs += "|" + $(this).parents("li").attr("fid");
                    }
                });

                if (tf) {
                    if (fileIDs.length > 0) {
                        DeleteFiles(fileIDs.substring(1));
                    }
                }
                else {
                    SysAlert("选择文件中存在文件夹，无法删除");
                }
            });
        });

        //获取文件夹集
        function getFiles(fileID) {
            var html = "";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/GetFiles",
                data: "{FileID:'" + fileID + "'}",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    $.each(data.d, function (x, item) {
                        html += FileHtml(item.ID, item.Name, item.Type, item.state);
                    });
                    $(".fm_main_file_area").html(html);
                }
            });
        }

        //获取文件夹集
        function addFiles(fileID, parentID) {
            var html = "";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/CreateFile",
                data: "{FileID:'" + fileID + "',FileName:'" + fileName + "',FileParentID:'" + parentID + "'}",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    if (data.d == 1) {
                        reNameReplace(fileName);
                    }
                    else {
                        alert("Error");
                    }
                }
            });
        }

        //获取文件夹集
        function ReNameFile(fileID) {
            var html = "";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/ReNameFile",
                data: "{NewFileName:'" + fileName + "',FileID:'" + fileID + "'}",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    if (data.d == 1) {
                        reNameReplace(fileName);
                    }
                    else {
                        alert("Error");
                    }
                }
            });
        }

        //删除文件夹集
        function DeleteFile(fileID) {
            var html = "";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/DeleteFile",
                data: "{FileID:'" + fileID + "'}",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    if (data.d == 1) {
                        $("[fid='" + fileID + "']").remove();
                    }
                    else {
                        alert("Error");
                    }
                }
            });
        }

        //删除多个文件
        function DeleteFiles(fileIDs) {
            var html = "";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/DeleteFiles",
                data: "{FileIDs:'" + fileIDs + "'}",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    if (data.d == 1) {
                        var arr = fileIDs.split('|');
                        for (var i = 0; i < arr.length; i++) {
                            $("[fid='" + arr[i] + "']").remove();
                        }
                        SysAlert("完成删除")
                    }
                    else {
                        alert("Error");
                    }
                }
            });
        }

        //复制文件夹集
        function CopyFile(fileID, fileParentID) {
            var html = "";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/CopyFile",
                data: "{FileID:'" + fileID + "',FileParentID:'" + fileParentID + "'}",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    if (data.d == 1) {
                        SysAlert("完成复制")
                    }
                    else {
                        alert("Error");
                    }
                }
            });
        }

        //移动文件夹集
        function MoveFile(fileID, fileParentID) {
            var html = "";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/MoveFile",
                data: "{FileID:'" + fileID + "',FileParentID:'" + fileParentID + "'}",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    if (data.d == 1) {
                        $("[fid='" + fileID + "']").remove();
                        SysAlert("完成移动")
                    }
                    else {
                        alert("Error");
                    }
                }
            });
        }

        //显示弹出窗口
        function filesDialogShow() {
            var html = "";
            html += "<div class=\"zTreeDemoBackground left\" >";
            html += "    <ul id=\"treeDemo\" class=\"ztree\" >";
            html += "    </ul>";
            html += "</div>";
            $(document).JDialog({
                confirm: true,
                width: 408,
                height: 340,
                html: html,
                buttonClick: filesTreeClick
            });
            filesTreeShow();
        }

        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onClick: zTreeOnClick
            }
        };

        //显示文件夹树
        function filesTreeShow() {
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/WebService.asmx/GetAllFilesForTree",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(XMLHttpRequest);
                },
                //timeout: 1000, // 设置请求超时时间
                success: function (data) { // 请求成功后回调函数 参数：服务器返回数据,数据格式.
                    //树绑定     
                    var treeObj = $("#treeDemo");
                    $.fn.zTree.init(treeObj, setting, eval(data.d));

                }
            });
        }

        function zTreeOnClick(event, treeId, treeNode) {
            treeNodeID_selected = treeNode.id;
        }

        function filesTreeClick() {
            var index = li_selected.substring(0, li_selected.length - 1).substring(1);
            var $li = $(".fm_main_file_area li:eq(" + index + ")");
            switch (copyOrMove) {
                case 1:
                    CopyFile($li.attr("fid"), treeNodeID_selected);
                    break;
                case 2:
                    MoveFile($li.attr("fid"), treeNodeID_selected);
                    break;
            }
            copyOrMove = 0;
            $(document).JDialogClose();
        }

        //DIV层替换
        function reNameReplace() {
            $(".fm_main_file_area_li_div3").parents("li").find("fm_main_file_area_li_div4").attr("class", "fm_main_file_area_li_div1").attr("title", fileName);
            $(".fm_main_file_area_li_div3").replaceWith("<div class=\"fm_main_file_area_li_div2\">" + fileName + "</div>");
        }

        //上方小提示块
        function SysAlert(meg) {
            $(".fm_main_alert").html(meg).fadeIn("slow", function () {
                $(this).fadeOut("slow");
            });
        }

        //字符串截取 0不截
        function StringCurt(val, len) {
            val = val.replace(".null", "");
            if (len == 0) {
                return val;
            }
            if (val.length > len) {
                return val.substring(0, len) + "...";
            }
            return val;
        }

        //LI文件Html拼装
        function FileHtml(ID, Name, Type, State) {
            var html = "";
            html += "<li fid='" + ID + "' title=\"" + StringCurt(Name + "." + Type, 0) + "\" state=\"" + State + "\" type=\"" + Type + "\">"
            html += "   <div class=\"fm_main_file_area_li_div1\"";
            switch (State) {
                case 0:
                    html += ">";
                    html += "       <span></span>";
                    break;
                case 1:
                    if (Type == "png" || Type == "jpg" || Type == "gif") {
                        html += " style=\"background: none\"><img src=\"/upload/" + ID + "." + Type + "\" width=\"90\" height=\"92\"";
                        html += ">";
                        html += "       <span style=\"margin-left:-98px;\"></span>";
                    }
                    else {
                        html += " style=\"background: url(/images/" + Type + ".png) no-repeat\"";
                        html += ">";
                        html += "       <span></span>";
                    }
                    break;
            }

            html += "   </div>";
            html += "   <div class=\"fm_main_file_area_li_div2\">" + StringCurt(Name + "." + Type, 13) + "</div>";
            html += "</li>";
            return html;
        }

        //文件选择数和删除按钮 显示/隐藏
        function FileSizeAndDelBtn() {
            if (li_selected == "") {
                $(".fm_main_menu_font").html("选择文件");
                $(".fm_main_menu_btn").hide();
            }
            else {
                $(".fm_main_menu_font").html("已选中" + $(".fm_main_file_area_li_div1 span:visible").size() + "个文件/文件夹");
                $(".fm_main_menu_btn").show();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <ul class="fm_main_menu">
            <li><a>打开</a></li>
            <li><a>复制</a></li>
            <li><a>移动</a></li>
            <li><a>重命名</a></li>
            <li><a>删除</a></li>
            <li><a>下载</a></li>
            <li><a>分享</a></li>
        </ul>

        <asp:HiddenField ID="hidParentID" runat="server" Value="00000000-0000-0000-0000-000000000000" />

        <div class="fm_main_alert">
            离线文件因含有违规内容被系统屏蔽无法下载
        </div>

        <div class="fm_main_top">
            <div class="fm_main_top_left">
                <div id="file_upload">
                </div>
                <a class="fm_main_top_left_a1">新建文件夹</a>
                <a class="fm_main_top_left_a2"></a>
            </div>
            <div class="fm_main_top_right">
                <a class="fm_main_top_right_a1"></a>
                <a class="fm_main_top_right_a2"></a>
            </div>
        </div>
        <div class="fm_main_file">
            全部文件
        </div>
        <div class="fm_main_file_opare">
            <input type="checkbox" value="选择文件" class="fm_main_menu_check" />
            <label class="fm_main_menu_font">选择文件</label>
            <ul class="fm_main_menu_btn">
                <%--<li><a class="fzbtn">&nbsp;</a></li>
                <li><a class="ydbtn">&nbsp;</a></li>
                <li><a class="cmmbtn">&nbsp;</a></li>--%>
                <li><a class="scbtn">&nbsp;</a></li>
                <%--<li><a class="xzbtn">&nbsp;</a></li>
                <li><a class="fxbtn">&nbsp;</a></li>--%>
            </ul>
        </div>
        <ul class="fm_main_file_area">
            <%--<li>
                <div class="fm_main_file_area_li_div1">
                    <span></span>
                </div>
                <div class="fm_main_file_area_li_div2">新建文件夹1</div>
                <div class="fm_main_file_area_li_div3">
                    <input class="box" type="text" />
                    <span class="sure"></span>
                    <span class="cancel"></span>
                </div>
            </li>
            <li>
                <div class="fm_main_file_area_li_div1">
                    <span></span>
                </div>
                <div class="fm_main_file_area_li_div2">新建文件夹2</div>
            </li>--%>
        </ul>
        <div class="fm_main_queue">
            <div class="fm_main_queue_head">
                上传完成

                <a class="fm_main_queue_head_close"></a>
                <a class="fm_main_queue_head_max"></a>
                <a class="fm_main_queue_head_min"></a>
            </div>
            <div id="uploadfileQueue">
            </div>
        </div>
    </form>
</body>
</html>
