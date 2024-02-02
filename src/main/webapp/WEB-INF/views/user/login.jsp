<%@ page import="com.study.common.util.CookieUtils" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Login 05</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%
    CookieUtils cookieUtils = new CookieUtils(request);
    Cookie cookie = cookieUtils.getCookie("rememberMe");
    String chk = "";
    String userId = "";
    if (cookie!=null){
        userId = cookie.getValue();
        chk = "checked";
    }
%>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">

        </div>
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="wrap">
<%--                    <div class="img" style="background-image: url(images/bg-1.jpg);"></div>--%>
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign In</h3>
                                <c:if test='<%=request.getParameter("msg")!=null%>'>
                                    <p class="form-text"><%=request.getParameter("msg")%>
                                    </p>
                                </c:if>
                            </div>

                        </div>
                        <form action="/user/login.wow" class="signin-form" method="post">
                            <div class="form-group mt-3">
                                <input type="text" class="form-control" required id="userId" name="userId" value="<%=userId%>">
                                <label class="form-control-placeholder" for="userId">userId</label>
                            </div>
                            <div class="form-group">
                                <input id="password-field" type="password" class="form-control" required  id="userPass" name="userPass">
                                <label class="form-control-placeholder" for="userPass">Password</label>

                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-success rounded submit px-3">Sign In
                                </button>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-50 text-left">
                                    <label class="checkbox-wrap checkbox-primary mb-0">아이디 저장
                                        <input type="checkbox" id="rememberId" name="rememberId" value="true" <%=chk%>>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <div class="w-50 text-md-right">
                                    <p class="text-center">Not a member? <a data-toggle="tab" href="/user/signUp.wow">Sign Up</a></p>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>

