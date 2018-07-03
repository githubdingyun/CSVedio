package com.dingyun.controller;

import com.dingyun.model.*;
import com.dingyun.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("UserController")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    CourseService courseService;
    @Autowired
    SpeakerService speakerService;
    @Autowired
    VideoService videoService;
    @Autowired
    SubjectService subjectService;

    @ResponseBody
    @RequestMapping("/userRegister.do")
    public String userRegister(User user, HttpServletRequest request, HttpServletResponse response){
        userService.insertSelective(user);

        return "success";
    }
    @ResponseBody
    @RequestMapping("/userLogin.do")
    public String userLogin(User use, HttpServletRequest request, HttpServletResponse response){
        User user =userService.loginVerifier(use);
        if(user!=null){

            request.getSession().setAttribute("user",user);
           return "success";
        }
        else{
            return "sorry";
        }

    }


    @RequestMapping("/userlogout.do")
    public ModelAndView userlogout(HttpServletRequest request, HttpServletResponse response){
        request.getSession().invalidate();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/AdminController/home.do");
        return  mav;
    }

    @RequestMapping("/forgetPassword.do")
    public String forgetPassword(HttpServletRequest request, HttpServletResponse response){

        return ("../home");
    }



    @ResponseBody
    @RequestMapping("/userNameVerifier.do")
    public String usernameVerifier(User adm,HttpServletRequest request, HttpServletResponse response){
        User user =userService.usernameVerifier(adm);
        if(user!=null)
            return "yes";
        else
            return "no";
    }
    @ResponseBody
    @RequestMapping("/validateEmail.action")
    public String validateEmail(User adm,HttpServletRequest request, HttpServletResponse response){
        User user =userService.validateEmail(adm);
        if(user==null)
            return "success";
        else
            return "no";
    }

    @RequestMapping("/userUpdate.do")
    public String userUpdate(User use,  HttpServletRequest request, HttpServletResponse response){
    userService.updateByPrimaryKeySelective(use);
    User user = userService.selectByPrimaryKey(use.getUserId());
    request.getSession().setAttribute("user",user);

        return "userMainPage";
    }


    @RequestMapping("/upload.do")
    public String saveUserServlet(MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        String path ="E:\\CodeTools\\javaTools\\IdeaProjects\\CSVedio\\web\\userimg\\"+file.getOriginalFilename();
        try {
            file.transferTo(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        User user = (User) request.getSession().getAttribute("user");
        String url ="http://localhost:8080/CSVedio/userimg/"+file.getOriginalFilename();
        user.setUserImgurl(url);
        userService.updateByPrimaryKeySelective(user);
        request.getSession().setAttribute("user",user);
        return "userMainPage";
    }



}
