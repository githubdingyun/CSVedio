package com.dingyun.service.impl;

import com.dingyun.dao.SpeakerMapper;
import com.dingyun.model.Speaker;
import com.dingyun.service.SpeakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class SpeakerServiceImpl implements SpeakerService {

    @Autowired
    SpeakerMapper speakerMapper;


    public int deleteByPrimaryKey(Integer ObjectId) {
        return speakerMapper.deleteByPrimaryKey(ObjectId);
    }

    public int insert(Speaker record) {
        return speakerMapper.insert(record);
    }

    public int insertSelective(Speaker record) {
        return speakerMapper.insertSelective(record);
    }

    public Speaker selectByPrimaryKey(Integer ObjectId) {
        return speakerMapper.selectByPrimaryKey(ObjectId);
    }

    public int updateByPrimaryKeySelective(Speaker record) {
        return speakerMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Speaker record) {
        return speakerMapper.updateByPrimaryKey(record);
    }

    public List<Speaker> selectAll() {
        return speakerMapper.selectAll();
    }

    public List<Speaker> selectSome(Speaker speaker) {
        return speakerMapper.selectSome(speaker);
    }

    public Integer deleteMore(Integer[] ids) {
        return speakerMapper.deleteMore(ids);
    }

}
