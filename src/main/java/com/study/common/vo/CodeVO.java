package com.study.common.vo;

public class CodeVO {
    private String cateCode;
    private String cateName;
    private String cateParent;

    @Override
    public String toString() {
        return "codeVO{" +
                "cateCode='" + cateCode + '\'' +
                ", cateName='" + cateName + '\'' +
                ", cateParent='" + cateParent + '\'' +
                '}';
    }

    public String getCateCode() {
        return cateCode;
    }

    public void setCateCode(String cateCode) {
        this.cateCode = cateCode;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getCateParent() {
        return cateParent;
    }

    public void setCateParent(String cateParent) {
        this.cateParent = cateParent;
    }
}
