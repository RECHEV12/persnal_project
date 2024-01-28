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
${cart}

<form method="post" action="/product/reviewRegist.wow" enctype="multipart/form-data">
    <div>
        <div class="d-flex">
            <div>
                <img class="img-thumbnail"
                     src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${cart.prodImgFileName}&filePath=${cart.prodImgFilePath}"
                     style="height: 100%;"/>
            </div>
            <div>
                <span>제품명 : ${cart.prodTitle} || </span>
                <span>옵션 1 : ${cart.optFirst} / </span>
                <span>옵션 2 : ${cart.optSecond} || </span>
                <span>구매수량 : ${cart.nowCnt}  || </span>

            </div>
        </div>
        <div>
            별점
            <label for="star1">1</label>*
            <input type="radio" name="reviStar" id="star1" value="1">
            <label for="star2">2</label>
            <input type="radio" name="reviStar" id="star2" value="2">
            <label for="star3">3</label>
            <input type="radio" name="reviStar" id="star3" value="3">
            <label for="star4">4</label>
            <input type="radio" name="reviStar" id="star4" value="4">
            <label for="star5">5</label>
            <input type="radio" name="reviStar" id="star5" value="5">
            <input type="hidden" name="buyNo" value="${cart.userBuyNo}">
            <input type="hidden" name="reviParentNo" value="${cart.prodNo}">
            <input type="hidden" name="optNo" value="${cart.optNo}">
        </div>
        사진첨부(5개까지 가능)
        <input type="file" name="boFiles" value="">
        <input type="file" name="boFiles" value="">
        <input type="file" name="boFiles" value="">
        <input type="file" name="boFiles" value="">
        <input type="file" name="boFiles" value="">
        <textarea name="reviContent"></textarea>
        <button type="submit">등록</button>
    </div>
</form>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
