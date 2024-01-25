package com.study.product.cart.service;

import com.study.product.cart.dao.ICartDAO;
import com.study.product.cart.vo.CartVO;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CartServiceImpl implements ICartService{
@Inject
    ICartDAO cartDAO;
    @Override
    public int cartItemDupleCheck(String userId, int optNo) {
        return cartDAO.cartItemDupleCheck(userId, optNo);
    }

    @Override
    public int deleteCartItem(String userId, int optNo) {
        return cartDAO.deleteCartItem(userId, optNo);
    }

    @Override
    public int changeCnt(String userId, int optNo, int cnt) {
        return cartDAO.changeCnt(userId, optNo, cnt);
    }

    @Override
    public int addCart(String userId, int prodNo, int optNo, int nowCnt) {
        return cartDAO.addCart(userId, prodNo, optNo, nowCnt);
    }

    @Override
    public int cartItemSetChecked(String userId, int optNo, String check) {
        return cartDAO.cartItemSetChecked(userId, optNo, check);
    }

    @Override
    public List<CartVO> getCartList(String userId) {
        return cartDAO.getCartList(userId);
    }

    @Override
    public List<CartVO> getCheckCartList(String userId) {
        return cartDAO.getCheckCartList(userId);
    }

    @Override
    public int getCartListCount(String userId) {
        return cartDAO.getCartListCount(userId);
    }


    @Override
    public int doBuyItem(UserVO user, String userWant, String totalPrice) {
        return cartDAO.doBuyItem(user, userWant, totalPrice);
    }

    @Override
    public int getBuyItemNo(UserVO user, String userWant, String totalPrice) {
        return cartDAO.getBuyItemNo(user,userWant,totalPrice);
    }

    @Override
    public void insertBuyOpt(int buyNo, int optNo, int nowCnt, int prodNo) {
        cartDAO.insertBuyOpt(buyNo,optNo,nowCnt,prodNo);
    }

    @Override
    public void decreaseItemStock(int optNo, int nowCnt, int prodNo) {
        cartDAO.decreaseItemStock(optNo,nowCnt,prodNo);
    }
}
