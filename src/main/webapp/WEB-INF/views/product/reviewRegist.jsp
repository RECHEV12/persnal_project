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

<form method="post" action="/product/reviewRegist.wow" enctype="multipart/form-data" class="mt-6">
    <div class="card mt-5 w-75 m-auto">
        <div class="row pt-3">
            <div class="col-2">
                <input type="hidden" name="buyNo" value="${cart.userBuyNo}">
                <input type="hidden" name="reviParentNo" value="${cart.prodNo}">
                <input type="hidden" name="optNo" value="${cart.optNo}">
                <img src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${cart.prodImgFileName}&filePath=${cart.prodImgFilePath}">
            </div>
            <div class="col-10">
                <div class="comment-box ml-2">
                    <h4>리뷰 작성</h4>
                    <div class="rating">
                        <input type="radio" name="reviStar" value="1" id="1"><label for="1">☆1</label>
                        <input type="radio" name="reviStar" value="2" id="2"><label for="2">☆2</label>
                        <input type="radio" name="reviStar" value="3" id="3"><label for="3">☆3</label>
                        <input type="radio" name="reviStar" value="4" id="4"><label for="4">☆4</label>
                        <input type="radio" name="reviStar" value="5" id="5"><label for="5">☆5</label>
                    </div>
                    <div>
                        <div>제품명 : ${cart.prodTitle}  </div>
                        <div>
                            <span>옵션 1 : ${cart.optFirst} / </span>
                            <span>옵션 2 : ${cart.optSecond}</span>
                        </div>
                        <div>구매수량 : ${cart.nowCnt}개</div>
                    </div>
                    <div class="comment-area">
                        <textarea class="form-control" name="reviContent" placeholder="내용을 적어주세요" rows="4"></textarea>
                    </div>
                    <div class="comment-btns mt-2">
                        <div class="row">
                            <div class="col-12 d-flex">

                                <input type="file" name="boFiles" value="">
                                <input type="file" name="boFiles" value="">
                                <input type="file" name="boFiles" value="">
                                <input type="file" name="boFiles" value="">
                                <input type="file" name="boFiles" value="">

                            </div>
                            <div class="col-12 text-end">
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-outline-success">등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
