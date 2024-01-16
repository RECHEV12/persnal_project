package com.study.product.vo;

public class ProductVO {
    private int prodNo;                 /*제품번호      */
    private String prodTitle;           /*제 품 명      */
    private String prodContent;         /*제품 내용     */
    private int prodTotalSell;          /*판매량        */
    private int prodPrice;              /*가격          */
    private String prodImage;           /*이미지        */
    private String prodCateCode;        /*분류          */
    private String prodRegDate;         /*등록일자      */
    private String prodDelYn;           /*삭제여부      */
    private String prodUserId;          /*판매자아이디  */
    private String prodUserName;        /*판매자 이름   */

    @Override
    public String toString() {
        return "ProductVO{" +
                "prodNo=" + prodNo +
                ", prodTitle='" + prodTitle + '\'' +
                ", prodContent='" + prodContent + '\'' +
                ", prodTotalSell=" + prodTotalSell +
                ", prodPrice=" + prodPrice +
                ", prodImage='" + prodImage + '\'' +
                ", prodCateCode='" + prodCateCode + '\'' +
                ", prodRegDate='" + prodRegDate + '\'' +
                ", prodDelYn='" + prodDelYn + '\'' +
                ", prodUserId='" + prodUserId + '\'' +
                '}';
    }

    public int getProdNo() {
        return prodNo;
    }

    public void setProdNo(int prodNo) {
        this.prodNo = prodNo;
    }

    public String getProdTitle() {
        return prodTitle;
    }

    public void setProdTitle(String prodTitle) {
        this.prodTitle = prodTitle;
    }

    public String getProdContent() {
        return prodContent;
    }

    public void setProdContent(String prodContent) {
        this.prodContent = prodContent;
    }

    public int getProdTotalSell() {
        return prodTotalSell;
    }

    public void setProdTotalSell(int prodTotalSell) {
        this.prodTotalSell = prodTotalSell;
    }

    public int getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(int prodPrice) {
        this.prodPrice = prodPrice;
    }

    public String getProdImage() {
        return prodImage;
    }

    public void setProdImage(String prodImage) {
        this.prodImage = prodImage;
    }

    public String getProdCateCode() {
        return prodCateCode;
    }

    public void setProdCateCode(String prodCateCode) {
        this.prodCateCode = prodCateCode;
    }

    public String getProdRegDate() {
        return prodRegDate;
    }

    public void setProdRegDate(String prodRegDate) {
        this.prodRegDate = prodRegDate;
    }

    public String getProdDelYn() {
        return prodDelYn;
    }

    public void setProdDelYn(String prodDelYn) {
        this.prodDelYn = prodDelYn;
    }

    public String getProdUserId() {
        return prodUserId;
    }

    public void setProdUserId(String prodUserId) {
        this.prodUserId = prodUserId;
    }

    public String getProdUserName() {
        return prodUserName;
    }

    public void setProdUserName(String prodUserName) {
        this.prodUserName = prodUserName;
    }
}
