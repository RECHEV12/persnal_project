package com.study.product.ask.service;

import com.study.common.vo.PagingVO;
import com.study.product.ask.dao.IAskDAO;
import com.study.product.ask.vo.AskVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class AskServiceImpl implements IAskService{
    @Inject
    IAskDAO askDAO;
    @Override
    public int insertAsk(AskVO ask) {
        return askDAO.insertAsk(ask);
    }

    @Override
    public int getAskCount(int parentNo) {
        return askDAO.getAskCount(parentNo);
    }

    @Override
    public List<AskVO> getAskList(PagingVO pagingVO, int parentNo) {
        return askDAO.getAskList(pagingVO, parentNo);
    }

}
