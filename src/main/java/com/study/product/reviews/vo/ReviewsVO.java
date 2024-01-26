package com.study.product.reviews.vo;

public class ReviewsVO {
    private int reviNo;
    private String reviContent;
    private int reviStar;
    private String reviRegDate;
    private String reviModDate;
    private String reviIp;
    private String reviUserId;
    private int reviParentNo;
    private String userName;

    @Override
    public String toString() {
        return "ReviewsVO{" +
                "reviNo=" + reviNo +
                ", reviContent='" + reviContent + '\'' +
                ", reviStar=" + reviStar +
                ", reviRegDate='" + reviRegDate + '\'' +
                ", reviModDate='" + reviModDate + '\'' +
                ", reviIp='" + reviIp + '\'' +
                ", reviUserId='" + reviUserId + '\'' +
                ", reviParentNo=" + reviParentNo +
                ", userName='" + userName + '\'' +
                '}';
    }

    public int getReviNo() {
        return reviNo;
    }

    public void setReviNo(int reviNo) {
        this.reviNo = reviNo;
    }

    public String getReviContent() {
        return reviContent;
    }

    public void setReviContent(String reviContent) {
        this.reviContent = reviContent;
    }

    public int getReviStar() {
        return reviStar;
    }

    public void setReviStar(int reviStar) {
        this.reviStar = reviStar;
    }

    public String getReviRegDate() {
        return reviRegDate;
    }

    public void setReviRegDate(String reviRegDate) {
        this.reviRegDate = reviRegDate;
    }

    public String getReviModDate() {
        return reviModDate;
    }

    public void setReviModDate(String reviModDate) {
        this.reviModDate = reviModDate;
    }

    public String getReviIp() {
        return reviIp;
    }

    public void setReviIp(String reviIp) {
        this.reviIp = reviIp;
    }

    public String getReviUserId() {
        return reviUserId;
    }

    public void setReviUserId(String reviUserId) {
        this.reviUserId = reviUserId;
    }

    public int getReviParentNo() {
        return reviParentNo;
    }

    public void setReviParentNo(int reviParentNo) {
        this.reviParentNo = reviParentNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
