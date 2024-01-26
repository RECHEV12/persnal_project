package com.study.user.service;

import com.study.user.vo.UserVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IUserService {
    public UserVO getUser(String userId);

    public int insertUser(UserVO user, MultipartFile boFiles);



    public void rememberMe(String rememberId, String userId, HttpServletRequest request, HttpServletResponse response);

}
