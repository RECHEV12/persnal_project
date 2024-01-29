package com.study.product.ask.service;

import com.study.common.vo.PagingVO;
import com.study.product.ask.vo.AskVO;

import java.util.List;

public interface IAskService {
    public int insertAsk(AskVO ask);
    public int getAskCount(int parentNo);
    public List<AskVO> getAskList(PagingVO pagingVO,int parentNo);
}

