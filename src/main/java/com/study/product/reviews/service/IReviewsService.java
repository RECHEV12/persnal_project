package com.study.product.reviews.service;

import com.study.common.vo.PagingVO;
import com.study.product.reviews.vo.ReviewsVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IReviewsService {
    public List<ReviewsVO> getReviewsList(@Param("paging") PagingVO paging, @Param("prodNo") int prodNo);


    public int deleteReview(int reviNo);

    public int insertReview(ReviewsVO review, String userId, int buyNo, int optNo);

    public int getReviNumber(String userId, int parentNo, int buyNo, int optNo);

    public int modifyReview(int reviNo, int reviStar, String reviContent);
    public int getReviewCount(int prodNo);
}
