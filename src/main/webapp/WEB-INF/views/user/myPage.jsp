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
<a href="/user/userModify.wow">회원정보수정</a>
<a href="/user/userPassChange.wow">비밀번호수정</a>
<div>
    <p>주문내역</p>
    <c:forEach items="${historyList}" var="history">
        <a href="/user/historyDetail.wow?buyNo=${history.buyNo}">

            <div class="border border-dark-subtle">
                <div>주문시간 <span>${history.buyDate}</span></div>
                <div>
                    <c:forEach items="${optList}" var="opt">
                        <c:if test="${history.buyNo == opt.userBuyNo}">
                            <div class="d-flex">
                                <div>
                                    <img class="img-thumbnail"
                                         src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${opt.prodImgFileName}&filePath=${opt.prodImgFilePath}"
                                         style="height: 100%;"/>
                                </div>
                                <div>
                                    <span>제품명 : ${opt.prodTitle} || </span>
                                    <span>옵션 1 : ${opt.optFirst} / </span>
                                    <span>옵션 2 : ${opt.optSecond} || </span>
                                    <span>구매수량 : ${opt.nowCnt}  || </span>
                                    <span>상품 당 총 가격 : ${opt.nowCnt * opt.prodPrice}</span>

                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div>가격 : <span>${history.totalPrice}</span></div>
            </div>
        </a>

    </c:forEach>
    <a href="/product/insertProduct.wow">asdf</a>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
