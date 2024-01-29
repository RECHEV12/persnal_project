package com.study.product.ask.dao;

import com.study.common.vo.PagingVO;
import com.study.product.ask.vo.AskReplyVO;
import com.study.product.ask.vo.AskVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAskDAO {
    public int insertAsk(AskVO ask);
    public int deleteAsk(int askNo);
    public int deleteAskReplyByReplyNo(int askReplyNo);
    public int deleteAskReplyByAskNo(int askNo);
    public int insertAskReply(AskReplyVO askReply);
    public int getAskCount(int parentNo);
    public List<AskVO> getAskList(@Param("paging") PagingVO paging,@Param("parentNo") int parentNo);
    public List<AskReplyVO> getAskReplyList();
}
