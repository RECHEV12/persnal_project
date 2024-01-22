package com.study.user.web;

import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class UserController {
    @Inject
    IUserService userService;

    @RequestMapping("/user/userProfile.wow")
    public String goProfile(Model model, String userId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");

        UserVO user = userService.getUser(userId);
        model.addAttribute("user", user);
        if (userInfo != null) {
            if (userId.equals(userInfo.getUserId())) {
                return "user/myPage";
            } else {

                return "user/userProfile";
            }
        } else {
            return "user/userProfile";
        }
    }

    @RequestMapping("/user/myPage.wow")
    public String goYyPage(Model model) {
//        UserVO user = userService.getUser(userId);
//        model.addAttribute("user", user);
        return "user/myPage";
    }

    @GetMapping("/user/login.wow")
    public String goLogin() {
        return "user/login";
    }


    @PostMapping("/user/login.wow")
    public String loginChk(Model model, UserVO user, String rememberId, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        if (user.getUserId() != null) {
            UserVO user1 = userService.getUser(user.getUserId());

            if (rememberId == null) {
                rememberId = "false";
            }
            userService.rememberMe(rememberId,user.getUserId(),request,response);
            if (user1 != null) {
                if (user.getUserPass().equals(user1.getUserPass())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("USER_INFO", user1);
                    return "home";
                } else {
                    return "redirect:/user/login.wow?msg=" + URLEncoder.encode("존재하지 않거나 옳바르지 않은 아이디 비밀번호입니다", "UTF-8");
                }
            } else {
                return "redirect:/user/login.wow?msg=" + URLEncoder.encode("존재하지 않거나 옳바르지 않은 아이디 비밀번호입니다", "UTF-8");
            }
        } else {

            return "redirect:/user/login.wow?msg=" + URLEncoder.encode("존재하지 않거나 옳바르지 않은 아이디 비밀번호입니다", "UTF-8");
        }

    }

    @GetMapping("/user/logout.wow")
    public String doLogout(HttpServletRequest request) {
        request.getSession().removeAttribute("USER_INFO");
        return "redirect:/";
    }

    @GetMapping("/user/signUp.wow")
    public String goSignUp() {
        return "user/signUp";
    }

}
