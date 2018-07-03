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
    <title>视频列表管理</title>

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

<form action="VideoController/selectSome.do">

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
        <h2>视频管理</h2>
    </div>
</div>
</form>
<div class="container">

    <div class="row">
        <div class="col-md-2">
            <button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">添加
            </button>

            <button id="btn" class="btn btn-primary" type="submit">
                批量删除 <span class="badge" id="delNum">0</span>
            </button>
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-6">
            <!-- 查询相关组件 -->
            <form class="navbar-form navbar-right" action="VideoController/Selectsome.do">
                <input name="title" class="form-control" placeholder="标题" type="text">
                <div class="btn-group">
                    <button type="button" id="speakerName" class="btn btn-primary dropdown-toggle"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        --请选择老师--<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <c:forEach items="${speakers}" var="i">
                            <li value="${i.speakerId}"><a onclick="showName(this,${i.speakerId},1)">${i.speakerName}</a></li>
                        </c:forEach>

                    </ul>
                    <input name="speakerID" id="speakerID" type="hidden" value="0">
                </div>
                <div class="btn-group">
                    <button type="button" id="courseName" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        --请选择课程--<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <c:forEach items="${courses}" var="i">
                            <li value="${i.courseId}"><a onclick="showName(this,${i.courseId},2)">${i.courseTitle}</a></li>

                        </c:forEach>

                        <input name="courseID" id="courseID" type="hidden" value="0">
                    </ul>
                </div>
                <button type="submit" class="btn btn-info dropdown-toggle">查询</button>
            </form>

        </div>

    </div>
</div>

<div class="container" style="margin-top: 20px;">
    <form action="VideoController/deleteMore.do" method="">
        <table class="table table-bordered table-hover" style="text-align: center;table-layout:fixed">
            <thead>
            <tr class="active">
                <th style="width:3%"><input onclick="selectAll(this)" id="checkAllId" type="checkbox"></th>
                <th style="width:5%">序号</th>
                <th style="width:15%">名称</th>
                <th style="width:42%;">介绍</th>
                <th>讲师</th>
                <th>时长</th>
                <th style="width:7%">播放次数</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${videos}" var="i">
                <tr>
                    <td><input type="checkbox" name="ids" onclick="selectOne(this)" value="${i.videoId}" id="c${i.videoId}"></td>
                    <td>${i.videoId}</td>
                    <td>${i.videoTitle}</td>
                    <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${i.videoDesc}</td>
                    <td>${i.speakerId}</td>
                    <td>${i.videoId}</td>
                    <td>${i.videoPlayNum}</td>
                    <td><a href="AdminController/addVideo.do?id=${i.videoId}">✎</a></td>
                    <td>
                            <%--<button onclick="deletee(${i.videoId})" id="a${i.videoId}">XXX</button>--%>
                        <a onclick="delVedioById('#a${i.videoId}',${i.videoId},'${i.videoTitle}')"
                                id="a${i.videoId}">XXX
                        </a>


                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2">
                    <font>总共<span class="badge" id="total">${total}</span>条,
                        当前第<span class="badge" id="pageNum">${pageNum}</span>页</font>

                    <c:forEach var="i" begin="1" step="1" end="${lastPage}" >
                        <a href="AdminController/vedio.do?page=${i}">  ${i} </a>
                    </c:forEach>

                </td>
            </tr>
            </tbody>
        </table>



    </form>
</div>



<script type="text/javascript">
    function deletee(a) {
        $.ajax({
            url: "VideoController/delete.do",
            data: "id=" + a,
            success: function () {
                $("#a" + a).parent().parent().remove();

            }
        })
    }
</script>

<script type="text/javascript">
    function showAddPage() {
        location.href = "AdminController/addVideo.do";
    }

    $(function () {
        $("#btn").click(function () {
            if (deleteNum > 0) {

                Confirm.show('溫馨提示', '您確定要刪除这' + deleteNum + '条记录嗎？', {
                    'Delete': {
                        'primary': true,
                        'callback': function () {
                            //不是ajax，模拟提交
                            $("form").submit();
                            //如果是一个正常表单的提交，按钮必须是type=submit,并且必须在form表单里面
                        }
                    }
                });

            }

        });

    });

    function delVedioById(Obj, id, title) {

        Confirm.show('温馨提示：', '确定要删除' + title + '么？', {
            'Delete': {
                'primary': true,
                'callback': function () {
                    var param = {"id": id};
                    $.post("VideoController/delete.do", param, function (data) {
                        if (data == 'success') {
                            Confirm.show('温馨提示：', '删除成功');
                            $(Obj).parent().parent().remove();
                            $("#total").text()
                        } else {
                            Confirm.show('温馨提示：', '操作失败');
                        }
                    });
                }
            }
        });
    }

    var deleteNum = 0;

    function selectAll(obj) {
        //dom  jquery
        var value = obj.checked;
        //alert(value);
        var arr = document.getElementsByName("ids");
        for (var i = 0; i < arr.length; i++) {
            arr[i].checked = value;
        }
        if (value) {
            deleteNum = arr.length;
        } else {
            deleteNum = 0;
        }

        $("#delNum").text(deleteNum);

    }

    function selectOne(obj) {
        if (obj.checked) {
            deleteNum += 1;
        } else {
            deleteNum -= 1;
            document.getElementById("checkAllId").checked = false;
        }

        if (deleteNum == 0) {
            document.getElementById("checkAllId").checked = false;
        }

        var arr = document.getElementsByName("ids");
        if (deleteNum == arr.length) {
            document.getElementById("checkAllId").checked = true;
        }

        $("#delNum").text(deleteNum);
    }

    //解决选择下拉框内容到输入框内容的问题
    function showName(obj, id, type) {
        var name = $(obj).text();

        if (type == 1) {
            $("#speakerName").html(name + "<span class='caret'></span>");
            $("#speakerID").val(id);
        } else {
            $("#courseName").html(name + "<span class='caret'></span>");
            $("#courseID").val(id);
        }

    }
</script>

</body>
</html>
