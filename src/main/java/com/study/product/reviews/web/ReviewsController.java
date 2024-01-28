package com.study.product.reviews.web;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.common.util.StudyAttachUtils;
import com.study.product.cart.vo.CartVO;
import com.study.product.history.service.IHistoryService;
import com.study.product.option.service.IOptionService;
import com.study.product.reviews.service.IReviewsService;
import com.study.product.reviews.vo.ReviewsVO;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class ReviewsController {

    @Inject
    IReviewsService reviewsService;
    @Inject
    IHistoryService historyService;
    @Inject
    IOptionService optionService;
    @Inject
    StudyAttachUtils attachUtils;
    @Inject
    IAttachDAO attachDAO;


    @PostMapping("/reviews/deleteReview.wow")
    @ResponseBody
    public int deleteReview(int reviNo) {
        return reviewsService.deleteReview(reviNo);
    }

    @PostMapping("/reviews/deleteReviNo.wow")
    @ResponseBody
    public int deleteReviNo(int parentNo, int buyNo, int optNo, String userId) {
        return optionService.deleteReviNo(userId, parentNo, buyNo, optNo);
    }

    @PostMapping("/reviews/deleteReviewAttach.wow")
    @ResponseBody
    public int deleteReviewAttach(int reviNo) {
        List<AttachVO> reviImg = attachDAO.getAttaches("reviImg", String.valueOf(reviNo));
        if (!reviImg.isEmpty()){
        int[] attachNoList = new int[reviImg.size()];
        for (int i = 0; i < reviImg.size(); i++) {
            attachNoList[i] = reviImg.get(i).getAtchNo();
        }
        return attachDAO.deleteAtches(attachNoList);
        }
        return 0;
    }
    @PostMapping("/reviews/modifyReview.wow")
    @ResponseBody
    public int modifyReview(int reviNo, int reviStar, String reviContent) {
            return reviewsService.modifyReview(reviNo, reviStar, reviContent);
    }


    @GetMapping("/product/reviewRegist.wow")
    public String goReviewRegist(Model model, HttpSession session, int optNo, int buyNo) {
        String userId = userIdFromSession(session);
        CartVO cart = historyService.getHistoryOptByOptNo(userId, optNo, buyNo);
        cart.setUserBuyNo(buyNo);
        model.addAttribute("cart", cart);
        return "product/reviewRegist";
    }

    @PostMapping("/product/reviewRegist.wow")
    public String doReviewRegist(HttpSession session, ReviewsVO review, int buyNo, int optNo, MultipartFile[] boFiles) {
        System.out.println(review.getReviContent());
        String userId = userIdFromSession(session);
        int resultRow = reviewsService.insertReview(review, userId, buyNo, optNo);
        if (resultRow == 1) {
            for (MultipartFile file : boFiles) {
                int reviNumber = reviewsService.getReviNumber(userId, review.getReviParentNo(), buyNo, optNo);
                optionService.addReviNo(userId, review.getReviParentNo(), buyNo, optNo, reviNumber);
                if (!file.isEmpty()) {
                    try {
                        AttachVO attachByMultipart = attachUtils.getAttachByMultipart(file, "reviImg", "revi");
                        attachByMultipart.setAtchParentNo(String.valueOf(reviNumber));
                        attachDAO.insertAttach(attachByMultipart);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
            }


            return "redirect:/common/alert.wow?msg=successReview&url=/user/myPage.wow";
        } else {
            return "redirect:/common/alert.wow?msg=failedReview&url=/user/myPage.wow";

        }
    }

    public static String userIdFromSession(HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        return userInfo.getUserId();
    }

}
