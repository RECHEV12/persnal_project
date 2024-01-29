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
<form action="/product/insertAsk.wow" method="post">
    <label for="askContent">문의 내용</label>
    <textarea id="askContent" name="askContent"></textarea>
<button type="submit">
    제출
</button>
</form>

<%@include file="/WEB-INF/inc/footer.jsp" %>
<%@include file="/WEB-INF/inc/script.jsp" %>
</body>
</html>
