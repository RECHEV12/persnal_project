package com.study.product.history.service;


import com.study.product.cart.vo.CartVO;
import com.study.product.history.vo.HistoryVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IHistoryService {

    public List<HistoryVO> getHistoryList(String userId);
    public List<CartVO> getHistoryOptes(String userId);
    public HistoryVO getHistoryListByNumber(String userId, int buyNo);
    public List<CartVO> getHistoryOptesByNumber(String userId, int buyNo);
    public CartVO getHistoryOptByOptNo(String userId, int optNo, int buyNo);

}
