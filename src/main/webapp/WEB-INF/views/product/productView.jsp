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
                <div>
<%--                        //온체인지--%>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>옵션 1</option>
                        <c:forEach items="${optFirst}" var="optOne">
                            <option value="${optOne}">${optOne}</option>
                        </c:forEach>

                    </select><select class="form-select" aria-label="Default select example">
                    <option selected>옵션 2</option>
                    <c:forEach items="${optSecond}" var="optTwo">
                    <option value="${optTwo}">${optTwo}</option>
                    </c:forEach>
                </select>
                </div>
                <div class="p-3 text-success-emphasis bg-success-subtle border border-success-subtle rounded-3" id="optDiv">
                    <div>옵션1 : <span>as</span></div>
                    <div>옵션2 : <span>as</span></div>
                    <div></div>
                    <div></div>


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
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5">
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
        </div>
    </div>
</section>
${product}

</body>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
<script>


</script>
</html>
