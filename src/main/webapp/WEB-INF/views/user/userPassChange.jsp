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
<form action="/user/userPassChange.wow" method="post">
    <label for="nowPass">현재 비밀번호</label>
    <input type="password" id="nowPass" name="nowPass">
    <label for="nowPassChk">현재 비밀번호 확인</label>
    <input type="password" id="nowPassChk" name="nowPassChk">
    <label for="newPass">바꿀 비밀번호</label>
    <input type="password" id="newPass" name="newPass">
    <button type="submit">변경하기</button>
</form>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>

</html>
