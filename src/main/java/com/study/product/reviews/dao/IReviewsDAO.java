package com.study.product.reviews.dao;

import com.study.product.reviews.vo.ReviewsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IReviewsDAO {
    public List<ReviewsVO> getReviewsList(int prodNo);
    public int deleteReview(int reviNo);

}
