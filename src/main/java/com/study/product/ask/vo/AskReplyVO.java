package com.study.product.ask.vo;

public class AskReplyVO {
    private int replyNo;
    private String replyContent;
    private int replyParentNo;

    @Override
    public String toString() {
        return "AskReplyVO{" +
                "replyNo=" + replyNo +
                ", replyContent='" + replyContent + '\'' +
                ", replyParentNo=" + replyParentNo +
                '}';
    }

    public int getReplyNo() {
        return replyNo;
    }

    public void setReplyNo(int replyNo) {
        this.replyNo = replyNo;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public int getReplyParentNo() {
        return replyParentNo;
    }

    public void setReplyParentNo(int replyParentNo) {
        this.replyParentNo = replyParentNo;
    }
}
