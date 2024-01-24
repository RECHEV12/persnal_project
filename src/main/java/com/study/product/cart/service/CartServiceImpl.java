package com.study.product.cart.service;

import com.study.product.cart.dao.ICartDAO;
import com.study.product.cart.vo.CartVO;
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
    public List<CartVO> getCartList(String userId) {
        return cartDAO.getCartList(userId);
    }
}
