package com.study.common.web;

import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
public class CommonController {
    @Inject
    IUserService userService;

    @RequestMapping("/")
    public String home(Model model) {
        return "home";
    }

    @GetMapping("/common/login.wow")
    public String goLogin() {
        return "common/login";
    }


    @PostMapping("/common/login.wow")
    public String loginChk(Model model, UserVO user,  String rememberId, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
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
                    System.out.println("정상확인");
                    return "home";
                } else {
                    return "redirect:/common/login.wow?msg=" + URLEncoder.encode("존재하지 않거나 옳바르지 않은 아이디 비밀번호입니다", "UTF-8");
                }
            } else {
                return "redirect:/common/login.wow?msg=" + URLEncoder.encode("존재하지 않거나 옳바르지 않은 아이디 비밀번호입니다", "UTF-8");
            }
        } else {

            return "redirect:/common/login.wow?msg=" + URLEncoder.encode("존재하지 않거나 옳바르지 않은 아이디 비밀번호입니다", "UTF-8");
        }

    }

    @GetMapping("/common/logout.wow")
    public String doLogout(HttpServletRequest request) {
        request.getSession().removeAttribute("USER_INFO");
        return "redirect:/";
    }

    @GetMapping("/common/signUp.wow")
    public String goSignUp() {
        return "common/signUp";
    }

}