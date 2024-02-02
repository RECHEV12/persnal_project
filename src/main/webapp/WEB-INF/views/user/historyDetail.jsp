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

<div>
${history}
    ${optList}

    <div class="border border-dark-subtle">
        <div>주문자 성함 : <span>${history.buyUserName}</span></div>
        <div>주문시간 : <span>${history.buyDate}</span></div>
        <div>요구사항 : <span>${history.userWant}</span></div>
        <div>우편번호 : <span>${history.userZip}</span></div>
        <div>주소 : <span>${history.userAdd1}</span></div>
        <div>상세주소 : <span>${history.userAdd2}</span></div>
        <div>
            <c:forEach items="${optList}" var="opt">
                <c:if test="${history.buyNo == opt.userBuyNo}">
                    <div>

                        <a href="/product/productView.wow?prodNo=${opt.prodNo}">
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
                        </a>
                        <div>
                            <c:if test="${opt.reviNo==0}">
                                <a href="/product/reviewRegist.wow?optNo=${opt.optNo}&buyNo=${history.buyNo}">
                                    <button>
                                        리뷰 작성
                                    </button>
                                </a>
                            </c:if>
                            <c:if test="${opt.reviNo!=0}">
                                리뷰를 이미 작성했습니다.
                            </c:if>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div>가격 : <span>${history.totalPrice}</span></div>
    </div>


</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
