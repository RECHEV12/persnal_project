package com.study.product.product.service;


import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.product.option.vo.OptionVO;
import com.study.product.product.dao.IProductDAO;
import com.study.product.product.vo.ProductSearchVO;
import com.study.product.product.vo.ProductVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {
    @Inject
    IProductDAO productDAO;
    @Inject
    IAttachDAO attachDAO;

    @Override
    public List<ProductVO> getProdListByKeyword(ProductSearchVO productSearch) {
        return productDAO.getProdListByKeyword(productSearch);
    }

    @Override
    public List<ProductVO> getProdListByCategory(String category) {
        return productDAO.getProdListByCategory(category);
    }

    @Override
    public ProductVO getProduct(int prodNo) {
        return productDAO.getProduct(prodNo);
    }

    @Override
    public int insertProduct(ProductVO product) {

        return productDAO.insertProduct(product);
    }

    @Override
    public int getProdNo(String prodUserId, String prodTitle) {
        return productDAO.getProdNo(prodUserId, prodTitle);
    }

    @Override
    public void insertAttachList(List<AttachVO> list, String ParentNo) {
        for (AttachVO attach : list) {
            attach.setAtchParentNo(ParentNo);
            attachDAO.insertAttach(attach);
        }
    }


}
