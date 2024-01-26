<%@ page import="com.study.user.vo.UserVO" %>
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
<%
    UserVO nowUser = (UserVO) session.getAttribute("USER_INFO");
    request.setAttribute("nowUserId", nowUser.getUserId());
%>
<div id="reviMainBox">


    <c:forEach items="${reviewsList}" var="review">
        <div class="border border-success-subtle " name="reviewBox" data-revi-no="${review.reviNo}">
            <div class="" name="top">
                <div class="d-flex" name="userInfo">
                    <p>
                            ${review.userName}
                    </p>
                    <p>
                            ${review.reviStar}
                    </p>
                </div>
                <div name="imgDiv">
                    <c:forEach items="${reviImgList}" var="reviImg">
                        <c:if test="${reviImg.atchParentNo == review.reviNo}">
                            <img class=""
                                 src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${reviImg.atchFileName}&filePath=${reviImg.atchPath}"
                                 style="height: 30%;width: 30%"/>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="d-flex" name="bottom">
                <div name="reviContent">
                        ${review.reviContent}
                </div>
                <div>
                    <c:if test="${nowUserId == review.reviUserId}">
                        <button class="btn btn-secondary">수정</button>
                        <button type="button" class="btn btn-danger" name="deleteReview">삭제</button>
                    </c:if>
                </div>
            </div>

        </div>
    </c:forEach>
</div>
</body>
<script>
    $("#reviMainBox").on("click", 'button[name="deleteReview"]', function (e) {
        if(confirm("정말 삭제하시겠습니까?")){
            $.ajax({
                url:"/reviews/deleteReview.wow",
                data:{reviNo:Number($($(e.target).parents("div[name=reviewBox]")).data("reviNo"))},
                method:'POST',
                success:function (resultRow){
                    console.log("리뷰 지우기",resultRow)

                }
            })
            $($(e.target).parents("div[name=reviewBox]")).remove()
        }

    })
</script>
</html>
