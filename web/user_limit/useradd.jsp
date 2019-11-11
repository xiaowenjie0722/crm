<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2019/9/23
  Time: 15:06
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
    <title>Bootstrap左右结构响应式后台管理模板</title>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.nouislider.js"></script>
    <script src="../js/html5.js"></script>
    <script src="../js/respond.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/slide.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
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
            $("#return").click(function () {
                location.href="/userServlet";
            })
        })
        function turn() {
            location.href="/limitServlet?type=update&id=";
        }
    </script>
</head>
<body>
<div role="tabpanel" class="tab-pane" id="rightContent">
    <div class="data-div">
        <!--管理员页面-->
        <div class="tablebody">
            <div class="row">
                <form class="form-horizontal" action="/userServlet" method="post">
                    <input type="hidden" name="type" value="add"/>
                    <div>
                        <h4 class="modal-title" id="  ">添加用户信息</h4>
                        <span></span>
                    </div>
                    <div class="form-group ">
                        <label for="rootName" class="col-xs-3 control-label">用户名：</label>
                        <div class="col-xs-6 ">
                            <input type="text" class="form-control input-sm duiqi" id="rootName" name="name" required="true" missingMessage="必须填写">
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="rootmessage"--%><label for="rootMessage" class="col-xs-3 control-label">密码：</label>
                        <div class="col-xs-6 ">
                            <input type="text" class="form-control input-sm duiqi" name="password" required="true" missingMessage="必须填写"><br>
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="rootmessage"--%><label for="rootMessage" class="col-xs-3 control-label">电话号码：</label>
                        <div class="col-xs-6 ">
                            <input type="text" class="form-control input-sm duiqi" name="tel" required="true" missingMessage="必须填写"><br>
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="rootmessage"--%><label for="rootMessage" class="col-xs-3 control-label">权限状态码：</label>
                            <div class="col-xs-6 ">
                            <select name="limitNum" class="form-control input-sm duiqi">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select>
                            <input  class="form-control input-sm duiqi" type="submit" value="保存"/>
                            <button type="button" class="form-control input-sm duiqi" id="return">取 消</button>
                        </div>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>
</html>
