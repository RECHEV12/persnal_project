package com.study.product.dao;

import com.study.product.vo.ProductSearchVO;
import com.study.product.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IProductDAO {
    public List<ProductVO> getProdListByKeyword(@Param("search") ProductSearchVO productSearch);
    public List<ProductVO> getProdListByCategory(String category);
    public ProductVO getProduct(int prodNo);
}
