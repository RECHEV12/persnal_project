package com.study.product.ask.dao;

import com.study.common.vo.PagingVO;
import com.study.product.ask.vo.AskVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAskDAO {
    public int insertAsk(AskVO ask);
    public int getAskCount(int parentNo);
    public List<AskVO> getAskList(@Param("paging") PagingVO paging,@Param("parentNo") int parentNo);
}
