package com.study.product.history.dao;

import com.study.product.cart.vo.CartVO;
import com.study.product.history.vo.HistoryVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IHistoryDAO {
    public List<HistoryVO> getHistoryList(String userId);
    public List<CartVO> getHistoryOptes(String userId);
    public HistoryVO getHistoryListByNumber(@Param("userId") String userId, @Param("buyNo") int buyNo);
   public List<CartVO> getHistoryOptesByNumber(@Param("userId") String userId, @Param("buyNo") int buyNo);
    public CartVO getHistoryOptByOptNo(@Param("userId") String userId, @Param("optNo") int optNo,@Param("buyNo") int buyNo);


}
