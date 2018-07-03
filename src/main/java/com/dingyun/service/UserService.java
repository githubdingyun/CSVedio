package com.dingyun.service;

import com.dingyun.model.User;
import org.springframework.stereotype.Service;

@Service

public interface  UserService  extends BaseService<User>{

    User loginVerifier(User record);

    User usernameVerifier(User record);

    User validateEmail(User record);

}
