package com.study.product.web;

import com.study.common.web.CommonController;
import com.study.product.service.IOptionService;
import com.study.product.service.IProductService;
import com.study.product.service.ProductServiceImpl;
import com.study.product.vo.OptionVO;
import com.study.product.vo.ProductSearchVO;
import com.study.product.vo.ProductVO;
import com.study.user.vo.UserVO;
import org.apache.commons.io.FileUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.DispatcherServlet;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.http.HttpResponse;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;

@Controller
public class ProductController {
    @Inject
    IProductService productService;

    @Inject
    IOptionService optionService;


    //키워드 검색
    @RequestMapping("/product/productSearch.wow")
    public String prodSearch(Model model, ProductSearchVO productSearch) {
        List<ProductVO> prodList = productService.getProdListByKeyword(productSearch);
        model.addAttribute("prodList", prodList);
        model.addAttribute("productSearch", productSearch);
        return "product/productSearch";

    }

    //카테고리 클릭
    @RequestMapping("/product/productSearch.do")
    public String prodSearch2(Model model, String category) {
        List<ProductVO> prodList = productService.getProdListByCategory(category);
        model.addAttribute("prodList", prodList);
        model.addAttribute("category", category);
        return "product/productSearch";
    }

    @RequestMapping("/product/productView.wow")
    public String prodView(Model model, int prodNo, HttpServletRequest request, HttpSession session) {
        if (session.getAttribute("USER_INFO") == null) {
            return "redirect:/common/alert.wow";
        }
        ProductVO product = productService.getProduct(prodNo);
        List<OptionVO> optList = getOptList(prodNo);

        List<String> optFirst = new ArrayList<>();
        List<String> optSecond = new ArrayList<>();

        optFirst.add(optList.get(0).getOptFirst());
        optSecond.add(optList.get(0).getOptSecond());

        for (int i = 1; i < optList.size(); i++) {
            int cnt = 0;
            String nowFirst = optList.get(i).getOptFirst();
            for (String opt : optFirst) {
                if (opt.equals(nowFirst)) {
                    cnt++;
                }
            }
            if (cnt == 0) {
                optFirst.add(nowFirst);
            }
        }

        for (int i = 1; i < optList.size(); i++) {
            int cnt = 0;
            String nowSecond = optList.get(i).getOptSecond();
            for (String opt : optSecond) {
                if (opt.equals(nowSecond)) {
                    cnt++;
                }
            }
            if (cnt == 0) {
                optSecond.add(nowSecond);
            }
        }

        model.addAttribute("product", product);
        model.addAttribute("optFirst", optFirst);
        model.addAttribute("optSecond", optSecond);
        return "product/productView";
    }


    @RequestMapping("attach/showImg.wow")
    public ResponseEntity<byte[]> showImg(String fileName) throws IOException {
        String filePath = "/home/pc12/aspringproject/persnal_project/src/main/webapp/resources/image";
        File file = new File(filePath, fileName);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", Files.probeContentType(file.toPath()));
        ResponseEntity<byte[]> result = new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
        return result;
    }

    private List<OptionVO> getOptList(int prodNo) {
        return optionService.getOptList(prodNo);
    }

    @RequestMapping("/prod/getProdPrice.wow")
    @ResponseBody
    public OptionVO getOptPrice(int prodNo, String opt_first, String opt_second) {
        OptionVO option = optionService.getOptPrice(prodNo, opt_first, opt_second);
        System.out.println(option);
        return option;
    }

    @RequestMapping("/product/cart.wow")
    public String goCart(HttpSession session) {
        if (session.getAttribute("USER_INFO") == null) {
            return "redirect:/common/alert.wow";
        }
        return "product/cart";
    }

    @RequestMapping("/product/getCartItem")
    public String getCartItemData(Model model, int index, int prodNo, int optNo, String itemCnt) {
        ProductVO product = productService.getProduct(prodNo);
        OptionVO option = optionService.getOpt(optNo);
        model.addAttribute("product", product);
        model.addAttribute("option", option);
        model.addAttribute("index", index);
        model.addAttribute("itemCnt", Integer.parseInt(itemCnt));
        return "product/cartItem";
    }

    @RequestMapping("/product/buyItem.wow")
    public String buyItem(String prodName, String prodImage, String firstOpt, String secondOpt) {
        return "product/buyItem";
    }
}
