package com.study.product.cart.web;

import com.study.product.cart.service.ICartService;
import com.study.product.cart.vo.CartVO;
import com.study.product.option.service.IOptionService;
import com.study.product.option.vo.OptionVO;
import com.study.product.product.service.IProductService;
import com.study.product.product.vo.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {
    @Inject
    ICartService cartService;



    @RequestMapping("/cart/cart.wow")
    public String goCart(HttpSession session, Model model, String userId) {
        if (session.getAttribute("USER_INFO") == null) {
            return "redirect:/common/alert.wow";
        }
        List<CartVO> cartList = cartService.getCartList(userId);
        model.addAttribute("cartList", cartList);
        return "product/cart";
    }

    @RequestMapping("/cart/cartItemDupleCheck")
    @ResponseBody
    public int cartItemDupleCheck(String userId, int optNo) {
        return cartService.cartItemDupleCheck(userId, optNo);
    }

    @RequestMapping("/cart/addCart")
    @ResponseBody
    public int addCart(String userId, int prodNo, int optNo, int nowCnt) {
        return cartService.addCart(userId, prodNo, optNo, nowCnt);
    }
    @RequestMapping("/cart/deleteCartItem")
    @ResponseBody
    public int deleteCartItem(String userId, int optNo) {
        return cartService.deleteCartItem(userId, optNo);
    }
    @RequestMapping("/cart/changeCnt")
    @ResponseBody
    public int changeCnt(String userId, int optNo, int cnt) {
        return cartService.changeCnt(userId, optNo, cnt);
    }



}
