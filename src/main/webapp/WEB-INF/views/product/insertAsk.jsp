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
<form action="/ask/insertAsk.wow" method="post">
    <div class="card mt-5 w-75 m-auto">
        <div class="row pt-3">
                <input type="hidden" name="askParentNo" value="${product.prodNo}">
            <div class="col-10 m-auto">
                <div class="comment-box ml-2">
                    <h4>문의하기</h4>
                    <div>
                        <div>제품명 : ${product.prodTitle}</div>
                    </div>
                    <div class="comment-area">
                        <textarea class="form-control" name="askContent" id="askContent" placeholder="내용을 적어주세요" rows="4"></textarea>
                    </div>
                    <div class="comment-btns mt-2">
                        <div class="row">

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
