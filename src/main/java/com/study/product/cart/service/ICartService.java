package com.study.product.cart.service;

import com.study.product.cart.vo.CartVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICartService {
    public int cartItemDupleCheck(String userId, int optNo);
    public int deleteCartItem(String userId, int optNo);
    public int changeCnt(String userId, int optNo, int cnt);
    public int addCart(@Param("userId") String userId, @Param("prodNo")int prodNo, @Param("optNo")int optNo, @Param("nowCnt")int nowCnt);
    public List<CartVO> getCartList(String userId);

}
