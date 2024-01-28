package com.study.product.option.dao;

import com.study.product.option.vo.OptionVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface IOptionDAO {
    public List<OptionVO> getOptList(int prodNo);
    public OptionVO getOpt(int optNo);
    public OptionVO getOptPrice(@Param("prodNo") int prodNo, @Param("first") String opt_first, @Param("second") String opt_second);
    public void addReviNo(@Param("userId") String userId, @Param("parentNo") int parentNo, @Param("buyNo") int buyNo, @Param("optNo") int optNo, @Param("reviNo") int reviNo);
    public int deleteReviNo(@Param("userId") String userId, @Param("parentNo") int parentNo, @Param("buyNo") int buyNo, @Param("optNo") int optNo);
}
