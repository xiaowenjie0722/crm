<%@ page import="util.TimeUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 肖文杰
  Date: 2019/9/22
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="左右结构项目，属于大人员的社交工具">
<meta name="keywords" content="左右结构项目 社交 占座 ">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>客户关系管理系统</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nouislider.js"></script>
<script src="js/html5.js"></script>
<script src="js/respond.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
    <style>

    </style>
<script>
    $(function() {
        $(".meun-item").click(function() {
            $(".meun-item").removeClass("meun-item-active");
            $(this).addClass("meun-item-active");
            var itmeObj = $(".meun-item").find("img");
            itmeObj.each(function() {
                var items = $(this).attr("src");
                items = items.replace("_grey.png", ".png");
                items = items.replace(".png", "_grey.png")
                $(this).attr("src", items);
            });
            var attrObj = $(this).find("img").attr("src");
            ;
            attrObj = attrObj.replace("_grey.png", ".png");
            $(this).find("img").attr("src", attrObj);
        });
        $("#topAD").click(function() {
            $("#topA").toggleClass(" glyphicon-triangle-right");
            $("#topA").toggleClass(" glyphicon-triangle-bottom");
        });
        $("#topBD").click(function() {
            $("#topB").toggleClass(" glyphicon-triangle-right");
            $("#topB").toggleClass(" glyphicon-triangle-bottom");
        });
        $("#topCD").click(function() {
            $("#topC").toggleClass(" glyphicon-triangle-right");
            $("#topC").toggleClass(" glyphicon-triangle-bottom");
        });
        $(".toggle-btn").click(function() {
            $("#leftMeun").toggleClass("show");
            $("#rightContent").toggleClass("pd0px");
        })
        $("#set").click(function () {
            alert("您无操作权限，请联系系统管理员")
        })
        $("#limit").click(function () {
            alert("您无操作权限，请联系系统管理员")
        })
    })
    function quit() {
        location.href="/quit";
    }
    function IFrameResize()
    {
        //得到父页面的iframe框架的对象
        var obj = parent.document.getElementById("mainFrame");
        //把当前页面内容的高度动态赋给iframe框架的高
        obj.height = this.document.body.scrollHeight;
    }
</script>
</head>
<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="左右结构项目" src="images/logo.png"><span>客户管理系统</span></p>
        </div>
        <div id="personInfor">
            <p id="userName"><h7>当前用户：</h7>${name}</p>
            <p><a id="quit" onclick="quit()" style="text-decoration: none">退出登录</a></p>
            <p>当前日期：<br>
            <%=TimeUtil.time()%></p>
        </div>
        <div class="meun-title">账号管理</div>
        <div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"><img src="images/icon_user_grey.png">客户管理</div>
        <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">修改密码</div>
        <%--<div class="meun-item" href="#attr" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">配置管理</div>
        <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">权限管理</div>--%>
        <c:choose>
            <c:when test="${status==0}">
                <div class="meun-item" href="#attr" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">配置管理</div>
                <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">权限管理</div>
            </c:when>
            <c:otherwise>
                <div class="meun-item" aria-controls="char" role="tab" data-toggle="tab" id="set"><img src="images/icon_chara_grey.png">配置管理</div>
                <div class="meun-item"  aria-controls="char" role="tab" data-toggle="tab" id="limit"><img src="images/icon_chara_grey.png">权限管理</div>
            </c:otherwise>
        </c:choose>
        <div class="meun-item" href="#log" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">日志管理</div>
    </div>
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
        <!--客户管理模块-->
            <div role="tabpanel" class="tab-pane" id="user">
                <iframe src="/customerMenu" id="2" scrolling="no" frameborder="no" align="center" allowfullscreen="true" allow="autoplay"
                        style="width: 100%; height: 800px;">
                </iframe>
        </div>
        <!-- 修改密码模块 -->
            <div role="tabpanel" class="tab-pane" id="chan">
                <iframe src="editPwd.jsp" id="3" scrolling="no" frameborder="no" align="center" allowfullscreen="true" allow="autoplay" style="width: 100%; height: 800px;">
                </iframe>
    </div>
            <%--         配置管理   --%>
            <div role="tabpanel" class="tab-pane" id="attr">
                <iframe src="/userServlet" id="mainFrame" scrolling="no" frameborder="no" align="center"
                        allowfullscreen="true" allow="autoplay" style="width: 100%; height: 800px;">
                </iframe>
            </div>
            <%--            权限管理--%>
            <div role="tabpanel" class="tab-pane" id="char">
                <iframe src="/limitServlet" id="1" scrolling="no" frameborder="no" align="center" allowfullscreen="true" allow="autoplay"
                        style="width: 100%; height: 800px;">
                </iframe>

            </div>
            <%--            日志管理--%>
            <div role="tabpanel" class="tab-pane" id="log">
                <iframe src="/logServlet"  scrolling="no" frameborder="no" align="center" allowfullscreen="true" allow="autoplay"
                        style="width: 100%; height: 800px;">
                </iframe>

            </div>
</div>
</div>
</div>
</body>
</html>
