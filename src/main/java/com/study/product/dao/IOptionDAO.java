package com.study.product.dao;

import com.study.product.vo.OptionVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface IOptionDAO {
    public List<OptionVO> getOptList(int prodNo);
    public OptionVO getOpt(int optNo);
    public OptionVO getOptPrice(@Param("prodNo") int prodNo, @Param("first") String opt_first, @Param("second") String opt_second);
}
