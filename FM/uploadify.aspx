<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadify.aspx.cs" Inherits="WebApplication2.uploadify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/js/uploadify/uploadify.css" rel="stylesheet" />
    <script src="js/jquery-1.4.1.min.js"></script>
    <script src="/js/uploadify/swfobject.js" type="text/javascript"></script>
    <script src="/js/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $("#file_upload").uploadify({
                buttonText: '',
                //flash
                swf: "/js/uploadify/uploadify.swf",
                //文件选择后的容器ID
                queueID: 'uploadfileQueue',
                uploader: '/UploadHandler.ashx',
                multi: false,
                fileTypeDesc: '支持的格式：',
                fileTypeExts: '*.jpg;*.jpge;*.gif;*.png;*.docx;*.doc;*.rar;*.xlsx;*.xls;*.zip;*.txt;*.pdf',
                removeTimeout: 10,
                fileSizeLimit: '25600',
                removeCompleted: false,

                //返回一个错误，选择文件的时候触发
                onSelectError: function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "K大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                },
                //检测FLASH失败调用
                onFallback: function () {
                    alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
                },
                //上传到服务器成功时，服务器返回相应信息到data里
                onUploadSuccess: function (file, data, response) {
                    alert("");
                }

            });
        });

        function doUplaod() {
            $('#file_upload').uploadify('upload', '*');
        }

        function closeLoad() {
            $('#file_upload').uploadify('cancel', '*');
        }
    </script>
    <style>
        .fm_main_queue {
        }

        .fm_main_queue_head {
            height: 39px;
            line-height: 39px;
            width: 372px;
            background: url("/images/sprite_n1_ccdf642.gif") repeat-x scroll 0 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="fm_main_queue">
            <div class="fm_main_queue_head">
            </div>
            <div id="uploadfileQueue" style="padding: 3px;">
            </div>
        </div>
        <div id="file_upload">
        </div>
    </form>
</body>
</html>
