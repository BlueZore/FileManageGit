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
    <link href="css/Common.css" rel="stylesheet" />
    <link href="css/FM1.css" rel="stylesheet" />
    <script src="js/Common.js" type="text/javascript"></script>
    <script src="js/FM1.js" type="text/javascript"></script>
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
                <a class="fm_main_top_right_a2" href="index2.aspx"></a>
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
