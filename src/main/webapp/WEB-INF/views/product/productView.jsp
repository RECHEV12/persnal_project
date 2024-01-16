<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>

    </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<body>
<!-- Product section-->
<section>
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="img-thumbnail"
                                       src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${product.prodImage}"
                                       style="height: 600px;width: 600px"/></div>
            <div class="col-md-6">
                <a href="/user/userProfile.wow?userId=${product.prodUserId}">
                    <div class="small mb-1">${product.prodUserName}</div>
                </a>
                <h1 class="display-5 fw-bolder">${product.prodTitle}</h1>
                <div class="fs-5 mb-5" style="display: flex">

                    <div class="col-6" style="text-align: left">
                        <%--                    <span class="text-decoration-line-through">$45.00</span>--%>
                        <span>${product.prodPrice}원</span>
                    </div>

                    <div class="col-6" style="text-align: right">
                        <span>ㅁㄴㅇㄹ</span>
                    </div>

                </div>
                <div class="d-flex my-4" name="option"
                     style="border: #6c757d 1px solid; height: 50px; align-items: center">
                    옵션을 선택해주세요.
                </div>
                <div class="my-4">
                    <div class="d-flex">

                        <button class="btn btn-outline-dark flex-shrink-0 col-6" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                        </button>

                        <button class="btn btn-outline-dark flex-shrink-0 col-6" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            선물하기
                        </button>
                    </div>

                    <div>
                        <button class="btn btn-outline-dark flex-shrink-0 col-12" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            바로구매
                        </button>
                    </div>
                </div>
                <div class="my-2">
                    배송비 : 무료배송
                </div>
                <div class="my-2">
                    배송일 3일 이내
                </div>
                <div class="my-2">
                    수량 :100개
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <ul class="nav nav-tabs px-4 px-lg-5 my-5">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" name="prodView">상품정보</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" name="prodView">리뷰</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" name="prodView">문의</a>
        </li>

    </ul>
</section>
${product}

</body>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
<script>
    let optChk = 1;
    const tab = document.querySelectorAll(".nav-link[name='prodView']");
    tab.forEach((v, i) => {
        v.addEventListener("click", function (e) {
            e.preventDefault();
            tabChk(e.target);
        })
    })

    const tabChk = (target) => {
        tab.forEach((v, i) => {
            if (v === target) {
                v.className = "nav-link active"
            } else {
                v.className = "nav-link"
            }
        })

    }
    $("div[name='option']").on("click", (e) => {
        const div = e.target;
        if (optChk === 1) {
            optChk = 2;
            div.textContent = "옵션 선택"
        } else {
            optChk = 1;
            div.textContent = "옵션을 선택해주세요."
        }

    })
</script>
</html>
