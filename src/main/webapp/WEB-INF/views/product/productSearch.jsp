<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

    <div class="container">
        <div class="mt-4 mb-4">

            <h2>"${productSearch.searchWord}${category}"에 대한 검색 결과</h2>
            <h5>${prodList.size()}건</h5>
        </div>
        <div>
            <c:forEach items="${prodList}" var="prod" varStatus="status">
                <c:if test="${status.index%5==0}">
                    <div class="mt-2 mb-2" style="display: flex;">
                </c:if>
                <a class="card Small shadow mx-2" style="text-align: center; width: 18%"
                   href="/product/productView.wow?prodNo=${prod.prodNo}">
                    <div>
                        <div class="">
                            <img class="img-thumbnail"
                                 src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${prod.prodImage}"/>
                        </div>
                        <div class="card-body" style="text-align: left">
                            <p class="card-subtitle" style="color: #6c757d; font-size: 14px">${prod.prodUserName}</p>
                            <p class="card-title" style="font-size: 20px">${prod.prodTitle}</p>
                            <p>${prod.prodPrice}원</p>
                            <p>5.0dd</p>
                        </div>
                    </div>
                </a>
                <c:if test="${status.index%5==4 || status.end}">
                    </div >
                </c:if>
            </c:forEach>

        </div>
    </div>
</div>


<div>
    <%@include file="/WEB-INF/inc/footer.jsp" %>
    <%@include file="/WEB-INF/inc/script.jsp" %>
</div>

</body>
</html>
