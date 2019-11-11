
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

<body bgcolor="#d3d3d3">
正在制作... <a href="/login.jsp">返回登录页面</a>
<br/>
也可能页面连接更改了，请按 F5 键刷新整个页面看看，特别是菜单！

</body>

