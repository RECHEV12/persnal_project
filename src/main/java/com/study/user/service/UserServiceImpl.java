package com.study.user.service;

import com.study.common.util.CookieUtils;
import com.study.user.dao.IUserDAO;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service
public class UserServiceImpl implements IUserService {
    @Inject
    IUserDAO userDAO;

    @Override
    public UserVO getUser(String userId) {
        return userDAO.getUser(userId);
    }

    @Override
    public void rememberMe(String rememberId, String userId, HttpServletRequest request, HttpServletResponse response) {
        if (rememberId.equals("true")) {

            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("rememberMe")) {
                    cookie.setMaxAge(0);
                }
            }


            try {
                Cookie cookie = CookieUtils.createCookie("rememberMe", userId, 24 * 60 * 60 * 7);
                response.addCookie(cookie);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }


        } else {
            Cookie[] cookies = request.getCookies();
            System.out.println("지우기");
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("rememberMe")) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }

        }


    }


}
