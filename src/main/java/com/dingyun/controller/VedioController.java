package com.dingyun.controller;

import com.dingyun.model.Speaker;
import com.dingyun.model.Video;
import com.dingyun.service.VideoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("VideoController/")
public class VedioController {

    @Autowired
    VideoService videoService;

    @ResponseBody
    @RequestMapping("delete.do")
    public String delete(Integer id, HttpServletRequest request, HttpServletResponse response){
        if (videoService.deleteByPrimaryKey(id)==1)
        {
            List<Video> videos = videoService.selectAll();
            request.getSession().setAttribute("videos",videos);
            return  "success";
        }
        else
            return "fail";

    }


    @RequestMapping("updata.do")
    public String updata(Video video,Integer id, HttpServletRequest request, HttpServletResponse response){
        videoService.selectByPrimaryKey(video.getVideoId());
        videoService.updateByPrimaryKey(video);
        return  "redirect:/AdminController/vedio.do";
    }


    @RequestMapping("insert.do")
    public String insert(Video video,Integer id, HttpServletRequest request, HttpServletResponse response){
        if (video.getVideoId()==null){
            videoService.insert(video);
        }
        else {
            videoService.updateByPrimaryKeySelective(video);
        }
        return  "redirect:/AdminController/vedio.do";
    }

    @RequestMapping("deleteMore.do")
    public String deleteMore(Integer[] ids, HttpServletRequest request, HttpServletResponse response){
        videoService.deleteMore(ids);
        return  "redirect:/AdminController/vedio.do";
    }

//    title=&speakerID=0&courseID=0
    @RequestMapping("Selectsome.do")
    public String Selectsome(String page,String title,Integer speakerID,Integer courseID, HttpServletRequest request, HttpServletResponse response){
        if(page==null){
            page="1";
        }
        Integer pages = Integer.valueOf(page);
        Video video = new Video();
        video.setVideoTitle(title);
        video.setCourseId(courseID);
        video.setSpeakerId(speakerID);
        PageHelper.startPage(pages,5);
        List<Video> videos = videoService.selectSome(video);
        PageInfo<Video> videoPageInfo = new PageInfo<>(videos);
        int pageNum = videoPageInfo.getPageNum();
        long total = videoPageInfo.getTotal();
        int lastPage = videoPageInfo.getLastPage();

        request.getSession().setAttribute("videos",videos);
        request.getSession().setAttribute("pageNum",pageNum);
        request.getSession().setAttribute("total",total);
        request.getSession().setAttribute("lastPage",lastPage);
        return  "vedio";
    }



}
