package com.study.product.reviews.service;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.common.util.StudyAttachUtils;
import com.study.product.reviews.dao.IReviewsDAO;
import com.study.product.reviews.vo.ReviewsVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

@Service
public class ReviewsServiceImpl implements IReviewsService {
    @Inject
    IReviewsDAO reviewsDAO;


    @Override
    public List<ReviewsVO> getReviewsList(int prodNo) {
        return reviewsDAO.getReviewsList(prodNo);
    }

    @Override
    public int deleteReview(int reviNo) {
        return reviewsDAO.deleteReview(reviNo);
    }

    @Override
    public int insertReview(ReviewsVO review, String userId, int buyNo, int optNo) {



        return reviewsDAO.insertReview(review, userId, buyNo, optNo);
    }

    @Override
    public int getReviNumber(String userId, int parentNo, int buyNo, int optNo) {
        return reviewsDAO.getReviNumber(userId, parentNo, buyNo, optNo);
    }

    @Override
    public int modifyReview(int reviNo, int reviStar, String reviContent) {
        return reviewsDAO.modifyReview(reviNo, reviStar, reviContent);
    }
}
