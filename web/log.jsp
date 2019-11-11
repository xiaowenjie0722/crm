<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2019/9/26
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日志信息</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/slide.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
    <style>
        #log{
            margin-left:15%;
            margin-top: 5%;
        }
        #select{
            width: 600px;
            height:400px ;
        }
    </style>
    <script src="js/jQuery.js"></script>
    <script>
        function logdel() {
            if (confirm("是否确认清空所有日志？")){
                location.href="/logDelete";
            }
        }
        function flush() {
            location.href="/logServlet";
        }
    </script>
</head>
<body>
<div id="log">
    <select multiple="multiple" id="select">
        <c:forEach items="${log}" var="item">
            <option>${item}</option>
        </c:forEach>
    </select>
    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="javascript:flush()">刷新</button>
    <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="javascript:logdel()" >清空当前日志</button>
</div>
</body>
</html>
