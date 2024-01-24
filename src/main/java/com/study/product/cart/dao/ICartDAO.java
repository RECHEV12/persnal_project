package com.study.product.cart.dao;

import com.study.product.cart.vo.CartVO;
import com.study.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ICartDAO {
    public int cartItemDupleCheck(@Param("userId") String userId, @Param("optNo") int OptNo);
    public int deleteCartItem(@Param("userId") String userId, @Param("optNo") int OptNo);
    public int changeCnt(@Param("userId") String userId, @Param("optNo") int OptNo, @Param("cnt") int cnt);
    public int addCart(@Param("userId") String userId, @Param("prodNo")int prodNo, @Param("optNo")int optNo, @Param("nowCnt")int nowCnt);
    public int cartItemSetChecked(@Param("userId") String userId, @Param("optNo")int optNo, @Param("check")String check);
    public List<CartVO> getCartList(String userId);
    public List<CartVO> getCheckCartList(String userId);
    public int doBuyItem(@Param("user") UserVO user,@Param("userWant") String userWant,@Param("totalPrice") String totalPrice);
}
