package com.dingyun.controller;

import com.dingyun.model.Admin;
import com.dingyun.model.Course;
import com.dingyun.service.CourseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
@RequestMapping("CourseController/")
public class CourseController {

    @Autowired
    CourseService courseService;


    @ResponseBody
    @RequestMapping("delete.do")
    public String delete(Integer id, HttpServletRequest request, HttpServletResponse response){
        if (courseService.deleteByPrimaryKey(id)==1)
        {
            List<Course> courses = courseService.selectAll();
            request.getSession().setAttribute("courses",courses);
            return  "success";
        }
        else
            return "fail";

    }

    @RequestMapping("updata.do")
    public String updata(Course course,Integer id, HttpServletRequest request, HttpServletResponse response){
        courseService.selectByPrimaryKey(course.getCourseId());
        courseService.updateByPrimaryKeySelective(course);
        return  "redirect:/AdminController/course.do";
    }


    @RequestMapping("insert.do")
    public String insert(Course course,Integer id, HttpServletRequest request, HttpServletResponse response){
        courseService.insert(course);
        return  "redirect:/AdminController/course.do";
    }

    @RequestMapping("deleteMore.do")
    public String deleteMore(Integer[] ids, HttpServletRequest request, HttpServletResponse response){
        courseService.deleteMore(ids);
        return  "redirect:/AdminController/course.do";
    }





}
