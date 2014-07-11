<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WebApplication2.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            min-height: 350px;
            overflow: hidden;
        }

        .fm_div {
            overflow: hidden;
        }

        .fm_left_div {
            width: 210px;
            background-image: url(/images/aside-right-shadow.jpg);
            height: 100%;
            padding-top: 10px;
            float: left;
        }

        .fm_left_div_menu1 {
            width: 100%;
            height: 220px;
            font-size: 12px;
        }

            .fm_left_div_menu1 li {
                width: 100%;
                float: left;
                height: 33px;
                list-style: none;
                margin: 5px 0px;
            }

                .fm_left_div_menu1 li a {
                    margin-left: 45px;
                    padding-left: 29px;
                    padding-top: 3px;
                    margin-top: 6px;
                    text-decoration: none;
                    cursor: pointer;
                    display: inline-block;
                    padding-bottom: 6px;
                }

                    .fm_left_div_menu1 li a.mainMenu001 {
                        background: url("/images/mainMenu001.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu002 {
                        background: url("/images/mainMenu002.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu011 {
                        background: url("/images/mainMenu021.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu012 {
                        background: url("/images/mainMenu022.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu021 {
                        background: url("/images/mainMenu011.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu022 {
                        background: url("/images/mainMenu012.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu031 {
                        background: url("/images/mainMenu021.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu032 {
                        background: url("/images/mainMenu022.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu041 {
                        background: url("/images/mainMenu031.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu042 {
                        background: url("/images/mainMenu032.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu051 {
                        background: url("/images/mainMenu041.png") no-repeat;
                    }

                    .fm_left_div_menu1 li a.mainMenu052 {
                        background: url("/images/mainMenu042.png") no-repeat;
                    }

        .fm_left_div_line {
            border-bottom: 1px solid #f7f9fb;
            border-top: 1px solid #dce1e6;
            float: left;
            width: 100%;
            margin: 5px 0px;
        }

        .fm_right_div {
            float: left;
            height: 100%;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            var index = 0;

            $(".fm_left_div_menu1 li").hover(function () {
                var _index = $(".fm_left_div_menu1 li").index($(this));
                if (_index != index) {
                    $(this).css("background", "url(/images/aside-hover-on.png) repeat-y scroll right top").find("a").attr("class", "mainMenu0" + _index + "2");
                }
            }, function () {
                var _index = $(".fm_left_div_menu1 li").index($(this));
                if (_index != index) {
                    $(this).removeAttr("style").find("a").attr("class", "mainMenu0" + _index + "1");
                }
            });

            $(".fm_left_div_menu1 li").click(function () {
                $(".fm_left_div_menu1 li").removeAttr("style");
                $(".fm_left_div_menu1 a").each(function (i) {
                    $(this).attr("class", "mainMenu0" + i + "1");
                });
                index = $(".fm_left_div_menu1 li").index($(this));
                $(this).css("background", "url(/images/aside-hover-on.png) repeat-y scroll 0 33px").find("a").attr("class", "mainMenu0" + index + "2");
            });





            initpos();

            $(window).resize(function () {
                initpos();
            });
            function initpos() {
                $(".fm_div").height($(window).height());
                $(".fm_right_div").width($(window).width() - $(".fm_left_div").width());
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="fm_div">
            <div class="fm_left_div">
                <ul class="fm_left_div_menu1">
                    <li style="background: url(/images/aside-hover-on.png) repeat-y scroll 0 33px;"><a class="mainMenu002">个人文件</a></li>
                    <li><a class="mainMenu011">个人共享</a></li>
                    <li><a class="mainMenu021">单位文件</a></li>
                    <li><a class="mainMenu031">本单位共享</a></li>
                    <li><a class="mainMenu041">其它单位共享</a></li>
                    <div class="fm_left_div_line"></div>
                    <li><a class="mainMenu051">个人回收站</a></li>
                </ul>
            </div>
            <div class="fm_right_div">
                <iframe width="100%" name="navvMain" id="navvMain" src="index2.aspx" frameborder="no" scrolling="no" height="100%"></iframe>
            </div>
        </div>
    </form>
</body>
</html>
