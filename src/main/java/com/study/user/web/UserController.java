package com.study.user.web;

import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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


}
