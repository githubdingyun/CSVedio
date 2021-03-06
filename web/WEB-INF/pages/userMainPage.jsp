<%--
  Created by IntelliJ IDEA.
  User: DinGYun
  Date: 2018/6/27
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <base href="http://localhost:8080/CSVedio/">

    <script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/confirm.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/message_cn.js"></script>
    <script src="z/gVerify.js"></script>
    <link rel="stylesheet" href="z/base.css">
    <%--<link rel="stylesheet" href="z/css.css">--%>
    <link rel="stylesheet" href="z/profile.css">
    <link rel="stylesheet" href="z/bootstrap.css">

    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">

    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <meta name="author" content="尚忠祥">

    <link rel="icon" href="z/ali.jpg" type="image/png">
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body>


<header>
    <div class="container top_bar clearfix">
        <img src="z/logo.png" alt="智游">
        <div id="tele">
            <span>4006-371-555</span>
            <span>0371-88888598</span>
        </div>
    </div>
    <menu>
        <div class="container clearfix">
            <ul class="clearfix f_left">
                <li class="navbar-link" ><a href="">首页</a></li>

                <li class="navbar-link">
                    <a href="AdminController/userMainPage.do?id=${user.userEmail}">个人中心</a></li>
            </ul>

            <div id="user_bar">
                <img src="z/error.jpg" width="50" height="40" alt="" >
                <a href="UserController/userlogout.do" class="navbar-link">退出</a>
            </div>
        </div>
    </menu>
</header>
<main>
    <div class="container">
        <h2>我的资料</h2>
        <div id="profile_tab">
            <ul class="profile_tab_header f_left clearfix">
                <a href="AdminController/userDocUpa.do?id=${user.userEmail}" class="navbar-link">更改资料   |</a>
                <a href="AdminController/userImg.do?id=${user.userEmail}" class="navbar-link">更改头像  |</a>
                <a href="AdminController/userPasswordSafe.do?id=${user.userEmail}" class="navbar-link">密码安全</a>
            </ul>
            <div class="proflle_tab_body">
                <div class="proflle_tab_workplace clearfix">
                    <div class="profile_avatar_area">
                        <img src="${user.userImgurl}" width="161px" height="190px" id="avatar"  alt="">
                        <p>欢迎回来</p>
                    </div>
                    <form id="infoForm" class="form-horizontal" action="commitupdate.do" method="post" novalidate="novalidate">
                        <ul class="profile_ifo_area">
                            <li><span class="dd">昵　称：
                            <input class="form-control" name="userNickname" placeholder="" value="${user.userNickname}" type="text"></span></li>
                            <li><span class="dd">性　别：
                            <input class="form-control" name="userSex" placeholder="" value="${user.userSex}" type="text"> </span></li>
                            <li><span class="dd">生　日：
                            <input class="form-control" name="userBirthday" placeholder="" value="${user.userBirthday }" type="text"></span></li>
                            <li><span class="dd">邮　箱：
                            <input class="form-control"name="userEmail"  placeholder="" value="${user.userEmail}" type="text"></span></li>
                            <li><span class="dd">所在地：
                            <input class="form-control" name="userAddress" placeholder="" value="${user.userAddress}" type="text"></span> </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <div class="container">
        <ul>
            <li><img  alt="" id="foot_logo"></li>
            <li>版权所有：智游3G教育　　　©&nbsp;www.zhiyou100.com</li>
            <li><img alt="" id="wxgzh"></li>
        </ul>
    </div>
</footer>

</body>
</html>
