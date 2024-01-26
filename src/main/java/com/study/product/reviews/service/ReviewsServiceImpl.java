package com.study.product.reviews.service;

import com.study.product.reviews.dao.IReviewsDAO;
import com.study.product.reviews.vo.ReviewsVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ReviewsServiceImpl implements IReviewsService{
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
}
