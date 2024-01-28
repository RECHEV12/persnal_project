package com.study.product.reviews.dao;

import com.study.product.reviews.vo.ReviewsVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IReviewsDAO {
    public List<ReviewsVO> getReviewsList(int prodNo);
    public int deleteReview(int reviNo);
    public int insertReview(@Param("review") ReviewsVO review,@Param("userId") String userId, @Param("buyNo")int buyNo,@Param("optNo") int optNo);
   public int getReviNumber(@Param("userId") String userId, @Param("parentNo") int parentNo, @Param("buyNo") int buyNo, @Param("optNo") int optNo);
    public int modifyReview( @Param("reviNo") int reviNo, @Param("reviStar") int reviStar, @Param("reviContent") String reviContent);

}
