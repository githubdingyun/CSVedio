package com.dingyun.controller;

import com.dingyun.model.*;
import com.dingyun.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("BaseController/")
public class BaseController {

    @Autowired
    AdminService adminService;
    @Autowired
    CourseService courseService;
    @Autowired
    SpeakerService speakerService;
    @Autowired
    VideoService videoService;
    @Autowired
    SubjectService subjectService;

    @RequestMapping("AdminLogin.do")
    public ModelAndView AdminLogin(Admin adm, HttpServletRequest request, HttpServletResponse response) {
        Admin admin = adminService.loginVerifier(adm);
        System.out.println(admin);
        HttpSession session = request.getSession();
        ModelAndView mav = new ModelAndView();
        if (admin != null || session.getAttribute("admins") != null) {
//        4   个表 数据写入
            List<Admin> admins = adminService.selectAll();
            List<Course> courses = courseService.selectAll();
            List<Speaker> speakers = speakerService.selectAll();
            List<Video> videos = videoService.selectAll();
            List<Subject> subjects = subjectService.selectAll();

//          4个数据  存入session
            session.setAttribute("admins", admins);
            session.setAttribute("courses", courses);
            session.setAttribute("speakers", speakers);
            session.setAttribute("videos", videos);
            session.setAttribute("subjects", subjects);
            if (admin != null) {
                session.setAttribute("admin", admin);
            }
            System.out.println(courses);

//            登陆成功到course
            mav.setViewName("redirect:/AdminController/course.do");
        } else {
//            登陆失败到login
            request.setAttribute("message", "登陆失败");
            mav.setViewName("login");
        }
        return mav;
    }


    @RequestMapping("Adminlogout.do")
    public ModelAndView Adminlogout(Admin adm, HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }

    @ResponseBody
    @RequestMapping("adminNameVerifier.do")
    public String adminNameVerifier(Admin adm, HttpServletRequest request, HttpServletResponse response) {
        Admin admin = adminService.usernameVerifier(adm);
        if (admin != null)
            return "yes";
        else
            return "no";
    }

}
