package com.dingyun.service.impl;

import com.dingyun.dao.AdminMapper;
import com.dingyun.model.Admin;
import com.dingyun.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;


    public Admin loginVerifier(Admin record) {
        return adminMapper.loginVerifier(record);
    }

    public Admin usernameVerifier(Admin record) {
        return adminMapper.usernameVerifier(record);
    }

    public int deleteByPrimaryKey(Integer ObjectId) {
        return adminMapper.deleteByPrimaryKey(ObjectId);
    }

    public int insert(Admin record) {
        return adminMapper.insert(record);
    }

    public int insertSelective(Admin record) {
        return adminMapper.insertSelective(record);
    }

    public Admin selectByPrimaryKey(Integer ObjectId) {
        return adminMapper.selectByPrimaryKey(ObjectId);
    }

    public int updateByPrimaryKeySelective(Admin record) {
        return adminMapper.updateByPrimaryKey(record);
    }

    public int updateByPrimaryKey(Admin record) {
        return adminMapper.updateByPrimaryKey(record);
    }

    public List<Admin> selectAll() {
        return adminMapper.selectAll();
    }

    public List<Admin> selectSome(Admin admin) {
        return adminMapper.selectSome(admin);
    }

    public Integer deleteMore(Integer[] ids) {
        return adminMapper.deleteMore(ids);
    }

}
