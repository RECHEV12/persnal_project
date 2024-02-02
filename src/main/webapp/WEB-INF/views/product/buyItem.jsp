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
<form method="post" action="/cart/buyItem.wow">
    <input type="hidden" name="userId" value="${user.userId}">
<div class="container py-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12">
            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                <div class="card-body p-0">
                    <div class="row g-0">
                        <div class="">
                            <div class="p-5" id="cartBox">
                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <h1 class="fw-bold mb-0 text-black">구매하기</h1>
                                    <h6 class="mb-0 text-muted" id="cartTotalCnt"></h6>
                                </div>
                                <hr class="my-4">
                                <c:forEach items="${cartList}" var="cart">
                                    <div name="cartItem"
                                         data-opt="${cart.optNo}"
                                         class="row mb-4 d-flex justify-content-between align-items-center">

                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                    src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${cart.prodImgFileName}&filePath=${cart.prodImgFilePath}"
                                                    class="img-fluid rounded-3">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-muted"> ${cart.prodTitle}</h6>
                                            <h6 class="text-black mb-0"><span>옵션1 : ${cart.optFirst} / </span>
                                                <span>옵션2 : ${cart.optSecond}</span></h6>
                                            <h6 class="text-black mb-0">재고 : ${cart.optStock}</h6>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">


                                            <input name="prodCnt" value="${cart.nowCnt}" type="number"
                                                   class="form-control form-control-sm"/>


                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1" name="prodPrice"
                                             data-price="${cart.prodPrice}">${cart.nowCnt * cart.prodPrice}
                                        </div>

                                        <hr class="my-4">
                                    </div>
                                </c:forEach>
                                <div class="pt-5">
                                    <h6 class="mb-0"><a href="/cart/cart.wow?userId=${user.userId}" class="text-body"><i
                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to cart</a></h6>
                                </div>
                                <div class="p-5">


                                    <hr class="my-4">
                                    <div class="d-flex justify-content-between mb-5">
                                        <h5 class="text-uppercase">Total price</h5>
                                        <h5><span id="totalPrice"></span></h5>
                                    </div>
                                    <a href="/product/buyItem.wow?userId=${loginUserId}">
                                        <button type="submit" class="btn btn-success btn-success btn-lg"
                                                data-mdb-ripple-color="green">결제하기
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form>

    <div>

        <div>
            <label for="userName">
                주문자 성함
            </label>
            <input id="userName" name="userName" type="text" value="${user.userName}">
            <label for="userHp">
                전화번호
            </label>
            <input id="userHp" name="userHp" type="text" value="${user.userHp}">
            <label for="userZip">
                우편번호
            </label>
            <input id="userZip" name="userZip" type="text" value="${user.userZip}">
            <label for="userAddr1">
                주소 1
            </label>
            <input id="userAddr1" name="userAdd1" type="text" value="${user.userAdd1}">
            <label for="userAddr2">
                주소 2
            </label>
            <input id="userAddr2" name="userAdd2" type="text" value="${user.userAdd2}">
            <label for="userWant">
                남기실 말씀
            </label>
            <input id="userWant" name="userWant" type="text" value="">
        </div>




<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
<script>
    const sumPrice = () => {
        let sum = 0;
        $("div[name=prodPrice]").map((i, v) => {
            sum += Number($(v).text())
        })
        $("#sumPrice").text(sum)

        if($("#postPrice").text()!=="무료"){
            sum+=Number($("#postPrice").text())
        }
        $("#totalPrice").text(sum)
        $("input[name=totalPrice]").val(sum)
    }
    sumPrice();
</script>
</html>
