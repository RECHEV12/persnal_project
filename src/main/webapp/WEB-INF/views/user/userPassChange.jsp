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

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">

        </div>
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="wrap">
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign In</h3>
                            </div>

                        </div>
                        <form action="/user/userPassChange.wow" class="signin-form" method="post">
                            <div class="form-group mt-3">
                                <input type="password" class="form-control" required id="nowPass" name="nowPass">
                                <label class="form-control-placeholder" for="nowPass">현재 비밀번호</label>
                            </div>
                            <div class="form-group">
                                <input id="password-field" type="password" class="form-control" required id="nowPassChk"
                                       name="nowPassChk">
                                <label class="form-control-placeholder" for="nowPassChk">현재 비밀번호 확인</label>
                            </div>
                            <div class="form-group mt-3">
                                <input type="password" class="form-control" required id="newPass" name="newPass">
                                <label class="form-control-placeholder" for="newPass">바꿀 비밀번호</label>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-success rounded submit px-3">변경하기
                                </button>
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
<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>

