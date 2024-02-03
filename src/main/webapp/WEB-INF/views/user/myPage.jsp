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
<section style="background-color: #eee;">
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <img src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${user.userAttach.atchFileName}&filePath=${user.userAttach.atchPath}"
                             alt="avatar"
                             class="rounded-circle img-fluid" style="width: 150px;">
                        <h5 class="my-3">${user.userName}</h5>
                        <p class="text-muted mb-1">${user.userClass== 'S'?"물품 구입 / 판매 가능":"구매만 가능"}</p>
                        <p class="text-muted mb-4">${user.userIntroduce}</p>
                        <div class="d-flex justify-content-center mb-2">
                            <a href="/user/userModify.wow">
                                <button type="button" class="btn btn-outline-success ms-1">회원정보수정</button>
                            </a>
                            <a href="/user/userPassChange.wow">
                                <button type="button" class="btn btn-outline-primary ms-1">비밀번호수정</button>
                            </a>
                            <c:if test="${user.userClass== 'S'}">
                                <a href="/product/insertProduct.wow">
                                    <button type="button" class="btn btn-outline-secondary ms-1">제품등록</button>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="card mb-4 mb-lg-0">
                    <div class="card-body p-0">
                        <ul class="list-group list-group-flush rounded-3">
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <p class="mb-0">구매내역</p>
                            </li>

                            <c:forEach items="${historyList}" var="history">
                                <a href="/user/historyDetail.wow?buyNo=${history.buyNo}">
                                    <li class="list-group-item  justify-content-between align-items-center p-3">
                                        <div class="text-end">주문시간 <span>${history.buyDate}</span></div>
                                        <div>
                                            <c:forEach items="${optList}" var="opt">
                                                <c:if test="${history.buyNo == opt.userBuyNo}">
                                                    <img class="img-thumbnail"
                                                         src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${opt.prodImgFileName}&filePath=${opt.prodImgFilePath}"
                                                         style="height: 80px; width: 80px"/>
                                                    <div>제품명 : ${opt.prodTitle}</div>
                                                    <div class="d-flex">
                                                        <div>옵션 1 : ${opt.optFirst}</div>
                                                        <div> ||</div>
                                                        <div>옵션 2 : ${opt.optSecond}</div>
                                                    </div>
                                                    <div>구매수량 : ${opt.nowCnt}</div>
                                                    <div>가격 : <span>${history.totalPrice}</span></div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </li>
                                </a>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Full Name</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${user.userName}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${user.userEmail}</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Phone</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${user.userHp}</p>
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Address</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">${user.userAdd1} / ${user.userAdd2}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${user.userClass== 'S'}">
                    내 제품
                    <div class="d-flex row w-full">
                        <div class="">
                            <c:forEach items="${myProdList}" var="my">

                                <div class="card mb-4 mb-md-0">
                                    <div class="card-body  d-flex">
                                        <img class="img-thumbnail w-50"
                                             src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${my.prodImgFileName}&filePath=${my.prodImgFilePath}"
                                             style=""/>
                                        <div>
                                            <p class="mb-4">
                                                <span class="text-primary font-italic me-1">제품명 : </span> ${my.prodTitle}

                                            </p>
                                            <p class="mb-4">
                                                <span class="text-primary font-italic me-1">제품소개 : </span> ${my.prodContent}

                                            </p>
                                            <p class="mb-4">
                                                <span class="text-primary font-italic me-1">가격 : </span> ${my.prodPrice}
                                                원
                                            </p>
                                            <c:forEach items="${getMyProdOpt}" var="prodOpt">
                                                <c:forEach items="${prodOpt}" var="getOpt" varStatus="status">
                                                    <c:if test="${getOpt.optProdNo==my.prodNo}">
                                                        <p class="mb-4">
                                                            <span class="text-primary font-italic me-1">옵션${status.index + 1} :
                                                            </span>
                                                                ${getOpt.optFirst} / ${getOpt.optSecond}
                                                            <span>
                                                        </span>
                                                            <span>  재고 : ${getOpt.optStock}</span>
                                                        </p>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                        </div>
                                        <div>

                                            <a href="/product/productEdit.wow?prodNo=${my.prodNo}">
                                                <button class="btn btn-outline-secondary">제품 정보/옵션 수정</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>


<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
