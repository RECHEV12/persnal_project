package com.study.product.vo;

public class OptionVO {
    private int optNo        ;      /*옵션 번호       */
    private String optFirst  ;      /*1번 옵션        */
    private String optSecond ;      /*2번 옵션        */
    private int optStock     ;      /*옵션별 재고     */
    private int optProdNo    ;      /*옵션 해당 제품  */

    @Override
    public String toString() {
        return "OptionVO{" +
                "optNo=" + optNo +
                ", optFirst='" + optFirst + '\'' +
                ", optSecond='" + optSecond + '\'' +
                ", optStock=" + optStock +
                ", optProdNo=" + optProdNo +
                '}';
    }

    public int getOptNo() {
        return optNo;
    }

    public void setOptNo(int optNo) {
        this.optNo = optNo;
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

    public int getOptProdNo() {
        return optProdNo;
    }

    public void setOptProdNo(int optProdNo) {
        this.optProdNo = optProdNo;
    }
}
