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
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class CommonController {


    @RequestMapping("/")
    public String home(Model model) {
        return "home";
    }

    @RequestMapping(value = "/common/alert.wow", params = {"msg", "url"})
    public String onlyUserCan(HttpServletRequest request, @RequestParam("msg") String msg, @RequestParam("url") String url) {
        String getMsg = "";
        if (msg.equals("users")) {
            getMsg = "회원만 이용가능한 서비스입니다.";
        }
        if (msg.equals("noItem")) {
            getMsg = "물품을 체크하고 구매하기를 진행해주세요";
        }    if (msg.equals("cantBuy")) {
            getMsg = "결제에 실패했습니다. 다시 진행해주세요";
        }   if (msg.equals("canBuy")) {
            getMsg = "결제에 성공했습니다.";
        }
        request.setAttribute("msg", getMsg);
        request.setAttribute("url", url);
        return "/common/alert";

    }
}