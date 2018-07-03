<%--
  Created by IntelliJ IDEA.
  User: DinGYun
  Date: 2018/6/23
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <base href="http://localhost:8080/CSVedio/">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <script type="text/javascript" src="js/jquery-1.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <title>登录</title>

    <link href="js/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="BaseController/AdminLogin.do" method="post">
    <div style="margin-top: 20%;">

        <img src="z/logo.png" class="img-responsive center-block" style="width: 20%" alt="Responsive image">


        <div class="container" style="margin-top: 10px;">

            <div class="row">
                <div class="col-md-4"></div>
                <div class="form-group col-md-4" style="">

                    <input class="form-control" onblur="validation()" name="adminName" style="border: 1px solid #5CB85C"
                           id="adminName" placeholder="用户名" type="text"> <font id="f1">帐号错误</font>
                </div>
                <div class="col-md-4"></div>
            </div>

            <div class="row">
                <div class="col-md-4"></div>
                <div class="form-group col-md-4">

                    <input class="form-control" name="adminPasswod" style="border: 1px solid #5CB85C" id="i2"
                           placeholder="密码" type="password">
                </div>
                <div class="col-md-4"></div>

            </div>


        </div>


        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="submit" class="btn btn-success center-block" style="width: 80%;">登 录</button>
            </div>
            <div class="col-md-4"></div>

        </div>


    </div>
</form>


<script type="text/javascript">
    function validation() {
        var adminName = $("#adminName").val();
        $.ajax({
            url: "BaseController/adminNameVerifier.do?adminName=" + adminName,
            dataType: "text",
            success: function (data) {
                if (data == "no") {
                    f1.innerHTML = "该帐号不存在";
                } else {
                    f1.innerHTML = "";
                }
            }
        });

    }
</script>



</body>
</html>
