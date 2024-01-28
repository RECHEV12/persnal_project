package com.study.product.history.vo;

import com.study.product.cart.vo.CartVO;
import com.study.product.option.vo.OptionVO;

import java.util.List;

public class HistoryVO {
    private String userId;
    private String buyUserName;
    private String userHp;
    private String userZip;

    private String userAdd1;
    private String userAdd2;
    private String buyDate;
    private String userWant;
    private String totalPrice;
    private String buyNo;
    private List<CartVO> buyOptList;

    @Override
    public String toString() {
        return "HistoryVO{" +
                "userId='" + userId + '\'' +
                ", buyUserName='" + buyUserName + '\'' +
                ", userHp='" + userHp + '\'' +
                ", userZip='" + userZip + '\'' +
                ", userAdd1='" + userAdd1 + '\'' +
                ", userAdd2='" + userAdd2 + '\'' +
                ", buyDate='" + buyDate + '\'' +
                ", userWant='" + userWant + '\'' +
                ", totalPrice='" + totalPrice + '\'' +
                ", buyNo='" + buyNo + '\'' +
                ", buyOptList=" + buyOptList +
                '}';
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBuyUserName() {
        return buyUserName;
    }

    public void setBuyUserName(String buyUserName) {
        this.buyUserName = buyUserName;
    }

    public String getUserHp() {
        return userHp;
    }

    public void setUserHp(String userHp) {
        this.userHp = userHp;
    }

    public String getUserZip() {
        return userZip;
    }

    public void setUserZip(String userZip) {
        this.userZip = userZip;
    }

    public String getUserAdd1() {
        return userAdd1;
    }

    public void setUserAdd1(String userAdd1) {
        this.userAdd1 = userAdd1;
    }

    public String getUserAdd2() {
        return userAdd2;
    }

    public void setUserAdd2(String userAdd2) {
        this.userAdd2 = userAdd2;
    }

    public String getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(String buyDate) {
        this.buyDate = buyDate;
    }

    public String getUserWant() {
        return userWant;
    }

    public void setUserWant(String userWant) {
        this.userWant = userWant;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getBuyNo() {
        return buyNo;
    }

    public void setBuyNo(String buyNo) {
        this.buyNo = buyNo;
    }

    public List<CartVO> getBuyOptList() {
        return buyOptList;
    }

    public void setBuyOptList(List<CartVO> buyOptList) {
        this.buyOptList = buyOptList;
    }
}
