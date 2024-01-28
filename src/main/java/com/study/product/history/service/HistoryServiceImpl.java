package com.study.product.history.service;


import com.study.product.cart.vo.CartVO;
import com.study.product.history.dao.IHistoryDAO;
import com.study.product.history.vo.HistoryVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class HistoryServiceImpl implements IHistoryService{

@Inject
    IHistoryDAO historyDAO;
    @Override
    public List<HistoryVO> getHistoryList(String userId) {
        return historyDAO.getHistoryList(userId);
    }

    @Override
    public List<CartVO> getHistoryOptes(String userId) {
        return historyDAO.getHistoryOptes(userId);

    }

    @Override
    public HistoryVO getHistoryListByNumber(String userId, int buyNo) {
        return historyDAO.getHistoryListByNumber(userId,buyNo);
    }

    @Override
    public List<CartVO> getHistoryOptesByNumber(String userId, int buyNo) {
        return historyDAO.getHistoryOptesByNumber(userId,buyNo);
    }

    @Override
    public CartVO getHistoryOptByOptNo(String userId, int optNo, int buyNo) {
        return historyDAO.getHistoryOptByOptNo(userId, optNo, buyNo);
    }


}
