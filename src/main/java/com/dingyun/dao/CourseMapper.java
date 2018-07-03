package com.dingyun.dao;


import com.dingyun.model.Course;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface CourseMapper extends BaseMapper<Course>,ServiceMapper<Course>{
    int deleteByPrimaryKey(Integer courseId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer courseId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

}