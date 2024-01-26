package com.study.product.reviews.service;

import com.study.product.reviews.vo.ReviewsVO;

import java.util.List;

public interface IReviewsService {
    public List<ReviewsVO> getReviewsList(int prodNo);
    public int deleteReview(int reviNo);
}
