package com.dingyun.service.impl;

import com.dingyun.dao.VideoMapper;
import com.dingyun.model.Video;
import com.dingyun.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    VideoMapper videoMapper;

    public int deleteByPrimaryKey(Integer ObjectId) {
        int i = videoMapper.deleteByPrimaryKey(ObjectId);
        return i;
    }

    public int insert(Video record) {
        return videoMapper.insert(record);
    }

    public int insertSelective(Video record) {
        return videoMapper.insertSelective(record);
    }

    public Video selectByPrimaryKey(Integer ObjectId) {
        return videoMapper.selectByPrimaryKey(ObjectId);
    }

    public int updateByPrimaryKeySelective(Video record) {

        return videoMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Video record) {
        return videoMapper.updateByPrimaryKey(record);
    }

    public List<Video> selectAll() {
        return videoMapper.selectAll();
    }

    public List<Video> selectSome(Video video) {
        return videoMapper.selectSome(video);
    }

    public Integer deleteMore(Integer[] ids) {
        return videoMapper.deleteMore(ids);
    }

}
