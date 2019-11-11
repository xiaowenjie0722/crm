<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 肖文杰
  Date: 2019/9/24
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
   <style>
       .modalfade{
           margin-left: 8%;
       }
   </style>
    <script>
        $(function () {
            if (<%=session.getAttribute("id")==null%>){
                location.href="login.jsp";
            }
            $("#return").click(function () {
                location.href="/customerMenu";
            })
        })

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
<!--弹出添加用户窗口-->
<div class="modalfade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" >修改用户</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                   <c:forEach items="${customers}" var="item">
                       <form action="/customerUpdate" method="get" class="form-horizontal">
                           <input type="hidden" name="customer_id" value="${item.id}"/>
                           <div class="form-group ">
                                   <%--@declare id="name"--%><label for="Name" class="col-xs-3 control-label">用户名：</label>
                               <div class="col-xs-8 ">
                                   <input type="text" name="username" class="form-control input-sm duiqi" required="true" missingMessage="必须填写" id="addUsername" placeholder="" value="${item.username}">
                               </div>
                           </div>
                           <div class="form-group">
                                   <%--@declare id="slink"--%><label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                               <div class="col-xs-8 ">
                                   <input type="text" name="realname" class="form-control input-sm duiqi" id="addName" placeholder=""  required="true" missingMessage="必须填写" value="${item.realname}">
                               </div>
                           </div>
                           <div class="form-group">
                                   <%--@declare id="sord"--%><label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
                               <div class="col-xs-8">
                                   <input type="email" name="email" class="form-control input-sm duiqi" id="addEmail" placeholder="" required="true" missingMessage="必须填写" value="${item.email}">
                               </div>
                           </div>
                           <div class="form-group">
                                   <%--@declare id="sknot"--%><label for="sKnot" class="col-xs-3 control-label">电话：</label>
                               <div class="col-xs-8">
                                   <input type="tel" name="phone" class="form-control input-sm duiqi" id="addTel" placeholder="" required="true" missingMessage="必须填写" value="${item.phone}">
                               </div>
                           </div>
                           <div class="form-group">
                               <label for="sKnot" class="col-xs-3 control-label">地区：</label>
                               <div class="col-xs-8">
                                   <input type="text" name="address" class="form-control input-sm duiqi" id="addLocal" placeholder="" value="${item.address}" required="true" missingMessage="必须填写">
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
                           <div><span id="tishi"></span></div>
                           <div class="modal-footer">
                               <button type="button" class="btn btn-xs btn-white" data-dismiss="modal" id="return">取 消</button>
                               <button type="submit"  id="save"  class="btn btn-xs btn-green">保 存</button>
                           </div>
                       </form>
                   </c:forEach>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

</body>
</html>
