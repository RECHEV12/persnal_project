package com.study.product.product.web;

import com.study.attach.dao.IAttachDAO;
import com.study.attach.vo.AttachVO;
import com.study.common.util.StudyAttachUtils;
import com.study.common.vo.CodeVO;
import com.study.common.vo.PagingVO;
import com.study.product.ask.service.IAskService;
import com.study.product.ask.vo.AskReplyVO;
import com.study.product.ask.vo.AskVO;
import com.study.product.option.service.IOptionService;
import com.study.product.product.service.IProductService;
import com.study.product.option.vo.OptionVO;
import com.study.product.product.vo.ProductSearchVO;
import com.study.product.product.vo.ProductVO;
import com.study.product.reviews.service.IReviewsService;
import com.study.product.reviews.vo.ReviewsVO;
import com.study.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
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

    @Inject
    StudyAttachUtils attachUtils;

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
        List<OptionVO> optList = optionService.getOptList(prodNo);

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


    @RequestMapping("/prod/getProdPrice.wow")
    @ResponseBody
    public OptionVO getOptPrice(int prodNo, String opt_first, String opt_second) {
        OptionVO option = optionService.getOptPrice(prodNo, opt_first, opt_second);
        return option;
    }

    @RequestMapping("/product/tabShow.wow")
    public String tabShow(Model model, String title, String prodNo, @ModelAttribute("paging") PagingVO paging, String prodUserId) {

        if (title.equals("상품정보")) {
            List<AttachVO> imgList = attachDAO.getAttaches("prodDetail", prodNo);
            model.addAttribute("imgList", imgList);
            return "product/prodImg";
        }
        if (title.equals("리뷰")) {
            paging.setTotalRowCount(reviewsService.getReviewCount(Integer.parseInt(prodNo)));
            paging.pageSetting();
            List<ReviewsVO> reviewsList = reviewsService.getReviewsList(paging, Integer.parseInt(prodNo));
            List<AttachVO> reviImgList = attachDAO.getAttachesForReviews("reviImg");
            List<OptionVO> optList = optionService.getOptList(Integer.parseInt(prodNo));
            double totalStar = 0;
            for (ReviewsVO reviews : reviewsList) {
                totalStar += reviews.getReviStar();
            }
            totalStar = totalStar / reviewsList.size();

            model.addAttribute("totalStar", totalStar);
            model.addAttribute("reviewsList", reviewsList);
            model.addAttribute("reviImgList", reviImgList);
            model.addAttribute("optList", optList);
            return "product/prodReview";
        }
        if (title.equals("문의")) {
            paging.setTotalRowCount(askService.getAskCount(Integer.parseInt(prodNo)));
            paging.pageSetting();
            List<AskVO> askList = askService.getAskList(paging, Integer.parseInt(prodNo));
            List<AskReplyVO> askReplyList = askService.getAskReplyList();
            model.addAttribute(askList);
            model.addAttribute("prodUserId", prodUserId);
            model.addAttribute("askReplyList", askReplyList);
            return "product/prodAsk";
        }
        return "";
    }

    @GetMapping("/product/insertProduct.wow")
    public String goInsertProduct(Model model) {
        List<CodeVO> codeList = optionService.getCodeList();
        model.addAttribute("codeList", codeList);
        return "product/insertProduct";
    }

    @PostMapping("/product/insertProduct.wow")
    public String doInsertProduct(ProductVO product, HttpSession session,
                                  @RequestParam("optFirst") String[] optFirstValues, @RequestParam("optSecond") String[] optSecondValues,
                                  @RequestParam("optStock") int[] optStockValues, MultipartFile boFiles, MultipartFile[] detailImg) {

        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        product.setProdUserId(userInfo.getUserId());
        int resultRow = productService.insertProduct(product);
        if (resultRow == 1) {
            int prodNo = productService.getProdNo(product.getProdUserId(), product.getProdTitle());
            for (int i = 0; i < optFirstValues.length; i++) {
                String first = optFirstValues[i];
                String second = optSecondValues[i];
                int stock = optStockValues[i];
                OptionVO option = new OptionVO();
                option.setOptFirst(first);
                option.setOptSecond(second);
                option.setOptStock(stock);
                option.setOptProdNo(prodNo);
                optionService.insertOpt(option);
            }
            try {
                AttachVO attach = attachUtils.getAttachByMultipart(boFiles, "prodImg", "prod");
                List<AttachVO> attachListByMultiparts = attachUtils.getAttachListByMultiparts(detailImg, "prodDetail", "prod");
                productService.insertAttachList(attachListByMultiparts, String.valueOf(prodNo));
                attach.setAtchParentNo(String.valueOf(prodNo));
                attachDAO.insertAttach(attach);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            return "redirect:/common/alert.wow?msg=success&url=/user/myPage.wow";
        }
        return "redirect:/common/alert.wow?msg=failed&url=/user/myPage.wow";
    }

    @GetMapping("/product/productEdit.wow")
    public String goProductEdit(Model model, int prodNo) {
        ProductVO product = productService.getProduct(prodNo);
        List<CodeVO> codeList = optionService.getCodeList();
        List<AttachVO> imgList = attachDAO.getAttaches("prodDetail", String.valueOf(prodNo));
        List<OptionVO> optList = optionService.getOptList(prodNo);
        model.addAttribute("imgList", imgList);
        model.addAttribute("codeList", codeList);
        model.addAttribute("product", product);
        model.addAttribute("optList", optList);
        return "product/productEdit";
    }

    @PostMapping("/product/productEdit.wow")
    public String doProductEdit(ProductVO product, MultipartFile boFiles, MultipartFile[] detailImg, int[] delAtchNos) {
        int resultRow = productService.modifyProduct(product);
        if (resultRow == 1) {
            if (!boFiles.isEmpty()) {
                try {
                    List<AttachVO> attaches = attachDAO.getAttaches("prodImg", String.valueOf(product.getProdNo()));
                    int[] arr = new int[1];
                    arr[0] = attaches.get(0).getAtchNo();
                    attachDAO.deleteAtches(arr);

                    AttachVO attach = attachUtils.getAttachByMultipart(boFiles, "prodImg", "prod");
                    attach.setAtchParentNo(String.valueOf(product.getProdNo()));
                    attachDAO.insertAttach(attach);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            for(MultipartFile m : detailImg){
             if (!m.isEmpty()){
                 try {
                     AttachVO attach = attachUtils.getAttachByMultipart(m, "prodDetail", "prod");
                     attach.setAtchParentNo(String.valueOf(product.getProdNo()));
                     attachDAO.insertAttach(attach);
                 } catch (IOException e) {
                     throw new RuntimeException(e);
                 }
             }
            }
            if (delAtchNos != null) attachDAO.deleteAtches(delAtchNos);
            return "redirect:/common/alert.wow?msg=success&url=/user/myPage.wow";
        }
        return "redirect:/common/alert.wow?msg=failed&url=/user/myPage.wow";

    }
    @RequestMapping("/product/productDelete.wow")
    public String deleteProduct(int prodNo){
        int resultRow = productService.deleteProduct(prodNo);
        if (resultRow==1){
            return "redirect:/common/alert.wow?msg=success&url=/user/myPage.wow";
        }else {
            return "redirect:/common/alert.wow?msg=failed&url=/user/myPage.wow";
        }
    }

}
