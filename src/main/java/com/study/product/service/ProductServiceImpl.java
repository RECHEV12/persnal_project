package com.study.product.service;


import com.study.product.dao.IProductDAO;
import com.study.product.vo.ProductSearchVO;
import com.study.product.vo.ProductVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {
    @Inject
    IProductDAO productDAO;

    @Override
    public List<ProductVO> getProdList(ProductSearchVO productSearch) {
            return productDAO.getProdList(productSearch);
    }

    @Override
    public ProductVO getProduct(int prodNo) {
       return productDAO.getProduct(prodNo);
    }
}
