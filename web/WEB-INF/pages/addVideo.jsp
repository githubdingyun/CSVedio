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


    <base href="http://localhost:8080/CSVedio/">


    <!--表示使用IE最新的渲染模式进行解析-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加或修改视频</title>

    <link href="js/bootstrap.css" rel="stylesheet">

    <script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/confirm.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/message_cn.js"></script>

    <style type="text/css">
        th {
            text-align: center;
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
                <li  class="active"><a href="AdminController/vedio.do">视频管理</a></li>
                <li><a href="AdminController/speaker.do">主讲人管理</a></li>
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


        <h2>添加视频信息</h2>


    </div>
</div>

<div class="container" style="margin-top: 20px;">

    <form id="infoForm" class="form-horizontal" action="VideoController/insert.do"
          novalidate="novalidate">

        <div class="form-group">
            <label for="videoId" class="col-sm-2 control-label">ID</label>
            <div class="col-sm-10">
                <input type="text" readonly="true" name="videoId" id="videoId" placeholder="主讲人Id自动生成" value="${video.videoId}" >
            </div>
        </div>
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">视频标题</label>
            <div class="col-sm-10">
                <input value="${video.videoTitle}" class="form-control" id="title" name="videoTitle" placeholder="视频名称" type="text">
            </div>
        </div>
        <div class="form-group">
            <label for="speakerID" class="col-sm-2 control-label">主讲人</label>
            <div class="col-sm-10">

                <select name="speakerId" id="speakerID" class="form-control error" aria-required="true"
                        aria-invalid="true">
                    <%--<option value="0" >请选择讲师</option>--%>
                    <c:forEach items="${speakers}" var="i">
                        <c:if test="${video.speakerId==i.speakerId}">
                            <option selected="selected" value="${i.speakerId}">${i.speakerName}</option>
                        </c:if>
                        <c:if test="${video.speakerId!=i.speakerId}">
                            <option  value="${i.speakerId}">${i.speakerName}</option>
                        </c:if>
                    </c:forEach>



                </select><label id="speakerID-error" class="error" for="speakerID">请选择视频主讲人</label>


            </div>
        </div>

        <div class="F-group">
            <label for="courseID" class="col-sm-2 control-label">所属课程</label>
            <div class="col-sm-10">


                <select name="courseId" id="courseID" class="form-control">
                    <%--<option value="0" >请选择所属课程</option>--%>
                    <c:forEach items="${courses}" var="i">
                        <c:if test="${video.courseId==i.courseId}">
                            <option value="${i.courseId}" selected= "selected" >${i.courseTitle} </option>
                        </c:if>
                        <c:if test="${video.courseId!=i.courseId}">
                            <option value="${i.courseId}">${i.courseTitle} </option>
                        </c:if>
                    </c:forEach>




                </select>

            </div>
        </div>

        <div class="form-group">
            <label for="time" class="col-sm-2 control-label">视频时长(秒)</label>
            <div class="col-sm-10">
                <input value="${video.videoTime}" class="form-control" id="time" name="videoTime" placeholder="精确到秒（正整数）" type="number">
            </div>
        </div>

        <div class="form-group">
            <label for="imageUrl" class="col-sm-2 control-label">封面图片地址</label>
            <div class="col-sm-10">
                <input value="${video.videoImgUrl}" id="imageUrl" name="videoImgUrl" class="form-control" placeholder="具体的url" type="url">
            </div>
        </div>

        <div class="form-group">
            <label for="videoUrl" class="col-sm-2 control-label">视频播放地址</label>
            <div class="col-sm-10">
                <input value="${video.videoUrl}" id="videoUrl" name="videoUrl" class="form-control" placeholder="具体的url" type="url">
            </div>
        </div>

        <div class="form-group">
            <label for="detail" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <textarea value="${video.videoDesc}" class="form-control" id="detail" name="videoDesc" rows="3">${video.videoDesc}</textarea>
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
                title: {
                    required: true
                },
                speakerID: {
                    required: true,
                    min: 1
                },
                courseID: {
                    required: true,
                    min: 1
                },
                time: {
                    required: true,
                    min: 1
                },
                imageUrl: {
                    required: false
                },
                videoUrl: {
                    required: false
                },
                detail: {
                    required: true
                }
            },
            messages: {
                title: '请填写视频标题',
                speakerID: '请选择视频主讲人',
                courseID: '请选择所属课程',
                time: '请填写视频时长(秒)',
                imageUrl: '请填写视频封面((网络图片地址))',
                videoUrl: '请填写视频在线播放地址',
                detail: '请填写视频具体介绍信息'
            }
        });
    });

</script>

</body>
</html>
