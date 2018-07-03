package com.dingyun.service.impl;

import com.dingyun.dao.SubjectMapper;
import com.dingyun.model.Subject;
import com.dingyun.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class SubjectServiceImpl implements SubjectService {

    @Autowired
    SubjectMapper subjectMapper;

    public int deleteByPrimaryKey(Integer ObjectId) {

        return subjectMapper.deleteByPrimaryKey(ObjectId);
    }

    public int insert(Subject record) {
        return subjectMapper.insert(record);
    }

    public int insertSelective(Subject record) {
        return subjectMapper.insertSelective(record);
    }

    public Subject selectByPrimaryKey(Integer ObjectId) {
        return subjectMapper.selectByPrimaryKey(ObjectId);
    }

    public int updateByPrimaryKeySelective(Subject record) {
        return subjectMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Subject record) {
        return subjectMapper.updateByPrimaryKey(record);
    }

    public List<Subject> selectAll() {
        return subjectMapper.selectAll();
    }

    public List<Subject> selectSome(Subject subject) {
        return subjectMapper.selectSome(subject);
    }

    public Integer deleteMore(Integer[] ids) {
        return subjectMapper.deleteMore(ids);
    }

}
