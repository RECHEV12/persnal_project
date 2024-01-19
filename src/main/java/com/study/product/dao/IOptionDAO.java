package com.study.product.dao;

import com.study.product.vo.OptionVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface IOptionDAO {
    public List<OptionVO> getOptList(int prodNo);
}
