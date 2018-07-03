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


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <title>智游教育</title>


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
    <!-- /.container-fluid --> </nav>


<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">

    <div class="container">
        <h2>主讲人管理</h2>
    </div>
</div>

<form action="SpeakerController/deleteMore.do">
    <div class="container">


        <button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">添加
        </button>
        <button onclick="deleteAll()" type="submit" id="btn" class="btn btn-info dropdown-toggle">批量删除</button>
    </div>

    <div class="container" style="margin-top: 20px;">

        <table class="table table-bordered table-hover" style="text-align: center; table-layout: fixed;">
            <thead>
            <tr class="active">
                <th><label for="all"></label><input type="checkbox" id="all"></th>
                <th>序号</th>
                <th>名称</th>
                <th>职位</th>
                <th style="width: 60%;">简介</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${speakers}" var="i">
                <tr>
                    <td><input type="checkbox" name="ids" value="${i.speakerId}" id="c${i.speakerId}"></td>

                    <td>${i.speakerId}</td>
                    <td>${i.speakerName}</td>
                    <td>${i.speakerJob}</td>
                    <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${i.speakerDesc}</td>
                    <td><a href="AdminController/addTeach.do?id=${i.speakerId}">✎</a></td>
                    <%--<td><button onclick="deletee(${i.speakerId})" id="a${i.speakerId}">XXX</button></td>--%>
                    <td><a onclick="delSpeakerById('#a${i.speakerId}',${i.speakerId},'${i.speakerName}')" id="a${i.speakerId}">XXX</a>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2">
                    <font>总共${total}条,当前第${pageNum}页</font>

                    <c:forEach var="i" begin="1" step="1" end="${lastPage}" >
                        <a href="AdminController/speaker.do?page=${i}">  ${i} </a>
                    </c:forEach>

                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form>v

<script type="text/javascript">
    var arr = document.getElementsByName("ids");
    var totol = arr.length;
    var count = 0;

    $("input[id='all']").click(function () {
        if ($(this).prop('checked') == true) {
            $("input[id!='all']").prop('checked', true);
            $('#btn').text('批量删除' + totol);
            count = totol;
        } else {
            $("input[id!='all']").prop('checked', false);
            $('#btn').text('批量删除' + 0);
            count = 0;
        }

    });
    //注意id选择器可以不加引号，但是最好加上  这里没有加的习惯很不好
    $("input[id!='all']").click(function () {
        if ($(this).prop('checked') === true) {
            count++;

        } else {
            count--;
            $("input[id='all']").prop('checked', false);

        }
        if (count === totol) {
            $("input[id='all']").prop('checked', true);
        }
        $('#btn').text('批量删除' + count);
    });

</script>
<script type="text/javascript">
    function deletee(a) {
        $.ajax({
            url: "SpeakerController/delete.do",
            data: "id=" + a,
            success: function () {
                $("#a" + a).parent().parent().remove();

            }
        })
    }


</script>

<script type="text/javascript">

    function showAddPage() {
        location.href = "AdminController/addTeach.do";
    }


    function delSpeakerById(Obj, id, title) {

        Confirm.show('温馨提示：', '确定要删除' + title + '么？', {
            'Delete': {
                'primary': true,
                'callback': function () {
                    var param = {"id": id};
                    $.post("SpeakerController/delete.do", param, function (data) {
                        if (data == 'success') {
                            Confirm.show('温馨提示：', '删除成功');
                            $(Obj).parent().parent().remove();
                        } else {
                            Confirm.show('温馨提示：', '操作失败');
                        }
                    });
                }
            }
        });
    }
</script>


</body>
</html>
