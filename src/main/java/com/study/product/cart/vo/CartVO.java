package com.study.product.cart.vo;

public class CartVO {
    private String userId;
    private int optNo;
    private int prodNo;
    private int nowCnt;
    private String cartCheck;
    private String prodTitle;
    private String prodImage;
    private int prodPrice;
    private String optFirst;
    private String optSecond;
    private int optStock;

    @Override
    public String toString() {
        return "CartVO{" +
                "userId='" + userId + '\'' +
                ", optNo=" + optNo +
                ", prodNo=" + prodNo +
                ", nowCnt=" + nowCnt +
                ", cartCheck='" + cartCheck + '\'' +
                ", prodTitle='" + prodTitle + '\'' +
                ", prodImage='" + prodImage + '\'' +
                ", prodPrice=" + prodPrice +
                ", optFirst='" + optFirst + '\'' +
                ", optSecond='" + optSecond + '\'' +
                ", optStock=" + optStock +
                '}';
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getOptNo() {
        return optNo;
    }

    public void setOptNo(int optNo) {
        this.optNo = optNo;
    }

    public int getProdNo() {
        return prodNo;
    }

    public void setProdNo(int prodNo) {
        this.prodNo = prodNo;
    }

    public int getNowCnt() {
        return nowCnt;
    }

    public void setNowCnt(int nowCnt) {
        this.nowCnt = nowCnt;
    }

    public String getProdTitle() {
        return prodTitle;
    }

    public void setProdTitle(String prodTitle) {
        this.prodTitle = prodTitle;
    }

    public String getProdImage() {
        return prodImage;
    }

    public void setProdImage(String prodImage) {
        this.prodImage = prodImage;
    }

    public int getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(int prodPrice) {
        this.prodPrice = prodPrice;
    }

    public String getOptFirst() {
        return optFirst;
    }

    public void setOptFirst(String optFirst) {
        this.optFirst = optFirst;
    }

    public String getOptSecond() {
        return optSecond;
    }

    public void setOptSecond(String optSecond) {
        this.optSecond = optSecond;
    }

    public int getOptStock() {
        return optStock;
    }

    public void setOptStock(int optStock) {
        this.optStock = optStock;
    }

    public String getCartCheck() {
        return cartCheck;
    }

    public void setCartCheck(String cartCheck) {
        this.cartCheck = cartCheck;
    }
}
