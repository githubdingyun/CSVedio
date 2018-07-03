package com.dingyun.controller;

import com.dingyun.model.Course;
import com.dingyun.model.Speaker;
import com.dingyun.service.SpeakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("SpeakerController/")
public class SpeakerController {

    @Autowired
    SpeakerService speakerService;

    @ResponseBody
    @RequestMapping("delete.do")
    public String delete(Integer id, HttpServletRequest request, HttpServletResponse response) {
        if (speakerService.deleteByPrimaryKey(id) == 1) {
            List<Speaker> speakers = speakerService.selectAll();
            request.getSession().setAttribute("speakers", speakers);
            return "success";
        } else
            return "fail";

    }


    @RequestMapping("updata.do")
    public String updata(Speaker speaker, Integer id, HttpServletRequest request, HttpServletResponse response) {
        speakerService.selectByPrimaryKey(speaker.getSpeakerId());
        speakerService.updateByPrimaryKey(speaker);
        return  "redirect:/AdminController/speaker.do";
    }


    @RequestMapping("insert.do")
    public String insert(Speaker speaker, Integer id, HttpServletRequest request, HttpServletResponse response) {
        if (speaker.getSpeakerId()==null) {
            speakerService.insert(speaker);
        } else {
            speakerService.updateByPrimaryKeySelective(speaker);
        }
        return  "redirect:/AdminController/speaker.do";
    }

    @RequestMapping("deleteMore.do")
    public String deleteMore(Integer[] ids, HttpServletRequest request, HttpServletResponse response){
        speakerService.deleteMore(ids);
        return  "redirect:/AdminController/speaker.do";
    }

}
