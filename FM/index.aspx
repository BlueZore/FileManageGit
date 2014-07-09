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
            background: url("/images/btn_icon.gif") no-repeat scroll -100px -268px rgba(0, 0, 0, 0);
            float: right;
            height: 29px;
            margin: 12px 18px 0 0;
            width: 32px;
        }

        .fm_main_top_right_a1_hover {
            background-position: -100px -238px;
        }

        .fm_main_top_right_a2 {
            background: url("/images/btn_icon.gif") no-repeat scroll -66px -238px rgba(0, 0, 0, 0);
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
            background: url("/images/spritenew-f.gif") no-repeat scroll -24px 0 rgba(0, 0, 0, 0);
            width: 90px;
            height: 92px;
            margin-left: 26px;
            border: 2px solid #fff;
        }

            .fm_main_file_area_li_div1 span {
                background: url("/images/btn_icon.gif") no-repeat scroll 6px -305px rgba(0, 0, 0, 0);
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
            background: url("/images/spritenew-f.gif") no-repeat scroll -24px 0 rgba(0, 0, 0, 0);
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
            background: url("/images/btn_icon.gif") repeat scroll 0 -512px rgba(0, 0, 0, 0);
            cursor: pointer;
            display: inline-block;
            height: 22px;
            vertical-align: middle;
            width: 22px;
        }

        .cancel {
            background: url("/images/btn_icon.gif") repeat scroll -27px -512px rgba(0, 0, 0, 0);
            cursor: pointer;
            display: inline-block;
            height: 22px;
            vertical-align: middle;
            width: 22px;
        }

        .fm_main_menu {
            height: 130px;
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
                location.href = "index.aspx?file=" + $(this).parents("li").attr("fid");
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
                return false;
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
                html += "<li fid='" + Guid.NewGuid().ToString("D") + "'>";
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
            $(".fm_main_menu a:eq(0)").bind("click", function () {
                var index = li_selected.substring(0, li_selected.length - 1).substring(1);
                var $li = $(".fm_main_file_area li:eq(" + index + ")");
                location.href = "index.aspx?file=" + $li.attr("fid");
            });

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
                        html += "<li fid='" + item.ID + "'>";
                        html += "   <div class=\"fm_main_file_area_li_div1\">";
                        html += "       <span></span>";
                        html += "   </div>";
                        html += "   <div class=\"fm_main_file_area_li_div2\">" + item.Name + "</div>";
                        html += "</li>";
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

        //获取文件夹集
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
            $(".fm_main_file_area_li_div3").parents("li").find("fm_main_file_area_li_div4").attr("class", "fm_main_file_area_li_div1");
            $(".fm_main_file_area_li_div3").replaceWith("<div class=\"fm_main_file_area_li_div2\">" + fileName + "</div>");
        }

        function SysAlert(meg) {
            $(".fm_main_alert").html(meg).fadeIn("slow", function () {
                $(this).fadeOut("slow");
            });
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
    </form>
</body>
</html>
