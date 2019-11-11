<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: 肖文杰
  Date: 2019/9/23
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户管理系统 </title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <script src="js/jQuery.js" ></script>
    <script>
        $(function () {
            if (!${empty id}){
               location.href="main.jsp"
            }
            <c:if test="${!empty error}">
            var text="<font color='red'>${error}</font>";
            $("#msg").html(text);
            </c:if>
            /*$(".submit").click(function(){
                $.post(
                    "login",
                    {
                        name:$("#name").val(),
                        password:$("#pwd").val(),
                        limit:$("#status").val()
                    },function(data,status){
                        if(data=="true"){
                            $(location).attr("href","/main.jsp");
                        }else {
                            $("#msg").html("<span style='color: red'>用户不存在或密码错误</span>")
                        }
                    }
                )
            })*/
        })
        // 回车登录
        /*$(document).keydown(function(event){
            if(event.keyCode==13){
                $.post(
                    "login",
                    {
                        name:$("#name").val(),
                        password:$("#pwd").val(),
                        limit:$("#status").val()
                    },function(data,status){
                        if(data=="true"){
                           $(location).attr("href","/main.jsp");
                        }else{
                            $("#msg").html("<span style='color: red'>用户名不存在或密码错误</span>");
                        }
                    }
                )
            }
        })*/
    </script>
</head>
<body>
<div class="login">
    <div class="box png">
        <div class="logo png"></div>
        <div class="input">
            <div class="log">
                <form action="/login" method="post">
                    <div class="name">
                        <label>用户名</label><input type="text" class="text" id="name" placeholder="请输入用户名" name="name" tabindex="1">
                    </div>
                    <div class="id">
                        <label>密　码</label><input type="password" class="text" id="pwd" placeholder="请输入密码" name="password" tabindex="2">
                    </div>
                    <div class="pwd" style="margin-bottom:1000px ">
                        <label>身　份</label>
                        <select name="limit" id="status">
                            <option value="1" name="status">业务员</option>
                            <option value="0" name="status">管理员</option>
                            <option value="2" name="status">客户经理</option>
                        </select>
                        <span id="msg"></span>
                        <input  type="submit" class="submit" tabindex="3" value="登录">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="air-balloon ab-1 png"></div>
    <div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>

<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/fun.base.js"></script>
<script type="text/javascript" src="js/script.js"></script>


<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" type="text/javascript"></script>
<script>DD_belatedPNG.fix('.png')</script>
<![endif]-->
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>客户管理系统，一个方便快捷查询信息的系统，你值得拥有</p>
    <p>打个广告： <a href="http://www.taobao.com/" target="_blank" title="">淘宝有你，越活越精彩</a></p>
</div>
</body>
</html>
