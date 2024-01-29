package com.study.product.product.service;

import com.study.attach.vo.AttachVO;
import com.study.product.product.vo.ProductSearchVO;
import com.study.product.product.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IProductService {
    public List<ProductVO> getProdListByKeyword(ProductSearchVO productSearch);
    public List<ProductVO> getProdListByCategory(String category);

    public ProductVO getProduct(int prodNo);
    public int insertProduct(ProductVO product);
    public int getProdNo(@Param("userId") String prodUserId, @Param("title") String prodTitle);

    public void insertAttachList(List<AttachVO> list,String ParentNo);

}
