package com.study.user.service;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.common.util.CookieUtils;
import com.study.common.util.StudyAttachUtils;
import com.study.user.dao.IUserDAO;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
    @Inject
    IAttachDAO attachDAO;
    @Inject
    StudyAttachUtils attachUtils;

    @Override
    public UserVO getUser(String userId) {
        return userDAO.getUser(userId);
    }

    @Override
    public int insertUser(UserVO user, MultipartFile boFiles) {
        int insertUserResultRow = userDAO.insertUser(user);
        if (insertUserResultRow == 1) {
            userDAO.insertIntroduce(user.getUserId());
            try {
                if (!boFiles.isEmpty()) {
                    AttachVO attach = attachUtils.getAttachByMultipart(boFiles, "userIcon", "users");
                    attach.setAtchParentNo(user.getUserId());
                    int insertAttachResultRow = attachDAO.insertAttach(attach);
                    if (insertAttachResultRow == 1) {
                        return 1;
                    } else {
                        System.out.println("회원가입까진 성공했으나 파일저장 실패");
                        return 0;
                    }
                } else {
                    return 1;
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("회원가입 실패");
            return 0;
        }
    }

    @Override
    public int userModify(UserVO user, MultipartFile boFiles, HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        UserVO userFromDB = userDAO.getUser(userInfo.getUserId());
        if (userFromDB.getUserPass().equals(user.getUserPass())) {
            user.setUserId(userInfo.getUserId());
            int resultRow = userDAO.userModify(user);
            if (!boFiles.isEmpty()) {
                try {
                    AttachVO attachByUserId = attachDAO.getAttachByUserId(user.getUserId());
                    int[] arr = new int[1];
                    arr[0] = attachByUserId.getAtchNo();
                    int i = attachDAO.deleteAtches(arr);
                    AttachVO attach = attachUtils.getAttachByMultipart(boFiles, "userIcon", "users");
                    attach.setAtchParentNo(user.getUserId());
                    attachDAO.insertAttach(attach);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            if (resultRow == 1) {
                return 1;
            } else {
                return 0;
            }

        } else {
            return 0;

        }

    }

    @Override
    public void passChange(String newPass, String userId) {
        userDAO.passChange(newPass, userId);
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
