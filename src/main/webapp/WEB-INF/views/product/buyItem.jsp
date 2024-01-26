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
    <div>

        <input type="hidden" name="userId" value="${user.userId}">
        <div id="cartBox">
            <c:forEach items="${cartList}" var="cart">
                <div
                        name="cartItem"
                        data-opt="${cart.optNo}"
                        class="m-auto border border-dark-subtle"
                        style="display: flex; justify-content:center ;align-items: center; width: 80%; height: 15%"
                >

                    <div class="mx-3" style="width: 15%;  text-align: center">
                        <img class="img-thumbnail"
                             src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${cart.prodImage}"
                             style="height: 100%;"/>
                    </div>
                    <div class="mx-3" style="width: 50%">
                        <div>
                                ${cart.prodTitle}
                        </div>
                        <div>
                            <span>옵션1 : ${cart.optFirst} / </span>
                            <span>옵션2 : ${cart.optSecond}</span>
                        </div>
                        <div>
            <span>
             재고 :
            </span>
                            <span name="stock">${cart.optStock}</span>
                        </div>
                    </div>
                    <div class="d-flex" style="align-items: center; width: 20%" name="btnParent">
                        <div class="text-center col-6">
                            <diva>
                                수량
                            </diva>
                            <div class="border-bottom text-center">
                                <span>${cart.nowCnt}</span>
                            </div>
                            <div class="">
                                가격
                            </div>
                            <div name="prodPrice" data-price="${cart.prodPrice}">${cart.nowCnt * cart.prodPrice}</div>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>
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
        <div class="">
            <div> 상품 합계 금액 :
                <span id="sumPrice"></span>
            </div>
            <div> 배송비 : <span id="postPrice">무료</span></div>
            <div> 총 결재 금액 :<span id="totalPrice"></span>
                <input name="totalPrice" type="hidden" value="">
            </div>
        </div>
    </div>
<button class="btn btn-success" type="submit">결제하기</button>
</form>


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
