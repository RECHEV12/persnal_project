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
<div>
    <form action="/user/signUp.wow" method="post">
        <div>
            <div>
                <label for="userName">
                    아이디
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    비밀번호
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    이름
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    생일
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    성별
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    전화번호
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    이메일
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    우편번호
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    주소1
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    주소2
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    주문자 성함
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    주문자 성함
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    주문자 성함
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    주문자 성함
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
            <div>
                <label for="userName">
                    주문자 성함
                </label>
                <input id="userName" name="userName" type="text" value="${user.userName}">
            </div>
        </div>
        <button class="btn btn-success" type="submit">가입하기</button>
    </form>
</div>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>
