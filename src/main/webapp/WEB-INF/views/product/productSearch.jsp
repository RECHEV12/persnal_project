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
<div >
    <div class="container" >

        <c:forEach items="${prodList}" var="prod" varStatus="status">
            <c:if test="${status.index%5==0}">
                <div style="display: flex; justify-content: space-between">
            </c:if>
            <a class="card" style="text-align: center; width: 20%" href="/product/productView.wow?prodNo=${prod.prodNo}">
            <div>
                <div class="">
                    <img class="img-thumbnail"
                         src="<c:url value='/resources/image/b991c43be16d4014b11d62d11a118f81_1440.jpg'/>">
                </div>
                <div class="card-body" style="text-align: left">
                    <p class="card-subtitle" style="color: #6c757d; font-size: 14px">${prod.prodUserId}</p>
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


<div>
    <%@include file="/WEB-INF/inc/footer.jsp" %>
    <%@include file="/WEB-INF/inc/script.jsp" %>
</div>

</body>
</html>
