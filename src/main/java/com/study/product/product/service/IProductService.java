package com.study.product.product.service;

import com.study.product.product.vo.ProductSearchVO;
import com.study.product.product.vo.ProductVO;

import java.util.List;

public interface IProductService {
    public List<ProductVO> getProdListByKeyword(ProductSearchVO productSearch);
    public List<ProductVO> getProdListByCategory(String category);

    public ProductVO getProduct(int prodNo);

}
