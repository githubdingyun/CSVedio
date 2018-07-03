package com.dingyun.dao;


import com.dingyun.model.User;
import com.dingyun.model.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoMapper extends BaseMapper<Video>,ServiceMapper<Video>{
    int deleteByPrimaryKey(Integer videoId);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer videoId);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);

}