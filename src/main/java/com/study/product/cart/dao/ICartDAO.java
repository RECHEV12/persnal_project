package com.study.product.cart.dao;

import com.study.product.cart.vo.CartVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ICartDAO {
    public int cartItemDupleCheck(@Param("userId") String userId, @Param("optNo") int OptNo);
    public int deleteCartItem(@Param("userId") String userId, @Param("optNo") int OptNo);
    public int changeCnt(@Param("userId") String userId, @Param("optNo") int OptNo, @Param("cnt") int cnt);
    public int addCart(@Param("userId") String userId, @Param("prodNo")int prodNo, @Param("optNo")int optNo, @Param("nowCnt")int nowCnt);
    public List<CartVO> getCartList(String userId);
}
