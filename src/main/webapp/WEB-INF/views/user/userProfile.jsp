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

<section class="vh-100" style="background-color: #f4f5f7;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-6 mb-4 mb-lg-0">
                <div class="card mb-3" style="border-radius: .5rem;">

                    <div class="row g-0">
                        <div class="col-md-4 gradient-custom text-center text-black"
                             style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                            <img
                                    src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${user.userAttach.atchFileName}&filePath=${user.userAttach.atchPath}"
                                 alt="Avatar" class="img-fluid my-5" style="width: 100px;" />
                            <h5>${user.userName}</h5>
                            <p>${user.userClass== 'S'?"물품 구입 / 판매 가능":"구매만 가능"}</p>
                            <p>${user.userIntroduce}</p>
                            <%
                                UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
                                if (userInfo != null) request.setAttribute("userId", userInfo.getUserId());
                            %>
                            <c:if test="${userId != null}">
                                <c:if test="${userId eq user.userId}">
                                    <a href="/user/myPage.wow">
                                        <button class="btn btn-outline-secondary">회원관리</button>
                                    </a>
                                </c:if>
                            </c:if>

                            <i class="far fa-edit mb-5"></i>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body p-4">
                                <h6>Profile</h6>
                                <hr class="mt-0 mb-4">
                                <div class="row pt-1">
                                    <div class="col-6 mb-3">
                                        <h6>Email</h6>
                                        <p class="text-muted"> ${user.userEmail}</p>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <h6>Phone</h6>
                                        <p class="text-muted">${user.userHp}</p>
                                    </div>
                                </div>
                                <h6></h6>
                                <hr class="mt-0 mb-4">
                                <div class="row pt-1">
                                    <div class="col-6 mb-3">
                                        <h6>Birth</h6>
                                        <p class="text-muted">${user.userBirth}</p>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <h6>Gender</h6>
                                        <p class="text-muted">${user.userGender=='M'?"남성":"여성"}</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-start">
                                    <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                                    <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                    <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>
