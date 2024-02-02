package com.study.product.cart.service;

import com.study.product.cart.vo.CartVO;
import com.study.user.vo.UserVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICartService {
    public int cartItemDupleCheck(String userId, int optNo);
    public int deleteCartItem(String userId, int optNo);
    public int changeCnt(String userId, int optNo, int cnt);
    public int addCart(String userId, int prodNo,int optNo,int nowCnt);
    public int cartItemSetChecked(String userId,int optNo,String check);
    public List<CartVO> getCartList(String userId);
    public List<CartVO> getCheckCartList(String userId);
    public int getCartListCount(String userId);
    public int doBuyItem(UserVO user, String userWant, String totalPrice);
    public int getBuyItemNo(UserVO user, String userWant, String totalPrice);
    public void insertBuyOpt(int buyNo,int optNo, int nowCnt, int prodNo, String userId);
    public void decreaseItemStock(int optNo, int nowCnt, int prodNo);
}
