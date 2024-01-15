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
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0"
                                       src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."/></div>
            <div class="col-md-6">
                <a href="http://localhost:8080">
                    <div class="small mb-1">${product.prodUserId}</div>
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
        </div>
    </div>
</section>
<!-- Related items section-->

<section>

</section>
${product}

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>
