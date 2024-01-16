package com.study.product.web;

import com.study.product.service.ProductServiceImpl;
import com.study.product.vo.ProductSearchVO;
import com.study.product.vo.ProductVO;
import org.apache.commons.io.FileUtils;
import org.aspectj.util.FileUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
    @Inject
    ProductServiceImpl productService;

    @RequestMapping("/product/productSearch.wow")
    public String prodSearch(Model model, ProductSearchVO productSearch) {
        List<ProductVO> prodList = productService.getProdListByKeyword(productSearch);
        model.addAttribute("prodList", prodList);
        model.addAttribute("productSearch",productSearch);
        return "product/productSearch";
    }    @RequestMapping("/product/productSearch.do")
    public String prodSearch2(Model model, String category) {
        List<ProductVO> prodList = productService.getProdListByCategory(category);
        model.addAttribute("prodList", prodList);
        model.addAttribute("category",category);
        return "product/productSearch";
    }

    @RequestMapping("/product/productView.wow")
    public String prodView(Model model, int prodNo) {
        ProductVO product = productService.getProduct(prodNo);
        model.addAttribute("product", product);
        return "product/productView";
    }
    @RequestMapping("attach/showImg.wow")
    public ResponseEntity<byte[]> showImg(String fileName) throws IOException {
        String  filePath="/home/pc12/aspringproject/persnal_project/src/main/webapp/resources/image";
        File file = new File(filePath,fileName);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", Files.probeContentType(file.toPath()));
        ResponseEntity<byte[]> result = new ResponseEntity<>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
        return result;
    }

}
