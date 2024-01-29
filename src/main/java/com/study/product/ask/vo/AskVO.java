package com.study.product.ask.vo;

public class AskVO {
    private int askNo;
    private String askContent;
    private String askRegDate;
    private String askModDate;
    private String askIp;
    private String askUserId;
    private int askParentNo;

    @Override
    public String toString() {
        return "AskVO{" +
                "askNo=" + askNo +
                ", askContent='" + askContent + '\'' +
                ", askRegDate='" + askRegDate + '\'' +
                ", askModDate='" + askModDate + '\'' +
                ", askIp='" + askIp + '\'' +
                ", askUserId='" + askUserId + '\'' +
                ", askParentNo=" + askParentNo +
                '}';
    }

    public int getAskNo() {
        return askNo;
    }

    public void setAskNo(int askNo) {
        this.askNo = askNo;
    }

    public String getAskContent() {
        return askContent;
    }

    public void setAskContent(String askContent) {
        this.askContent = askContent;
    }

    public String getAskRegDate() {
        return askRegDate;
    }

    public void setAskRegDate(String askRegDate) {
        this.askRegDate = askRegDate;
    }

    public String getAskModDate() {
        return askModDate;
    }

    public void setAskModDate(String askModDate) {
        this.askModDate = askModDate;
    }

    public String getAskIp() {
        return askIp;
    }

    public void setAskIp(String askIp) {
        this.askIp = askIp;
    }

    public String getAskUserId() {
        return askUserId;
    }

    public void setAskUserId(String askUserId) {
        this.askUserId = askUserId;
    }

    public int getAskParentNo() {
        return askParentNo;
    }

    public void setAskParentNo(int askParentNo) {
        this.askParentNo = askParentNo;
    }
}
