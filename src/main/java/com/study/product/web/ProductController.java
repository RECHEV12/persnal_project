package com.study.product.web;

import com.study.product.service.ProductServiceImpl;
import com.study.product.vo.ProductSearchVO;
import com.study.product.vo.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
    @Inject
    ProductServiceImpl productService;

    @RequestMapping("/product/productSearch.wow")
    public String prodSearch(Model model, ProductSearchVO productSearch) {
        List<ProductVO> prodList = productService.getProdList(productSearch);
        model.addAttribute("prodList", prodList);
        return "product/productSearch";
    }

    @RequestMapping("/product/productView.wow")
    public String prodView(Model model, int prodNo) {
        ProductVO product = productService.getProduct(prodNo);
        model.addAttribute("product", product);
        return "product/productView";
    }

}
