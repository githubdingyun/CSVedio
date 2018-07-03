package com.dingyun.service.impl;

import com.dingyun.dao.UserMapper;
import com.dingyun.model.User;
import com.dingyun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    public User loginVerifier(User record) {
        return userMapper.loginVerifier(record);
    }

    public User usernameVerifier(User record) {
        return userMapper.usernameVerifier(record);
    }

    @Override
    public User validateEmail(User record) {
        return userMapper.validateEmail(record);
    }


    public int deleteByPrimaryKey(Integer ObjectId) {
        return userMapper.deleteByPrimaryKey(ObjectId);
    }

    public int insert(User record) {
        return userMapper.insert(record);
    }

    public int insertSelective(User record) {
        return userMapper.insertSelective(record);
    }

    public User selectByPrimaryKey(Integer ObjectId) {
        return userMapper.selectByPrimaryKey(ObjectId);
    }

    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(User record) {
        return userMapper.updateByPrimaryKey(record);
    }

    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    public List<User> selectSome(User user) {
        return null;
    }

    public Integer deleteMore(Integer[] ids) {
        return null;
    }

}
