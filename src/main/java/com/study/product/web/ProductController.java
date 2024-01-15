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
    public String goSearch(Model model, ProductSearchVO productSearch) {
        List<ProductVO> prodList = productService.getProdList(productSearch);

        System.out.println(prodList);
        model.addAttribute("prodList", prodList);
        return "product/productSearch";
    }

}
