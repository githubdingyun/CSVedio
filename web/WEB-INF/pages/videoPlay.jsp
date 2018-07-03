<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DinGYun
  Date: 2018/6/29
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">

    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description"
          content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">

    <base href="http://localhost:8080/CSVedio/">


    <script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/confirm.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/message_cn.js"></script>
    <script src="z/gVerify.js"></script>
    <script src="z/video.js"></script>
    <link rel="stylesheet" href="z/video-js.css">
    <link rel="stylesheet" href="z/base.css">
    <link rel="stylesheet" href="z/css.css">
    <link rel="stylesheet" href="z/bootstrap.css">
    <link rel="icon" href="z/ali.jpg" type="image/png">
    <link href="z/video-js.css" rel="stylesheet" type="text/css">
    <title>在线公开课---zigbee|java|大数据|HTML5|python|UI|PHP视频教程</title>

</head>

<body class="w100" style="padding-top: 0px;">


<header>
    <div class="container">
        <span>欢迎来到IT培训的黄埔军校——智游教育！</span>
        <div id="regBlock" style="float: right">
            <c:if test="${empty user}">
                <a href="#" id="reg_open">
                    <img src="z/we.png">注册</a>
                <a id="login_open">
                    <img src="z/we.png">登录</a>
            </c:if>
            <c:if test="${not empty user}">
                <a href="AdminController/userMainPage.do?id=${user.userId}">
                    <img src="${user.userImgurl}" width="39" height="39">${user.userEmail}</a>
                <a href="UserController/userlogout.do" >
                    <img src="z/we.png">退出</a>
            </c:if>
        </div>
        <a onclick="JavaScript:addFavorite2()"><img src="z/sc.png" draggable="false">加入收藏</a>
        <a target="_blank" href="BaseController/AdminLogin.do"><img src="z/we.png" draggable="false">
            后台管理</a> <a class="color_e4"><img src="z/phone.png" draggable="false">
        0371-88888598
        4006-371-555</a>
    </div>
</header>




<div>
    <!--面包屑导航-->
    <div class="container mian-nav">公开课 / ${userCourse.courseTitle}</div>

    <div id="content">


        <div class="intro">
            <div class="container">
                <div class="v-intro">
                    <div class="left">
                        <video
                                width="505"
                                height="280"
                                id="my-player"
                                <%--class="video-js  vjs-big-play-centered vjs-fluid "--%>
                                class="video-js  vjs-big-play-centered  "
                                controls
                                preload="auto"
                                poster="${userVideo.videoImgUrl}"
                                data-setup=''>
                            <source src="${userVideo.videoUrl}" type="video/mp4" />
                            <p class="vjs-no-js">
                                To view this video please enable JavaScript, and consider upgrading to a
                                web browser that
                                <a href="http://videojs.com/html5-video-support/" target="_blank">
                                    supports HTML5 video
                                </a>
                            </p>
                        </video>
                    </div>

                    <div class="right">
                        <p class="right-title">${userVideo.videoTitle}</p>
                        <div class="avatar">
                            <span style="background-image: url(${userSpeaker.speakerHeadUrl})"></span>
                            <p>
                                <b>讲师：${userSpeaker.speakerName}</b><br>
                                <i><strong>${userSpeaker.speakerDesc}</strong></i>
                            </p>
                        </div>
                        <p class="video-intro">
                            <span>本节内容：${userVideo.videoDesc}</span>
                        </p>
                    </div>
                </div>

                <div class="kcjs">
                    <p class="title">课程介绍</p>
                    <p class="content">
                        ${userCourse.courseDesc}</p>
                </div>

            </div>
        </div>
        <!--目录-->
        <div class="catalog">
            <div class="container">
                <p class="title">目录</p>
                <c:forEach items="${videos}" var="i">
                    <c:if test="${userCourse.courseId==i.courseId}">
                        <div class="chapter">
                            <p class="biaoti"><a href="AdminController/videoPlay.do?videoId=${i.videoId}">${i.videoTitle}</a></p>
                            <p class="lecturer"></p>
                            <p class="lecturer">讲师：${userSpeaker.speakerName}</p>
                            <div class="v-info">
                                <span class="count"><img src="z/count.png" alt="">${i.videoPlayNum}</span>
                                <span class="duration"><img src="z/player.png" alt="">${i.videoTime}</span>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>


            </div>
        </div>
    </div>


</div>


<!--页脚-->
<footer>
    <ul>
        <li>
            <img src="./前台视频播放_files/footer_logo.png" alt="" draggable="false">
        </li>
        <li class="mt25">
            <h3>各校区地址</h3>
            <ul>
                <li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层</li>
                <li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路</li>
                <li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼</li>
                <li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层</li>
                <li>西安分校<br>中国-西安莲湖区　联系人：梁老师 13201570801</li>
            </ul>
        </li>
        <li class="mt25">
            <h3>联系我们</h3>
            <ul id="foo_icon">
                <li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
                <li>e-mail:zy@zhiyou100.com</li>
                <li>电话:4006-371-555 0371-88888598</li>
                <li class="erwei">
                    <br>
                    <div>
                        <img class="weixin" src="z/a.png" alt="" draggable="false">
                        <img class="weibo" src="z/a_002.png" alt="" draggable="false">
                    </div>
                </li>
            </ul>
        </li>
    </ul>
    <div class="record">智游教育 © 豫ICP备17000832号-1 　河南智游臻龙教育科技有限公司</div>
</footer>



</body>
</html>
