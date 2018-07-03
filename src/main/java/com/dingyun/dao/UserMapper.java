package com.dingyun.dao;


import com.dingyun.model.Admin;
import com.dingyun.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface UserMapper extends BaseMapper<User>{
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User loginVerifier(User record);

    User usernameVerifier(User record);

    User validateEmail(User record);


}