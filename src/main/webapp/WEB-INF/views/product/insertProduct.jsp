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
<form method="post" action="/product/insertProduct.wow" enctype="multipart/form-data">
    <label for="prodTitle">상품명</label>
    <input type="text" name="prodTitle" id="prodTitle">
    <label for="prodContent">상품설명</label>
    <input type="text" name="prodContent" id="prodContent">
    <label for="prodPrice">상품가격</label>
    <input type="text" name="prodPrice" id="prodPrice">
    <label for="title">상품구분</label>
    <input type="text" name="prodTitle" id="title">


    <label>옵션1</label>
    <input type="text" name="optFirst" >
    <input type="text" name="optFirst" >
    <label >옵션2</label>
    <input type="text" name="optSecond" >
    <input type="text" name="optSecond" >
    <button type="submit">ㄱㄱ</button>
</form>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
