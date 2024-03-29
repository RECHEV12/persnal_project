package com.study.user.web;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.product.cart.vo.CartVO;
import com.study.product.history.service.IHistoryService;
import com.study.product.history.vo.HistoryVO;
import com.study.product.option.service.IOptionService;
import com.study.product.option.vo.OptionVO;
import com.study.product.product.service.IProductService;
import com.study.product.product.vo.ProductSearchVO;
import com.study.product.product.vo.ProductVO;
import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Inject
    IUserService userService;
    @Inject
    IAttachDAO attachDAO;
    @Inject
    IHistoryService historyService;
    @Inject
    IProductService productService;
    @Inject
    IOptionService optionService;

    @RequestMapping("/user/userProfile.wow")
    public String goProfile(Model model, String userId) {
        UserVO user = userService.getUser(userId);
        List<AttachVO> attaches = attachDAO.getAttaches("userIcon", userId);
        if (!attaches.isEmpty()) {

            user.setUserAttach(attaches.get(0));
        } else {
            user.setUserAttach(attachDAO.getAttach(1));
        }
        model.addAttribute("user", user);
        return "user/userProfile";

    }

    @RequestMapping("/user/myPage.wow")
    public String goMyPage(Model model, HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        String userId = userInfo.getUserId();
        UserVO user = userService.getUser(userId);
        List<AttachVO> attaches = attachDAO.getAttaches("userIcon", userId);
        if (!attaches.isEmpty()) {

            user.setUserAttach(attaches.get(0));
        } else {
            user.setUserAttach(attachDAO.getAttach(1));
        }
        List<HistoryVO> historyList = historyService.getHistoryList(userId);
        List<CartVO> optList = historyService.getHistoryOptes(userId);
        ProductSearchVO ProductSearchVO = new ProductSearchVO("user", userInfo.getUserName());
        List<ProductVO> myProdList = productService.getProdListByKeyword(ProductSearchVO);
        List<List<OptionVO>> getMyProdOpt = new ArrayList<>();
        if (!myProdList.isEmpty()){
            for(ProductVO product : myProdList){
                List<OptionVO> optList1 = optionService.getOptList(product.getProdNo());
                getMyProdOpt.add(optList1);
            }
        }
        model.addAttribute("user", user);
        model.addAttribute("historyList", historyList);
        model.addAttribute("optList", optList);
        model.addAttribute("myProdList", myProdList);
        if (!getMyProdOpt.isEmpty()){
        model.addAttribute("getMyProdOpt", getMyProdOpt);

        }


        return "user/myPage";
    }

    @RequestMapping("/user/historyDetail.wow")
    public String historyDetail(Model model, HttpSession session, int buyNo) {
        String userId = userIdFromSession(session);
        HistoryVO history = historyService.getHistoryListByNumber(userId, buyNo);
        List<CartVO> optList = historyService.getHistoryOptesByNumber(userId, buyNo);
        model.addAttribute("history", history);
        model.addAttribute("optList", optList);
        return "user/historyDetail";
    }

    @GetMapping("/user/userPassChange.wow")
    public String goUserPassChange() {
        return "user/userPassChange";
    }

    @PostMapping("/user/userPassChange.wow")
    public String userPassChangePOST(String nowPass, String nowPassChk, String newPass, HttpSession session) {
        String userId = userIdFromSession(session);
        if (nowPass.equals(nowPassChk)) {
            userService.passChange(newPass, userId);
            return "redirect:/common/alert.wow?msg=successChangePass&url=/user/myPage.wow";
        } else {
            //입력한 비번 다름
            return "redirect:/common/alert.wow?msg=failedChangePass&url=/user/userPassChange.wow";
        }
    }

    @GetMapping("/user/userModify.wow")
    public String userModify(Model model, HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        if (userInfo == null) {
            return "redirect:/common/alert.wow?msg=users&url=/user/login.wow";
        } else {
            UserVO user = userService.getUser(userInfo.getUserId());
            List<AttachVO> attaches = attachDAO.getAttaches("userIcon", userInfo.getUserId());
            if (!attaches.isEmpty()) {
                user.setUserAttach(attaches.get(0));
            } else {
                user.setUserAttach(attachDAO.getAttach(1));
            }
            model.addAttribute("user", user);
            return "user/userModify";
        }

    }


    @PostMapping("/user/userModify.wow")
    public String userModify(UserVO user, MultipartFile boFiles, HttpSession session) {
        int resultRow = userService.userModify(user, boFiles, session);
        if (resultRow == 1) {
            return "redirect:/common/alert.wow?msg=successModify&url=/user/userProfile.wow?userId=" + ((UserVO) session.getAttribute("USER_INFO")).getUserId();
        } else {

            return "redirect:/common/alert.wow?msg=failedModify&url=/user/logout.wow";
        }
    }


    @GetMapping("/user/login.wow")
    public String goLogin(HttpSession session) {

        return "user/login";
    }

    @PostMapping("/user/login.wow")
    public String loginChk(UserVO user, String rememberId, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        if (user.getUserId() != null) {
            UserVO user1 = userService.getUser(user.getUserId());

            if (rememberId == null) {
                rememberId = "false";
            }
            userService.rememberMe(rememberId, user.getUserId(), request, response);
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

    @PostMapping("/user/signUp.wow")
    public String signUpCheck(UserVO user, MultipartFile boFiles) {
        int resultRow = userService.insertUser(user, boFiles);
        if (resultRow == 1) {
            return "redirect:/common/alert.wow?msg=successSignUp&url=/user/login.wow";
        } else {
            return "redirect:/common/alert.wow?msg=failedSignUp&url=/user/logout.wow";
        }
    }

    public static String userIdFromSession(HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        if (userInfo == null) {
            return null;
        }
        return userInfo.getUserId();
    }
}
