<%--
  Created by IntelliJ IDEA.
  User: DinGYun
  Date: 2018/6/23
  Time: 17:29
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
    <!-- /.container-fluid -->
</nav>


<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
    <div class="container">
        <h2>课程管理</h2>
    </div>
</div>

<form action="CourseController/deleteMore.do">
    <div class="container">
        <button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            添加
        </button>

        <button onclick="deleteAll()" type="submit" id="btn" class="btn btn-info dropdown-toggle">
            批量删除
        </button>
    </div>

    <div class="container" style="margin-top: 20px;">

        <table class="table table-bordered table-hover" style="text-align: center;table-layout:fixed;">
            <thead>
            <tr class="active">
                <th><input type="checkbox" id="all"></th>
                <th>序号</th>
                <th style="width:16%">标题</th>
                <th style="width:60%">简介</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${courses }" var="i">
                <tr>
                    <td><input type="checkbox" name="ids" value="${i.courseId}" id="c${i.courseId}"></td>
                    <td>${i.courseId}</td>
                    <td>${i.courseTitle}</td>
                    <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${i.courseDesc}</td>
                    <td><a href="AdminController/updataCourse.do?courseId=${i.courseId}">✎</a></td>
                    <td>
                            <%--<button onclick="deletee(${i.courseId})" id="a${i.courseId}">XXX</button>--%>
                        <a onclick="delCourseById('#a${i.courseId}',${i.courseId},'${i.courseTitle}')"
                           id="a${i.courseId}">XXX</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2">
                    <font>总共${total}条,当前第${pageNum}页 </font>

                    <c:forEach var="i" begin="1" step="1" end="${lastPage}" >
                        <a href="AdminController/course.do?page=${i}">  ${i} </a>
                    </c:forEach>

                </td>
            </tr>
            </tbody>

        </table>

    </div>
</form>
<script type="text/javascript">
    var arr = document.getElementsByName("ids");
    var totol = arr.length;
    var count = 0;

    $("input[id='all']").click(function () {
        if ($(this).prop('checked') == true) {
            $("input[id!='all']").prop('checked', true);
            $(btn).text('批量删除' + totol);
            count = totol;
        } else {
            $("input[id!='all']").prop('checked', false);
            $(btn).text('批量删除' + 0);
            count = 0;
        }

    });

    $("input[id!='all']").click(function () {
        if ($(this).prop('checked') == true) {
            count++;

        } else {
            count--;
            $("input[id='all']").prop('checked', false);

        }
        if (count == totol) {
            $("input[id='all']").prop('checked', true);
        }
        $(btn).text('批量删除' + count);
    });


</script>
<script type="text/javascript">
    function deleteAll() {
        $.ajax({
            url: "CourseController/deleteMore.do",
            data: "id=" + a,
            data: "id=" + a,
            data: "id=" + a,
            data: "id=" + a,
            data: "id=" + a,
            success: function () {
                $("#a" + a).parent().parent().remove();

            }
        })
    }

</script>

<script type="text/javascript">
    function deletee(a) {
        $.ajax({
            url: "CourseController/delete.do",
            data: "id=" + a,
            success: function () {
                $("#a" + a).parent().parent().remove();

            }
        })
    }


</script>


<script type="text/javascript">


    function showAddPage() {
        location.href = "AdminController/addCourse.do";
    }

    function delCourseById(Obj, id, title) {

        Confirm.show('温馨提示：', '确定要删除' + title + '么？', {
            'Delete': {
                'primary': true,
                'callback': function () {
                    var param = {"id": id};
                    $.post("CourseController/delete.do", param, function (data) {
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
