package com.dingyun.dao;


import com.dingyun.model.Speaker;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface SpeakerMapper extends BaseMapper<Speaker>,ServiceMapper<Speaker>{
    int deleteByPrimaryKey(Integer speakerId);

    int insert(Speaker record);

    int insertSelective(Speaker record);

    Speaker selectByPrimaryKey(Integer speakerId);

    int updateByPrimaryKeySelective(Speaker record);

    int updateByPrimaryKey(Speaker record);

}