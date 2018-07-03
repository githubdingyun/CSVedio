package com.dingyun.dao;


import com.dingyun.model.Subject;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface SubjectMapper extends BaseMapper<Subject>,ServiceMapper<Subject>{
    int deleteByPrimaryKey(Integer subjectId);

    int insert(Subject record);

    int insertSelective(Subject record);

    Subject selectByPrimaryKey(Integer subjectId);

    int updateByPrimaryKeySelective(Subject record);

    int updateByPrimaryKey(Subject record);


}