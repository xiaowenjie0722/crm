<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
            $("#nextpage").click(function () {
                location.href="/customerPage?page="+(${page}+1);
            })
            $("#uppage").click(function () {
                location.href="/customerPage?page="+(${page}-1);
            })
            $("#pageSelect").change(function () {
                location.href="/customerPage?page="+$("#pageSelect").val();
            })
            $("#addNo").click(function () {
                alert("您不能添加客户")
            })
        })
        function tranNum(id) {
            var tranId=id.toFixed(2);
            <c:out value="tranId"/>
        }
        function del(username){
            if (${status==0||status==2}){
                alert("您不可删除用户的客户信息")
            }else {
                if (confirm("您是否删除？")) {
                    location.href = "/customerDelete?name=" + username;
                }
            }
        }

        $("#return").click(function () {
            location.href="/customerMenu";
        })
        function update(id) {
            if (${status==0||status==2}){
                alert("您不可修改用户的客户信息")
            } else {
                location.href = "/customerSelect?customer_id=" + id;
            }
        }
    </script>
    <script>
        $(function () {
            $("#save").click(function () {
                var val=$('input:radio[name="situation"]:checked').val();
                if(val == null){
                    /*alert("用户状态还未选中，请先选择！");*/
                    document.getElementById("tishi").innerHTML="<font color='red'>用户相关信息未填写完整，请先填完！</font>";
                    return false
                }
            });
        });
    </script>
</head>
<body>

<!--用户管理模块-->
<div role="tabpanel" class="tab-pane" id="rightContent">
<div class="check-div form-inline">
    <c:choose>
        <c:when test="${status==0||status==2}">
            <div class="col-xs-3">
                <button class="btn btn-yellow btn-xs" data-toggle="modal" id="addNo">添加客户 </button>
            </div>
        </c:when>
        <c:otherwise>
            <div class="col-xs-3">
                <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser" id="add">添加客户 </button>
            </div>
        </c:otherwise>
    </c:choose>

</div>
<div class="data-div">
    <div class="row tableHeader">
        <div class="col-xs-1 ">
            编号
        </div>
        <div class="col-xs-1 ">
            客户名
        </div>
        <div class="col-xs-2">
            地区
        </div>
        <div class="col-xs-1">
            真实姓名
        </div>
        <div class="col-xs-2">
            电话
        </div>
        <div class="col-xs-2">
            状态
        </div>
        <div class="col-xs-3">
            操作
        </div>
    </div>
    <div class="tablebody" id="tablebody">
<c:forEach items="${customers}" var="item">
    <div class="row">
        <div class="col-xs-1 ">
                ${item.limit_id}
        </div>
        <div class="col-xs-1 ">
            ${item.username}
        </div>
        <div class="col-xs-2">
            ${item.address}
        </div>
        <div class="col-xs-1">
            ${item.realname}
        </div>
        <div class="col-xs-2">
            ${item.phone}
        </div>
        <div class="col-xs-2">
            <c:choose>
                <c:when test="${item.state==1}">
                    <c:out value="潜在客户"/>
                </c:when>
                <c:when test="${item.state==2}">
                    <c:out value="正式客户"/>
                </c:when>
                <c:when test="${item.state==3}">
                    <c:out value="签约客户"/>
                </c:when>
                <c:when test="${item.state==4}">
                    <c:out value="放弃客户"/>
                </c:when>
            </c:choose>

        </div>
        <div class="col-xs-3">
            <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="javascript:update(${item.id})">修改</button>
            <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="javascript:del('${item.username}')" >删除</button>
        </div>
    </div>
</c:forEach>

    </div>

</div>
<!--页码块-->
<footer class="footer">
    <ul class="pagination">
        <li>
            <select name="pageSelect" id="pageSelect">
                <option>${page}</option>
                <c:forEach var="i"  begin="1" end="${pages}" step="1" >
                    <option value="${i}">${i}</option>i
                </c:forEach>
            </select>
            页
        </li>
        <li class="gray">
            共${pages}页
        </li>
        <li>
            <i class="glyphicon glyphicon-menu-left" id="uppage">
            </i>
        </li>
        <li>
            <i class="glyphicon glyphicon-menu-right" id="nextpage">
            </i>
        </li>
    </ul>
</footer>

    <!--弹出添加用户窗口-->
    <div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" >添加用户</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form action="/customerAdd" method="get" class="form-horizontal">
                            <div class="form-group ">
                                <%--@declare id="name"--%><label for="Name" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" name="username" class="form-control input-sm duiqi" required="true" missingMessage="必须填写" id="addUsername" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <%--@declare id="slink"--%><label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" name="realname" class="form-control input-sm duiqi" id="addName"required="true" missingMessage="必须填写"  placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <%--@declare id="sord"--%><label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
                                <div class="col-xs-8">
                                    <input type="email" name="email" class="form-control input-sm duiqi" id="addEmail" required="true" missingMessage="必须填写" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <%--@declare id="sknot"--%><label for="sKnot" class="col-xs-3 control-label">电话：</label>
                                <div class="col-xs-8">
                                    <input type="tel" name="phone" class="form-control input-sm duiqi" id="addTel" placeholder="" required="true" missingMessage="必须填写">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">地区：</label>
                                <div class="col-xs-8">
                                    <input type="text" name="address" class="form-control input-sm duiqi" id="addLocal" placeholder="" required="true" missingMessage="必须填写">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">状态：</label>
                                <div class="col-xs-8">
                                    <table>
                                        <tr><td>
                                            <label class="control-label" >
                                                <input type="radio" name="situation" id="User1" value="1">潜在客户</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td><td>
                                            <label class="control-label" >
                                                <input type="radio" name="situation" id="User2" value="2">正式客户</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td></tr>
                                        <tr><td>
                                            <label class="control-label" >
                                                <input type="radio" name="situation" id="User3" value="3">签约客户</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td><td>
                                            <label class="control-label" >
                                                <input type="radio" name="situation" id="User4" value="4">放弃客户</label>
                                        </td></tr>
                                    </table>
                                </div>
                            </div>
                            <div>
                                <div><span id="tishi"></span></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal" id="return">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green"  id="save">保 存</button>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出修改用户窗口-->
<div class="modal fade" id="reUser" role="dialog" aria-labelledby="gridSystemModalLabel">

</div>
<!-- /.modal -->

<!--弹出删除用户警告窗口-->
<div class="modal fade" id="delUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >提示</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    确定要删除该用户？删除后不可恢复！
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn  btn-xs btn-danger">保 存</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</div>
</body>
</html>
