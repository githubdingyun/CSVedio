<%--
  Created by IntelliJ IDEA.
  User: DinGYun
  Date: 2018/6/23
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <base href="http://localhost:8080/CSVedio/">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>LoL</title>

    <link href="js/bootstrap.css" rel="stylesheet">

    <script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/confirm.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/message_cn.js"></script>
    <style type="text/css">
        .col-md-1 {
            padding-top: 20px;
        }

        .a1 {
            color: gray;
        }

        b {
            float: right;
        }
    </style>


</head>
<body>


<nav class="navbar-inverse">
    <div class="container">

        <div class="navbar-header">
            <a class="navbar-brand" href="AdminController/vedio.do">视频管理系统</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
            <ul class="nav navbar-nav">
                <li><a href="AdminController/vedio.do">视频管理</a></li>
                <li><a href="AdminController/speaker.do">主讲人管理</a></li>
                <li class="active"><a href="AdminController/course.do">课程管理</a></li>
            </ul>
            <p class="navbar-text navbar-right">
                <span>${admin.adminName}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;<a
                    href="BaseController/Adminlogout.do" class="navbar-link">退出</a>

            </p>
        </div>
        <!-- /.navbar-collapse -->


    </div>
</nav>


<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
    <div class="container">


        <h2>添加课程</h2>


    </div>
</div>


<div class="container" style="margin-top: 20px;">

    <form id="infoForm" class="form-horizontal" action="CourseController/insert.do" method="post"
          novalidate="novalidate">


        <div class="form-group">
            <label for="subjectId" class="col-sm-2 control-label">所属学科</label>
            <div class="col-sm-10">

                <select name="subjectID" id="subjectId" class="form-control">

                    <c:forEach items="${subjects}" var="i">
                        <c:if test="${course.subjectId==i.subjectId}">
                            <option value="${i.subjectId}" selected="selected">${i.subjectName} </option>
                        </c:if>

                        <c:if test="${course.subjectId!=i.subjectId}">
                            <option value="${i.subjectId}">${i.subjectName} </option>
                        </c:if>
                    </c:forEach>


                </select>

            </div>
        </div>


        <div class="form-group">
            <label for="subjectTitle" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-10">
                <input class="form-control" value="${course.courseTitle}" name="courseTitle" id="subjectTitle"
                       placeholder="课程标题" type="text">
            </div>
        </div>
        <div class="form-group">
            <label for="courseDesc" class="col-sm-2 control-label">简介</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="courseDesc"  name="courseDesc"
                          rows="3">${course.courseDesc}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">保存</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">
    $(function () {

        $('#infoForm').validate({
            rules: {
                subjectId: {
                    required: true,
                    min: 1
                },
                courseTitle: {
                    required: true
                },
                courseDesc: {
                    required: true
                }
            },
            messages: {
                subjectId: '请选择所属学科',
                courseTitle: '请填写课程标题',
                courseDesc: '请填写简介信息'
            }
        });


    });

</script>


</body>
</html>
