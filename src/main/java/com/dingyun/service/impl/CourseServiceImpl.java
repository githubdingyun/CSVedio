package com.dingyun.service.impl;

import com.dingyun.dao.CourseMapper;
import com.dingyun.model.Course;
import com.dingyun.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseMapper courseMapper;


    public int deleteByPrimaryKey(Integer ObjectId) {
        return courseMapper.deleteByPrimaryKey(ObjectId);
    }

    public int insert(Course record) {
        return courseMapper.insert(record);
    }

    public int insertSelective(Course record) {
        return courseMapper.insertSelective(record);
    }

    public Course selectByPrimaryKey(Integer ObjectId) {
        return  courseMapper.selectByPrimaryKey(ObjectId);
    }

    public int updateByPrimaryKeySelective(Course record) {
        return courseMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Course record) {
        return courseMapper.updateByPrimaryKey(record);
    }

    public List<Course> selectAll() {
        return courseMapper.selectAll();
    }

    public List<Course> selectSome(Course course) {
        return courseMapper.selectAll();
    }

    public Integer deleteMore(Integer[] ids) {
        return courseMapper.deleteMore(ids);
    }

}
