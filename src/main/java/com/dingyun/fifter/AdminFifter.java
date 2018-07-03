package com.dingyun.fifter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author DinGYun
 * 这是spring提供的拦截器工具，我们可以通过实现该类+配置Springmvc文件来实现对我们想要的界面进行拦截操作
 * 当返回值是false时候，我们拦截的界面失去继续访问的功能
 * 当返回是true的时候，页面操作继续进行，并且过滤了我们的页面
 * 我们可以通过spring提供的拦截实现界面的编码初始化和登陆验证
 */

public class AdminFifter implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Object admin = httpServletRequest.getSession().getAttribute("admin");
        if (admin==null)
        {
            System.out.println("该操作被拦截");
            httpServletRequest.setCharacterEncoding("utf-8");
            httpServletResponse.sendRedirect("http://localhost:8080/CSVedio/");
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
