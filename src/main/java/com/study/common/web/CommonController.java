package com.study.common.web;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.common.util.StudyAttachUtils;
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
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;

@Controller
public class CommonController {

    @Inject
    StudyAttachUtils studyAttachUtils;
    @Inject
    IAttachDAO iAttachDAO;

    @RequestMapping("/")
    public String home(Model model) {
        return "home";
    }


    @GetMapping("/common/save.wow")
    public String dd(Model model) {

        return "common/fileSave";
    }

    @PostMapping("/common/save.wow")
    public String dd(Model model, @RequestParam(name = "boFiles", required = false) MultipartFile boFiles) {
        System.out.println("bofile===>" + boFiles);
        try {
            AttachVO attachByMultipart = studyAttachUtils.getAttachByMultipart(boFiles, "userIcon", "users");
            attachByMultipart.setAtchParentNo("a001");
            iAttachDAO.insertAttach(attachByMultipart);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return "home";
    }

    @RequestMapping(value = "/common/alert.wow", params = {"msg", "url"})
    public String onlyUserCan(HttpServletRequest request, @RequestParam("msg") String msg, @RequestParam("url") String url) {
        String getMsg = "";

        switch (msg) {
            case "users":
                getMsg = "회원만 이용가능한 서비스입니다.";
                break;

            case "noItem":
                getMsg = "물품을 체크하고 구매하기를 진행해주세요";
                break;

            case "cantBuy":
                getMsg = "결제에 실패했습니다. 다시 진행해주세요";
                break;

            case "canBuy":
                getMsg = "결제에 성공했습니다.";
                break;

            case "stockOver":
                getMsg = "구매하려는 상품의 재고가 부족합니다. 수량을 다시 선택해주세요";
                break;
            case "successSignUp":
                getMsg = "회원가입에 성공했습니다.";
                break;
            case "failedSignUp":
                getMsg = "회원가입에 실패했습니다. 값을 다시 확인해주세요";
                break;
            case "successModify":
                getMsg = "정보수정에 성공했습니다.";
                break;
            case "failedModify":
                getMsg = "정보수정에 실패했습니다. 값을 다시 확인해주세요";
                break;
            case "successChangePass":
                getMsg = "비밀번호를 변경하였습니다.";
                break;
            case "failedChangePass":
                getMsg = "현재비밀번호가 일치하지 않습니다.";
                break;

        }

        request.setAttribute("msg", getMsg);
        request.setAttribute("url", url);
        return "/common/alert";

    }
}