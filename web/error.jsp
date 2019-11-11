
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            width:800px;
            height: auto;
            margin: 60px auto;
            line-height:40px;
            font-size: 20px;
            color:rgb(52,73,94);
        }

        a:link {
            color: #ffa400;
        }

        a:visited {
            color: #ffa400;
        }

        a:hover {
            color:rgb( 46,204,113);
        }
        
        a:active {
            color:rgb( 46,204,113);
        }
    </style>

    <%
        /**
         * 本页面是在客户查找的页面无法找到的情况下调用的
         */
        response.setStatus(HttpServletResponse.SC_OK);
    %>
</head>
<body  bgcolor="#d3d3d3">
程序发生了错误，有可能该页面正在调试或者是设计上的缺陷.<br/>
<br/><a href="/login.jsp">返回登录页面</a>

</body>

