package com.study.product.cart.vo;

public class CartVO {
    private String userId;
    private int optNo;
    private int prodNo;
    private int nowCnt;
    private String cartCheck;
    private String prodTitle;
    private int prodPrice;
    private String optFirst;
    private String optSecond;
    private int optStock;
    private String prodImgFileName;        /*섬네일 파일 이름   */
    private String prodImgFilePath;        /*섬네일 파일 주소   */
    private int userBuyNo;        /*섬네일 파일 주소   */

    private String buyNo;
    private String reviNo;

    @Override
    public String toString() {
        return "CartVO{" +
                "userId='" + userId + '\'' +
                ", optNo=" + optNo +
                ", prodNo=" + prodNo +
                ", nowCnt=" + nowCnt +
                ", cartCheck='" + cartCheck + '\'' +
                ", prodTitle='" + prodTitle + '\'' +
                ", prodPrice=" + prodPrice +
                ", optFirst='" + optFirst + '\'' +
                ", optSecond='" + optSecond + '\'' +
                ", optStock=" + optStock +
                ", prodImgFileName='" + prodImgFileName + '\'' +
                ", prodImgFilePath='" + prodImgFilePath + '\'' +
                ", userBuyNo=" + userBuyNo +
                ", buyNo='" + buyNo + '\'' +
                ", reviNo='" + reviNo + '\'' +
                '}';
    }

    public String getBuyNo() {
        return buyNo;
    }

    public void setBuyNo(String buyNo) {
        this.buyNo = buyNo;
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

    public String getProdImgFileName() {
        return prodImgFileName;
    }

    public void setProdImgFileName(String prodImgFileName) {
        this.prodImgFileName = prodImgFileName;
    }

    public String getProdImgFilePath() {
        return prodImgFilePath;
    }

    public void setProdImgFilePath(String prodImgFilePath) {
        this.prodImgFilePath = prodImgFilePath;
    }

    public int getUserBuyNo() {
        return userBuyNo;
    }

    public void setUserBuyNo(int userBuyNo) {
        this.userBuyNo = userBuyNo;
    }

    public String getReviNo() {
        return reviNo;
    }

    public void setReviNo(String reviNo) {
        this.reviNo = reviNo;
    }
}
