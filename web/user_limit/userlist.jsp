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
            $(".btn btn-success btn-xs").click(function () {

            })
            $("body").on("click","#del",function(){
                alert("非法操作！不能删除管理员的信息")
            });
           /* $("#del").click(function () {
              alert("非法操作！管理员不能删除自己的信息")
            })*/
        })
        function del(name) {//删除信息
            if(confirm("请确认是否删除？删除后不可恢复")){
                location.href="/userServlet?type=del&name="+name;
            }
        }
        function edit(id) {//修改信息
            location.href="/userServlet?type=edit&userid="+id;
        }
        function add() {
            location.href="/user_limit/useradd.jsp";
        }
    </script>
</head>
<body>
<!-- 权限管理模块 -->
<!-- 权限管理模块 -->
<div role="tabpanel" class="tab-pane" id="rightContent">
    <div class="check-div">
        <button class="btn btn-yellow btn-xs" data-toggle="modal" onclick="javascript:add()">添加用户</button>
        <span><c:out value="${msg}"/></span>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-1 ">
                序号
            </div>
            <div class="col-xs-1">
                用户名
            </div>
            <div class="col-xs-1">
                密码
            </div>
            <div class="col-xs-2">
                电话号码
            </div>
            <div class="col-xs-2">
                权限状态
            </div>
            <div class="col-xs-5">
                操作
            </div>
        </div>
        <!--管理员页面-->
        <div class="tablebody">
            <div class="row">
                <c:forEach var="list" items="${userlist}">
                    <div class="col-xs-1 ">
                            ${list.id}
                    </div>
                    <div class="col-xs-1">
                        </span><span>${list.name}</span>
                    </div>
                    <div class="col-xs-1">
                            ${list.password}
                    </div>
                    <div class="col-xs-2">
                            ${list.tel}
                    </div>
                    <div class="col-xs-2">
                        <c:if test="${list.limitNum==0}">
                            管理员
                        </c:if>
                        <c:if test="${list.limitNum==1}">
                            业务员
                        </c:if>
                        <c:if test="${list.limitNum==2}">
                            客户经理
                        </c:if>
                    </div>
                    <div class="col-xs-5">
                        <button class="btn btn-success btn-xs" data-toggle="modal" onclick="javascript:edit(${list.id})">修改 </button>
                        <c:choose>
                            <c:when test="${list.limitNum==0}"><button class="btn btn-danger btn-xs" data-toggle="modal"  id="del">删除</button></c:when>
                            <c:otherwise><button class="btn btn-danger btn-xs" data-toggle="modal"  onclick="javascript:del('${list.name}')">删除</button></c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
