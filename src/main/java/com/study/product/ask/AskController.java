package com.study.product.ask;

import com.study.product.ask.service.IAskService;
import com.study.product.ask.vo.AskReplyVO;
import com.study.product.ask.vo.AskVO;
import com.study.product.product.service.IProductService;
import com.study.product.product.vo.ProductVO;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
public class AskController {
    @Inject
    IAskService askService;
@Inject
    IProductService productService;
    @GetMapping("/ask/insertAsk.wow")
    public String goInsertAsk(Model model, int prodNo) {
        ProductVO product = productService.getProduct(prodNo);
        model.addAttribute("product", product);
        return "product/insertAsk";
    }

    @PostMapping("/ask/insertAsk.wow")
    public String doInsertAsk(AskVO ask, HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        ask.setAskUserId(userInfo.getUserId());
        int resultRow = askService.insertAsk(ask);
        if (resultRow == 1) {
            return "redirect:/common/alert.wow?msg=success&url=/product/productView.wow?prodNo=" + ask.getAskParentNo();
        } else {
            return "redirect:/common/alert.wow?msg=failed&url=/product/productView.wow?prodNo=" + ask.getAskParentNo();
        }
    }

    @PostMapping("/ask/insertAskReply.wow")
    @ResponseBody
    public int insertAskReply(AskReplyVO askReply) {
        return askService.insertAskReply(askReply);

    }

    @PostMapping("/ask/deleteAskReplyByReplyNo.wow")
    @ResponseBody
    public int deleteAskReplyByReplyNo(int askReplyNo) {
        return askService.deleteAskReplyByReplyNo(askReplyNo);

    }    @PostMapping("/ask/deleteAsk.wow")
    @ResponseBody
    public int deleteAsk(int askNo) {
        return askService.deleteAsk(askNo);

    }

    @PostMapping("/ask/deleteAskReplyByAskNo.wow")
    @ResponseBody
    public int deleteAskReplyByAskNo(int askNo) {
        return askService.deleteAskReplyByAskNo(askNo);

    }
}
