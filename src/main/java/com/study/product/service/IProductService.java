package com.study.product.service;

import com.study.product.vo.ProductSearchVO;
import com.study.product.vo.ProductVO;

import java.util.List;

public interface IProductService {
    public List<ProductVO> getProdList(ProductSearchVO productSearch);
}
