package com.study.user.service;

import com.study.user.dao.IUserDAO;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserServiceImpl implements IUserService{
    @Inject
    IUserDAO userDAO;
    @Override
    public UserVO getUser(String userId) {
        return userDAO.getUser(userId);
    }
}
