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
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
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
        function del(id) {//删除信息
            if(confirm("请确认是否删除？删除后不可恢复")){
                location.href="${path}/limitServlet?type=del&infoid="+id;
            }
        }
        function edit(id) {//修改信息
            location.href="${path}/limitServlet?type=edit&infoid="+id;
        }
        function add() {
            location.href="${path}/limitInfo/limitAdd.jsp";
        }
    </script>
    <script>
        function verify() {
            var  describe = document.getElementById("describe").value;
            if(describe == "" || describe == null){
                alert("描述栏不能为空！");
                return false;
            }
        }
    </script>
</head>
<body>

<!-- 权限管理模块 -->
<div role="tabpanel" class="tab-pane" id="rightContent">

    <div class="check-div">
        <button class="btn btn-yellow btn-xs" data-toggle="modal" onclick="javascript:add()">添加权限</button>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-1 ">
                <c:out value="${path}"/>
                序号
            </div>
            <div class="col-xs-4">
                权限名
            </div>
            <div class="col-xs-5">
                描述
            </div>
            <div class="col-xs-2">
                操作
            </div>
        </div>
        <!--管理员页面-->
        <div class="tablebody">
            <div class="row">
                <c:forEach var="list" items="${list}">
                    <div class="col-xs-1 ">
                        ${list.id}
                    </div>
                    <div class="col-xs-4">
                        </span><span>${list.limitname}</span>
                    </div>
                    <div class="col-xs-5">
                       ${list.info}
                    </div>
                    <div class="col-xs-2">
                        <button class="btn btn-success btn-xs" data-toggle="modal" onclick="javascript:edit(${list.id})">修改 </button>
                        <c:choose>
                            <c:when test="${list.limitstatus==0}"><button class="btn btn-danger btn-xs" data-toggle="modal"  id="del">删除</button></c:when>
                            <c:otherwise><button class="btn btn-danger btn-xs" data-toggle="modal"  onclick="javascript:del(${list.id})">删除</button></c:otherwise>
                        </c:choose>

                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
    <!--增加权限弹出窗口-->
    <div class="modal fade" id="addChar" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="  ">添加权限</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal"  onsubmit="return verify()">
                            <div class="form-group ">
                                <label for="rootName" class="col-xs-3 control-label">权限名：</label>
                                <div class="col-xs-6 ">
                                    <input type="email" class="form-control input-sm duiqi" id="rootName" placeholder="" required="true" missingMessage="必须填写">
                                </div>
                            </div>
                            <div class="form-group">
                                <%--@declare id="rootmessage"--%><label for="rootMessage" class="col-xs-3 control-label">描述：</label>
                                <div class="col-xs-6 ">
                                    <textarea class="form-control input-sm duiqi" id="describe"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="button" class="btn btn-xs btn-green" id="save">保 存</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!--修改权限弹出窗口-->
   <%-- <div class="modal fade" id="editChar" role="dialog" aria-labelledby="gridSystemModalLabel">
        <iframe src="/limitServlet?type=edit" id="1" scrolling="no" frameborder="no" align="center" allowfullscreen="true" allow="autoplay"
                style="width: 1450px; height: 800px;">
        </iframe>
    <!-- /.modal -->
</div>--%>
    </div>
</div>
</body>
</html>
