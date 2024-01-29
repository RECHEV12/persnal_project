package com.study.product.product.web;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.common.vo.PagingVO;
import com.study.product.ask.service.IAskService;
import com.study.product.ask.vo.AskVO;
import com.study.product.option.service.IOptionService;
import com.study.product.product.service.IProductService;
import com.study.product.option.vo.OptionVO;
import com.study.product.product.vo.ProductSearchVO;
import com.study.product.product.vo.ProductVO;
import com.study.product.reviews.service.IReviewsService;
import com.study.product.reviews.vo.ReviewsVO;
import com.study.user.vo.UserVO;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class ProductController {
    @Inject
    IProductService productService;

    @Inject
    IOptionService optionService;
    @Inject
    IReviewsService reviewsService;

    @Inject
    IAttachDAO attachDAO;
    @Inject
    IAskService askService;

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
    public String prodView(Model model, int prodNo, HttpSession session) {
        if (session.getAttribute("USER_INFO") == null) {
            return "redirect:/common/alert.wow?msg=users&url=/user/login.wow";
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
        System.out.println(product);
        model.addAttribute("product", product);
        model.addAttribute("optFirst", optFirst);
        model.addAttribute("optSecond", optSecond);
        return "product/productView";
    }


    private List<OptionVO> getOptList(int prodNo) {
        return optionService.getOptList(prodNo);
    }

    @RequestMapping("/prod/getProdPrice.wow")
    @ResponseBody
    public OptionVO getOptPrice(int prodNo, String opt_first, String opt_second) {
        OptionVO option = optionService.getOptPrice(prodNo, opt_first, opt_second);
        return option;
    }

    @RequestMapping("/product/tabShow.wow")
    public String tabShow(Model model, String title, String prodNo, @ModelAttribute("paging") PagingVO paging) {
        if (title.equals("상품정보")) {
            List<AttachVO> imgList = attachDAO.getAttaches("prodDetail", prodNo);
            model.addAttribute("imgList", imgList);
            return "product/prodImg";
        } else if (title.equals("리뷰")) {
            paging.setTotalRowCount(reviewsService.getReviewCount(Integer.parseInt(prodNo)));
            paging.pageSetting();

            List<ReviewsVO> reviewsList = reviewsService.getReviewsList(paging,Integer.parseInt(prodNo));
            List<AttachVO> reviImgList = attachDAO.getAttachesForReviews("reviImg");
            List<OptionVO> optList = optionService.getOptList(Integer.parseInt(prodNo));

            model.addAttribute("reviewsList", reviewsList);
            model.addAttribute("reviImgList", reviImgList);
            model.addAttribute("optList", optList);
            return "product/prodReview";
        } else if (title.equals("문의")) {
            paging.setTotalRowCount(askService.getAskCount(Integer.parseInt(prodNo)));
            paging.pageSetting();
            List<AskVO> askList = askService.getAskList(paging, Integer.parseInt(prodNo));
            model.addAttribute(askList);
            return "product/prodAsk";
        } else {
            return "";
        }
    }

    @GetMapping("/product/insertProduct.wow")
    public String goInsertProduct() {
        return "product/insertProduct";
    }

    @PostMapping("/product/insertProduct.wow")
    public String doInsertProduct(ProductVO product, HttpSession session, @RequestParam("optFirst")String[] optFirstValues,   @RequestParam("optSecond")String[] optSecondValues) {
//        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
//        product.setProdUserId(userInfo.getUserId());
        System.out.println(Arrays.toString(optFirstValues));
        int resultRow = productService.insertProduct(product);
//        optionService.addOpt();
        return "redirect:/common/alert.wow?msg=failedChangePass&url=/user/userPassChange.wow";
    }
    @GetMapping("/product/insertAsk.wow")
    public String goInsertAsk(Model model, int prodNo) {
        model.addAttribute("prodNo",prodNo);
        return "product/insertAsk";
    }

    @PostMapping("/product/insertAsk.wow")
    public String doInsertAsk(AskVO ask,HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        ask.setAskUserId(userInfo.getUserId());
        int resultRow = askService.insertAsk(ask);
        if (resultRow==1){
        return "redirect:/common/alert.wow?msg=success&url=/product/productView.wow?prodNo="+ask.getAskParentNo();
        }else {
        return "redirect:/common/alert.wow?msg=failed&url=/product/productView.wow?prodNo="+ask.getAskParentNo();
        }
    }

}
