package com.study.user.web;

import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;

@Controller
public class UserController {
    @Inject
    IUserService userService;
    @RequestMapping("/user/userProfile.wow")
    public String goProfile(Model model,String userId){
        UserVO user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "user/userProfile";

    }
}
