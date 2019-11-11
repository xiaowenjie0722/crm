<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2019/9/23
  Time: 15:07
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
    <script>
        $(function() {
            if (<%=session.getAttribute("id")==null%>){
                location.href="login.jsp";
            }
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
        })
    </script>
    <script>
        $(function () {
            var id=1;

        })
    </script>
    <script language="JavaScript">
        /*判断修改的密码是否一致*/
        function validate() {
            var Knot = document.getElementById("Knot").value;
            var nKnot = document.getElementById("nKnot").value;
            var rKnot = document.getElementById("rKnot").value;
            /*对比两次输入的密码*/
            if(nKnot == rKnot){
                if (nKnot != "" && rKnot !="" && Knot !="") {
                    document.getElementById("tishi").innerHTML = "<font color='green'>密码相同，请进行下一步操作！</font>";
                    document.getElementById("id_submit").disabled = false;
                }else {
                    document.getElementById("tishi").innerHTML="<font color='red'>密码不能为空！</font>";
                    document.getElementById("id_submit").disabled = true;
                }
            }else {
                document.getElementById("tishi").innerHTML="<font color='red'>密码不一致，请重新输入！</font>";
                document.getElementById("id_submit").disabled = true;
            }
        }
    </script>

</head>
<body>

<!-- 修改密码模块 -->
<div role="tabpanel" class="tab-pane" id="rightContent">
<div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
    <form name="form1" class="form-horizontal" action="updateServlet" method="get" >
        <div class="form-group" >
            <label  class="col-xs-4 control-label">原密码：</label>
            <div class="col-xs-5">
                <input type="text" class="form-control input-sm duiqi" required="true" missingMessage="原密码必须填写"  id="Knot" name="oldPassword" placeholder="" style="margin-top: 7px;" onkeyup="validate()">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-xs-4 control-label">新密码：</label>
            <div class="col-xs-5">
                <input type="text" class="form-control input-sm duiqi" required="true" missingMessage="新密码必须填写" id="nKnot" name="newPassword" placeholder=""  style="margin-top: 7px;" onkeyup="validate()">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">重复密码：</label>
            <div class="col-xs-5">
                <input type="text" class="form-control input-sm duiqi" required="true" missingMessage="重复密码必须填写" id="rKnot" name="againPassword" placeholder=""  style="margin-top: 7px;" onkeyup="validate()"/>
            </div>
        </div>
        <div><span id="tishi"></span></div>
        <%
           String str = (String) request.getAttribute("return");
        %>
        <div><span><%=str!=null?str:""%></span></div>
        <div class="form-group text-right">
            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                <%--<button type="reset" class="btn btn-xs btn-white">取 消</button>--%>
                <%--<button type="submit" class="btn btn-xs btn-green">保存</button>--%>
                <input type="submit" class="btn btn-xs btn-green" value="提交" id="id_submit">
                <input type="reset" class="btn btn-xs btn-green" value="重新输入">
            </div>
        </div>
    </form>
</div>
</div>
</body>
</html>
