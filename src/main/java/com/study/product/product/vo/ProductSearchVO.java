package com.study.product.product.vo;

public class ProductSearchVO {
    private String searchType;
    private String searchWord;

    public ProductSearchVO(String searchType, String searchWord) {
        this.searchType = searchType;
        this.searchWord = searchWord;
    }

    @Override
    public String toString() {
        return "ProductSearchVO{" +
                "searchType='" + searchType + '\'' +
                ", searchWord='" + searchWord + '\'' +
                '}';
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }
}
