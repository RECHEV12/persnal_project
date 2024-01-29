package com.study.product.ask.service;

import com.study.common.vo.PagingVO;
import com.study.product.ask.vo.AskReplyVO;
import com.study.product.ask.vo.AskVO;

import java.util.List;

public interface IAskService {
    public int insertAsk(AskVO ask);
    public int deleteAsk(int askNo);
    public int deleteAskReplyByReplyNo(int askReplyNo);
    public int deleteAskReplyByAskNo(int askNo);
    public int insertAskReply(AskReplyVO askReply);
    public int getAskCount(int parentNo);
    public List<AskVO> getAskList(PagingVO pagingVO,int parentNo);
    public List<AskReplyVO> getAskReplyList();
}

