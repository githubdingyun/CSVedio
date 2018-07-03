<%--
  Created by IntelliJ IDEA.
  User: DinGYun
  Date: 2018/6/23
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <base href="http://localhost:8080/CSVedio/">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>智游教育</title>

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
                <li class="active"><a href="AdminController/speaker.do">主讲人管理</a></li>
                <li><a href="AdminController/course.do">课程管理</a></li>
            </ul>
            <p class="navbar-text navbar-right">
                <span>${admin.adminName}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;<a
                    href="BaseController/Adminlogout.do" class="navbar-link">退出</a>

            </p>
        </div>
        <!-- /.navbar-collapse -->


    </div>
    <!-- /.container-fluid -->
</nav>


<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
    <div class="container">


        <h2>添加主讲人</h2>


    </div>
</div>


<div class="container" style="margin-top: 20px;">

    <form id="infoForm" class="form-horizontal" action="SpeakerController/insert.do" novalidate="novalidate">

        <%--<c:if test="${speaker.speakerId}!=null">--%>
        <div class="form-group">
            <label for="speakerId" class="col-sm-2 control-label">ID</label>
            <div class="col-sm-10">
                <input type="text" readonly="true" name="speakerId" id="speakerId" placeholder="主讲人Id自动生成" value="${speaker.speakerId}">
            </div>
        </div>
        <%--</c:if>--%>

        <div class="form-group">
            <label for="speakerName" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input class="form-control" name="speakerName" id="speakerName" placeholder="主讲人姓名" type="text" value="${speaker.speakerName}">
            </div>
        </div>
        <div class="form-group">
            <label for="speakerJob" class="col-sm-2 control-label">职位</label>
            <div class="col-sm-10">
                <input value="${speaker.speakerJob}" class="form-control" name="speakerJob" id="speakerJob" placeholder="主讲人职位" type="text">
            </div>
        </div>

        <div class="form-group">
            <label for="headImgUrl" class="col-sm-2 control-label">头像地址</label>
            <div class="col-sm-10">
                <input value="${speaker.speakerHeadUrl}" class="form-control" name="speakerHeadUrl" id="headImgUrl" placeholder="主讲人头像" type="text">
            </div>
        </div>

        <div class="form-group">
            <label for="speakerDesc" class="col-sm-2 control-label">简介</label>
            <div class="col-sm-10">
                <input value="${speaker.speakerDesc}" class="form-control" name="speakerDesc" id="speakerDesc" placeholder="主讲人简介" type="text">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">保存</button>
            </div>
        </div>
    </form>
</div>

<script>
    $(function () {
        $('#infoForm').validate({
            rules: {
                speakerName: {
                    required: true
                },
                speakerJob: {
                    required: true
                },
                headImgUrl: {
                    required: false
                },
                speakerDesc: {
                    required: true
                }
            },
            messages: {
                speakerName: '请填写讲师名字',
                speakerJob: '请填写讲师职位',
                headImgUrl: '请填写讲师头像地址(网络图片地址)',
                speakerDesc: '请填写讲师简介信息'
            }
        });
    });
</script>


</body>
</html>
