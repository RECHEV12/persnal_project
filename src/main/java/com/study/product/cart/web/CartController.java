package com.study.product.cart.web;

import com.study.product.cart.service.ICartService;
import com.study.product.cart.vo.CartVO;
import com.study.product.option.service.IOptionService;
import com.study.product.option.vo.OptionVO;
import com.study.product.product.service.IProductService;
import com.study.product.product.vo.ProductVO;
import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {
    @Inject
    ICartService cartService;

    @Inject
    IUserService userService;


    @RequestMapping("/cart/cart.wow")
    public String goCart(HttpSession session, Model model, String userId) {
        if (session.getAttribute("USER_INFO") == null) {
            return "redirect:/common/alert.wow?msg=users&url=/user/login.wow";
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


    @RequestMapping("/cart/cartCount")
    @ResponseBody
    public int cartCount(String userId) {
        return cartService.getCartListCount(userId);
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

    @RequestMapping("/cart/cartItemSetChecked")
    @ResponseBody
    public int cartItemSetChecked(String userId, int optNo, String check) {
        return cartService.cartItemSetChecked(userId, optNo, check);
    }

    @RequestMapping("/product/buyItem.wow")
    public String buyItem(Model model, String userId) {
        List<CartVO> cartList = cartService.getCheckCartList(userId);
        if (cartList.isEmpty()) {
            return "redirect:/common/alert.wow?msg=noItem&url=/cart/cart.wow?userId=" + userId;
        }

        UserVO user = userService.getUser(userId);
        model.addAttribute("user", user);
        model.addAttribute("cartList", cartList);


        return "product/buyItem";
    }

    @PostMapping("/cart/buyItem.wow")
    public String buyItem(UserVO user, String userWant, String totalPrice) {
        List<CartVO> cartList = cartService.getCheckCartList(user.getUserId());
        if (userWant.isEmpty()) {
            userWant = "요구사항 없음";
        }
        //구매시 재고 체크
        int stockChk = 0;
        for(CartVO cart : cartList){
            if (cart.getNowCnt()>cart.getOptStock()){
                stockChk++;
            }
        }
        //재고 넘칠 시, 리다이렉트
        if (stockChk>0) {
            return "redirect:/common/alert.wow?msg=stockOver&url=/cart/cart.wow?userId=" + user.getUserId();
        }
        int resultRow = cartService.doBuyItem(user, userWant, totalPrice);
        if (resultRow > 0) {
            //성공시 해당 구매번호 가져오고
            int num = cartService.getBuyItemNo(user, userWant, totalPrice);
            // 그 옵션마다 저장 후, 재고 수정, 카트에서 지우기
            for (CartVO cart : cartList) {
                cartService.insertBuyOpt(num, cart.getOptNo(), cart.getNowCnt(), cart.getProdNo());
                cartService.decreaseItemStock(cart.getOptNo(), cart.getNowCnt(), cart.getProdNo());
                cartService.deleteCartItem(user.getUserId(), cart.getOptNo());
            }
            return "redirect:/common/alert.wow?msg=canBuy&url=/";
        } else {
            return "redirect:/common/alert.wow?msg=cantBuy&url=/product/buyItem.wow?userId=" + user.getUserId();
        }


    }


}
