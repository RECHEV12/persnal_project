package com.study.product.reviews.web;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.product.reviews.service.IReviewsService;
import com.study.product.reviews.vo.ReviewsVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

@Controller
public class ReviewsController {

    @Inject
    IReviewsService reviewsService;


    @PostMapping("reviews/deleteReview.wow")
    @ResponseBody
    public int deleteReview(int reviNo){
        return reviewsService.deleteReview(reviNo);
    }

}
