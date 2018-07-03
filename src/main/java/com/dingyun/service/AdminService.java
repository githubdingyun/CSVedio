package com.dingyun.service;

import com.dingyun.model.Admin;

public interface AdminService extends BaseService<Admin> {

    Admin loginVerifier(Admin record);

    Admin usernameVerifier(Admin record);
}
