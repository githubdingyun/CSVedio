package com.dingyun.controller;


import com.dingyun.model.Course;
import com.dingyun.model.Speaker;
import com.dingyun.model.Subject;
import com.dingyun.model.Video;
import com.dingyun.service.AdminService;
import com.dingyun.service.CourseService;
import com.dingyun.service.SpeakerService;
import com.dingyun.service.VideoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 此类会被拦截，是所有访问jsp的时候，
 * 我们通过此类的拦截来验证账号是否登陆来做出决定
 * 即jsp访问跳转控制
 */


@Controller
@RequestMapping("AdminController/")
public class AdminController {

    @Autowired
    AdminService adminService;
    @Autowired
    CourseService courseService;
    @Autowired
    SpeakerService speakerService;
    @Autowired
    VideoService videoService;


    @RequestMapping("course.do")
    public String courseShow(String page, HttpServletRequest request, HttpServletResponse response){
        if(page==null){
            page ="1";
        }
        int pagess= Integer.valueOf(page);
        PageHelper.startPage(pagess,5);
        List<Course> courses = courseService.selectAll();
        PageInfo<Course> pageInfo = new PageInfo<Course>(courses);
        int pageNum = pageInfo.getPageNum();
        int lastPage = pageInfo.getLastPage();
        Integer total = Math.toIntExact(pageInfo.getTotal());
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("courses",courses);
        httpSession.setAttribute("total",total);
        httpSession.setAttribute("pageNum",pageNum);
        httpSession.setAttribute("lastPage",lastPage);
        return  "course";
    }

    @RequestMapping("vedio.do")
    public String vedioManager(String page,HttpServletRequest request, HttpServletResponse response){
        if(page==null){
            page ="1";
        }
        int pagess= Integer.valueOf(page);
        PageHelper.startPage(pagess,5);
        List<Video> videos = videoService.selectAll();
        PageInfo<Video> pageInfo = new PageInfo<Video>(videos);
        int pageNum = pageInfo.getPageNum();
        int lastPage = pageInfo.getLastPage();
        Integer total = Math.toIntExact(pageInfo.getTotal());
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("videos",videos);
        httpSession.setAttribute("total",total);
        httpSession.setAttribute("pageNum",pageNum);
        httpSession.setAttribute("lastPage",lastPage);
        return  "vedio";
    }


    @RequestMapping("speaker.do")
    public String teacher(String page,HttpServletRequest request, HttpServletResponse response){
        if(page==null){
            page ="1";
        }
        int pagess= Integer.valueOf(page);
        PageHelper.startPage(pagess,5);
        List<Speaker> speakers = speakerService.selectAll();
        PageInfo<Speaker> pageInfo = new PageInfo<Speaker>(speakers);
        int pageNum = pageInfo.getPageNum();
        int lastPage = pageInfo.getLastPage();
        Integer total = Math.toIntExact(pageInfo.getTotal());
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("speakers",speakers);
        httpSession.setAttribute("total",total);
        httpSession.setAttribute("pageNum",pageNum);
        httpSession.setAttribute("lastPage",lastPage);
        return  "speaker";
    }

    @RequestMapping("addCourse.do")
    public String addCourse( Integer courseId, HttpServletRequest request, HttpServletResponse response){

//        不等与null说明点击的是编辑不是添加，需要set来显示数据回显
        if(courseId!=null){
            Course course = courseService.selectByPrimaryKey(courseId);
            request.getSession().setAttribute("course",course);
        }
        return  "addCourse";
    }

    @RequestMapping("addTeach.do")
    public String addTeach( Integer id, HttpServletRequest request, HttpServletResponse response){
        Speaker speaker = speakerService.selectByPrimaryKey(id);
        //注意这里使用request不适用session，让它用一次就死掉，好执行双页面判定
        request.setAttribute("speaker",speaker);
        return  "addTeach";

    }

    @RequestMapping("addVideo.do")
    public String addVideo(Integer id, HttpServletRequest request, HttpServletResponse response){
        Video video = videoService.selectByPrimaryKey(id);
        //注意这里使用request不适用session，让它用一次就死掉，好执行双页面判定
        request.setAttribute("video",video);
        return  "addVideo";
    }

    @RequestMapping("updataCourse.do")
    public String updataCourse(Integer courseId, HttpServletRequest request, HttpServletResponse response){

        Course course = courseService.selectByPrimaryKey(courseId);
        request.getSession().setAttribute("course",course);
        return  "updataCourse";
    }

    @RequestMapping("videoPlay.do")
    public String videoPlay(Integer videoId, HttpServletRequest request, HttpServletResponse response){

        Video userVideo = videoService.selectByPrimaryKey(videoId);
        Course userCourse = courseService.selectByPrimaryKey(userVideo.getCourseId());
        Speaker userSpeaker = speakerService.selectByPrimaryKey(userVideo.getSpeakerId());
        request.setAttribute("userVideo",userVideo);
        request.setAttribute("userCourse",userCourse);
        request.setAttribute("userSpeaker",userSpeaker);
        return "videoPlay";
    }

    @RequestMapping("userDocUpa.do")
    public String userDocUpa(Integer courseId, HttpServletRequest request, HttpServletResponse response){

        return "userDocUpa";
    }
    @RequestMapping("userImg.do")
    public String userImg(Integer courseId, HttpServletRequest request, HttpServletResponse response){

        return "userImg";
    }
    @RequestMapping("userMainPage.do")
    public String userMainPage(Integer courseId, HttpServletRequest request, HttpServletResponse response){

        return "userMainPage";
    }
    @RequestMapping("userPasswordSafe.do")
    public String userPasswordSafe(Integer courseId, HttpServletRequest request, HttpServletResponse response){

        return "userPasswordSafe";
    }
    @RequestMapping("videoShow.do")
    public String videoShow(Integer id, HttpServletRequest request, HttpServletResponse response){

        //        4   个表 数据写入
        HttpSession session = request.getSession();
        List<Course> courses = courseService.selectAll();
        List<Speaker> speakers = speakerService.selectAll();
        List<Video> videos = videoService.selectAll();

//          4个数据  存入session
        session.setAttribute("courses", courses);
        session.setAttribute("speakers", speakers);
        session.setAttribute("videos", videos);
//        如果为空，展示所有，否则展示那门课
        if(id==null)
        {
            List<Course> userCourses =courseService.selectAll();
            request.getSession().setAttribute("userCourses",userCourses);
        }
        else {
            Course course = courseService.selectByPrimaryKey(id);
            List<Course> userCourses = new ArrayList<>();
            userCourses.add(course);
            request.getSession().setAttribute("userCourses",userCourses);
        }

        return "videoShow";
    }
    @RequestMapping("home.do")
    public String home( HttpServletRequest request, HttpServletResponse response){
//        如果为空，展示所有，否则展示那门课
        return "../../home";
    }


}
