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
    <div class="container-fluid">
        <div class="container">
            <!-- Title -->
            <div class="d-flex justify-content-between align-items-center py-3">
                <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> 주문번호 #${history.buyNo}</h2>
            </div>

            <!-- Main content -->
            <div class="row">
                <div class="col-lg-8">
                    <!-- Details -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="mb-3 d-flex justify-content-between">
                                <div>
                                    <span class="me-3">${history.buyDate}</span>
                                    <span class="badge rounded-pill bg-info">당일배송</span>
                                </div>
                            </div>
                            <table class="table table-borderless">
                                <tbody>
                                <c:forEach items="${optList}" var="opt">
                                    <c:if test="${history.buyNo == opt.userBuyNo}">
                                        <tr>
                                            <td>
                                                <div class="d-flex mb-2">
                                                    <div class="flex-shrink-0">
                                                        <img
                                                                src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${opt.prodImgFileName}&filePath=${opt.prodImgFilePath}"
                                                                alt=""
                                                                width="100" class="img-fluid">
                                                    </div>
                                                    <div class="flex-lg-grow-1 ms-3">
                                                        <h6 class="small mb-0"><a
                                                                href="/product/productView.wow?prodNo=${opt.prodNo}"
                                                                class="text-reset">
                                                                ${opt.prodTitle}
                                                        </a></h6>
                                                        <span class="small"> ${opt.optFirst} / ${opt.optSecond}</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td> 갯수 : ${opt.nowCnt}</td>
                                            <td class="text-end"> ${opt.nowCnt * opt.prodPrice}원</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="fw-bold">
                                    <td colspan="2">TOTAL</td>
                                    <td class="text-end">${history.totalPrice}원</td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <!-- Payment -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h3 class="h6">주소</h3>
                                    ${history.userZip}<br>
                                    ${history.userAdd1}<br>
                                    ${history.userAdd2}<br>
                                </div>
                                <div class="col-lg-6">
                                    <h3 class="h6">정보</h3>
                                    <address>
                                        <strong>${history.buyUserName}</strong><br>
                                        전화번호 : ${history.userHp}
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!-- Customer Notes -->
                    <div class="card mb-4 h-50">
                        <div class="card-body">
                            <h3 class="h6">주문 요구사항</h3>
                            <p>${history.userWant}</p>
                        </div>
                    </div>
                    <div class="card mb-4 h-25">
                        <!-- Shipping information -->
                        <div class="card-body">
                            <h3 class="h6">리뷰 작성</h3>
                            <span>
                                <c:if test="${opt.reviNo==0}">
                                <a href="/product/reviewRegist.wow?optNo=${opt.optNo}&buyNo=${history.buyNo}">
                                    <button class="btn btn-outline-secondary">
                                        리뷰 작성하러 가기
                                    </button>
                                </a>
                                </c:if>
                                  <c:if test="${opt.reviNo!=0}">
                                    <p>
                                     리뷰를 이미 작성했습니다.
                                    </p>
                                  </c:if>
                            </span>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
