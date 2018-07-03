package com.dingyun.controller;


import com.dingyun.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("SubjectController/")
public class SubjectController {
    @Autowired
    SubjectService subjectService;



}
